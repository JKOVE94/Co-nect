package model.dashboard;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbcp.DBConnectionMgr;
import db.dto.ProjectDTO;

public class Proj_Create {
	
	public void setPost(ProjectDTO dto) {
		
		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
					
			String sql = "INSERT INTO project(proj_name, proj_desc,"+
					"proj_status, proj_members, Proj_import, proj_tag, proj_tagcol,"+
					"proj_fk_user_num, proj_fk_dpart_num, proj_fk_comp_num) VALUES(?,?,?,?,?,?,?,?,?,?)";
			
			//connection에 prepareStatement로 query
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, dto.getProj_name());
			stmt.setString(2, dto.getProj_desc());
			stmt.setString(3, dto.getProj_status());
			stmt.setString(4, dto.getProj_members());
			stmt.setString(5, dto.getProj_import());
			stmt.setString(6, dto.getProj_tag());
			stmt.setString(7, dto.getProj_tagcol());
			stmt.setInt(8, dto.getProj_fk_user_num());
			stmt.setInt(9, dto.getProj_fk_dpart_num());
			stmt.setInt(10, dto.getProj_fk_comp_num());
			
			stmt.executeUpdate(); //DML명령어 때 사용
			
			//response.sendRedirect("dashboard.jsp");
			
		} catch (Exception e) {
			System.out.println("Project : "+e);
		} finally {
			if (conn != null) {
				pool.freeConnection(conn,stmt);
			}
		}
	}
	
}