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
import java.util.logging.SimpleFormatter;

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
	
	//페이지 이동 OR 데이터 전달(todo, proj)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		//dashboard에서 요청할 때(fn값이 PAGE), calendar.jsp로 페이지 이동 시켜줍니다
		String fn = req.getParameter("fn");
		if (fn.equals("PAGE")) {
			RequestDispatcher view = req.getRequestDispatcher("/WEB-INF/views/business/calendar.jsp");
			view.forward(req, resp);
		}
		
		//현재 로그인한 유저가 참가한 project와 todolist를 가져와 calendar.jsp에 보내줍니다
		HttpSession session = req.getSession();
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		JSONArray jsonArray = new JSONArray();
		
		//프로젝트 멤버에 포함되어있는지 확인하는 sql문
		String sql = "SELECT * FROM project WHERE proj_members REGEXP ?";
			
		try {
			//현재 로그인한 유저의 pk num
			String sessionID = (String)session.getAttribute("sessionID");
				
			pool  = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			stmt = conn.prepareStatement(sql);
				
			stmt.setString(1, "(?<=,|^)"+sessionID+"(?=,|$)"); //정규표현식 사용
			rs = stmt.executeQuery();
				
			while(rs.next()) {
				//json 객체 생성
				JSONObject resJson = new JSONObject();

				resJson.put("title", rs.getString("proj_name"));
				resJson.put("start", rs.getString("proj_startdate"));
				resJson.put("end", rs.getString("proj_enddate"));
				resJson.put("content" , rs.getString("proj_desc"));
				
				//json배열에 객체 담기
				jsonArray.put(resJson);
			}
			
			//현재 로그인한 유저의 todo 확인하는 sql문
			sql = "SELECT * FROM todo WHERE todo_fk_user_num = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, sessionID);
				
			rs = stmt.executeQuery();
			while(rs.next()) {
				JSONObject resJson = new JSONObject();
			
				resJson.put("title", rs.getString("todo_title"));
				resJson.put("start", rs.getString("todo_start"));
				resJson.put("end", rs.getString("todo_end"));
				resJson.put("content", rs.getString("todo_content"));
				resJson.put("num", rs.getInt("todo_pk_num")); //todo 데이터는 todo_pk_num을 함께 넘겨줍니다
				jsonArray.put(resJson);
				
			}
				
		} catch (Exception e) { System.out.println("CalendarServlet"+e);}
			
			resp.setContentType("application/json");
			PrintWriter out = resp.getWriter();
			out.print(jsonArray);
			out.flush();
	}
	
	//데이터 삭제(todo)
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//전달받은 json 객체를 읽습니다
		StringBuilder sb = new StringBuilder(); 
		BufferedReader reader = req.getReader();
			
		String line;
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
			
		JSONObject reqjson = new JSONObject(sb.toString().trim());
		
		//json객체에서 todo_pk_num 값을 가져옵니다
		int num = reqjson.getInt("pknum");
		
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
			
		try {
				
			pool  = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
				
			//삭제실행	
			String sql = "DELETE FROM todo WHERE todo_pk_num = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1,num);
			
			stmt.executeUpdate();
				
				
		} catch (Exception e) { System.out.println("CalendarServlet"+e);}
		
	}
	
	//데이터 수정(todo)
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//전달받은 json 객체를 읽습니다
		StringBuilder sb = new StringBuilder(); 
		BufferedReader reader = req.getReader();
			
		String line;
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
		
		JSONObject reqjson = new JSONObject(sb.toString().trim());
		
		//데이터 수정을 위해 todo_pk_num과 시작날짜, 종료날짜를 읽어옵니다
		int num = reqjson.getInt("pknum");
		String start = reqjson.getString("startDate");
		String end = reqjson.getString("endDate");
		
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			pool  = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			//수정 실행			
			String sql = "UPDATE todo SET todo_start = ?, todo_end = ? WHERE todo_pk_num = ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, start);
			stmt.setString(2, end);
			stmt.setInt(3, num);
				
			stmt.executeUpdate();
			
		} catch (Exception e) { System.out.println("CalendarServlet"+e);}
		
		
	}
	
	//데이터 추가(todo)
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전달받은 json 객체를 읽습니다
		req.setCharacterEncoding("UTF-8");
			
		StringBuilder sb = new StringBuilder(); 
		BufferedReader reader = req.getReader();
			
		String line;
		while((line = reader.readLine()) != null) {
			sb.append(line);
		}
			
		JSONObject reqjson = new JSONObject(sb.toString().trim());
		
		//todo 제목과 내용, 시작날짜, 종료날짜를 읽어옵니다
		String name = reqjson.getString("title");
		String content = reqjson.getString("content");
		String startDate = reqjson.getString("start");
		String endDate = reqjson.getString("end");
			
			
		HttpSession session = req.getSession();
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
			
		try {
			//현재 로그인한 사용자의 pk num
			String sessionID = (String)session.getAttribute("sessionID");
				
			pool  = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
				
			//데이터 넣기
			String sql = "INSERT INTO todo(todo_fk_user_num, todo_title, todo_content, todo_start, todo_end) VALUES (?,?,?,?,?)";
				
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, sessionID);
			stmt.setString(2, name);
			stmt.setString(3, content);
			stmt.setString(4, startDate);
			stmt.setString(5, endDate);
				
			stmt.executeUpdate();
				
				
		} catch (Exception e) { System.out.println("CalendarServlet"+e);}
	}
		
}
