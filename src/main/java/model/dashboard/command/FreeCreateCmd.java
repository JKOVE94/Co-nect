package model.dashboard.command;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;
import model.Icommand;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class FreeCreateCmd implements Icommand{

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        	try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		resp.setCharacterEncoding("utf-8");
		
		PostDTO dto = new PostDTO();
		
		dto.setPost_kind(Integer.parseInt(req.getParameter("post_kind")));
		dto.setPost_targetnum(req.getParameter("post_targetnum"));
		dto.setPost_name(req.getParameter("post_name"));
		dto.setPost_import(req.getParameter("post_import"));
		dto.setPost_content(req.getParameter("post_content"));
		dto.setPost_tag(req.getParameter("post_tag"));
		dto.setPost_fk_dpart_num(Integer.parseInt(req.getParameter("post_fk_dpart_num")));
		dto.setPost_fk_user_num(Integer.parseInt(req.getParameter("post_fk_user_num")));
		dto.setPost_fk_comp_num(Integer.parseInt(req.getParameter("post_fk_comp_num")));
		
		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
					
			String sql = "INSERT INTO post(post_kind, post_targetnum,"+
					"post_name, post_regdate, post_import, post_content, post_tag,"+
					"post_fk_dpart_num, post_fk_user_num, post_fk_comp_num) VALUES(?,?,?,NOW(),?,?,?,?,?,?)";
			
			//connection에 prepareStatement로 query
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, dto.getPost_kind());
			stmt.setString(2, dto.getPost_targetnum());
			stmt.setString(3, dto.getPost_name());
			stmt.setString(4, dto.getPost_import());
			stmt.setString(5, dto.getPost_content());
			stmt.setString(6, dto.getPost_tag());
			stmt.setInt(7, dto.getPost_fk_dpart_num());
			stmt.setInt(8, dto.getPost_fk_user_num());
			stmt.setInt(9, dto.getPost_fk_comp_num());
			
			stmt.executeUpdate(); //DML명령어 때 사용
			
			//response.sendRedirect("dashboard.jsp");
			
		} catch (Exception e) {
			System.out.println("setpost : "+e);
		} finally {
			if (conn != null) {
				pool.freeConnection(conn,stmt);
			}
		}
	
		return "";
        //return "/WEB-INF/views/dashboard/free/freeList.jsp"; 
    }
}
