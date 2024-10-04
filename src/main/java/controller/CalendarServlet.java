package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import db.dbcp.DBConnectionMgr;

@WebServlet("/calendar")
public class CalendarServlet extends HttpServlet{
	
	//get방식 요청이 오면 페이지 이동
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher view = req.getRequestDispatcher("/WEB-INF/views/business/calendar.jsp");
		view.forward(req, resp);
	}
	
	//작업중
	//post방식 요청이 오면 DB작업
	//fn = GET : DB에서 데이터를 꺼내와 JSON 형태로 전달
	//fn = SET : DB에 데이터 추가 (todo)
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String url = "";
		String fn = req.getParameter("fn");

		if (fn.equals("GET")) {
			HttpSession session = req.getSession();
			DBConnectionMgr pool = null;
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			JSONArray jsonArray = new JSONArray();
			
			String sql = "SELECT * FROM project WHERE proj_members REGEXP ?";
			
			try {
				String sessionID = (String)session.getAttribute("sessionID");
				
				pool  = DBConnectionMgr.getInstance();
				conn = pool.getConnection();
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, "(?<=,|^)"+sessionID+"(?=,|$)");
				rs = stmt.executeQuery();
				
				while(rs.next()) {

					JSONObject resJson = new JSONObject();

					resJson.put("title", rs.getString("proj_name"));
					resJson.put("start", rs.getDate("proj_startdate"));
					resJson.put("end", rs.getDate("proj_enddate"));
					jsonArray.put(resJson);
				}
				
				sql = "SELECT * FROM todo WHERE todo_fk_user_num = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, sessionID);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					JSONObject resJson = new JSONObject();

					resJson.put("title", rs.getString("todo_title"));
					resJson.put("start", rs.getDate("todo_start"));
					resJson.put("end", rs.getDate("todo_end"));
					jsonArray.put(resJson);
				}
				
			} catch (Exception e) { System.out.println("CalendarServlet"+e);}
			
			resp.setContentType("application/json");
			PrintWriter out = resp.getWriter();
			out.print(jsonArray);
			out.flush();
		}
		else if(fn.equals("SET")){
			req.setCharacterEncoding("UTF-8");
			
			StringBuilder sb = new StringBuilder(); 
			BufferedReader reader = req.getReader();
			
			String line;
			while((line = reader.readLine()) != null) {
				sb.append(line);
			}
			
			JSONObject reqjson = new JSONObject(sb.toString().trim());
			String name = reqjson.getString("title");
			String startDate = reqjson.getString("start");
			String endDate = reqjson.getString("end");
			
			
			HttpSession session = req.getSession();
			DBConnectionMgr pool = null;
			Connection conn = null;
			PreparedStatement stmt = null;
			
			try {
				
				String sessionID = (String)session.getAttribute("sessionID");
				
				pool  = DBConnectionMgr.getInstance();
				conn = pool.getConnection();
				
				
				String sql = "INSERT INTO todo(todo_fk_user_num, todo_title, todo_start, todo_end) VALUES (?,?,?,?)";
				
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, sessionID);
				stmt.setString(2, name);
				stmt.setString(3, startDate);
				stmt.setString(4, endDate);
				
				stmt.executeUpdate();
				
				
			} catch (Exception e) { System.out.println("CalendarServlet"+e);}
			
			
		}
		
		
	}
}
