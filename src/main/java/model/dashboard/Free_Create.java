package model.dashboard;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;

public class Free_Create{
	
	public void setPost(PostDTO dto) {
	
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
	}
	
}
