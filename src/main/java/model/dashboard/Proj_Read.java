package model.dashboard;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;
import db.dto.ProjectDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Proj_Read {

	public ProjectDTO getProjById(String proj_pk_num) {
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ProjectDTO post = null;

		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();

			String sql = "SELECT * FROM project WHERE proj_pk_num = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(proj_pk_num));
			rs = stmt.executeQuery();

			if (rs.next()) {
				post = new ProjectDTO();
				post.setProj_pk_num(rs.getInt("proj_pk_num"));
				post.setProj_name(rs.getString("proj_name"));
				post.setProj_desc(rs.getString("proj_desc"));
				post.setProj_startdate(rs.getDate("proj_startdate"));
				post.setProj_enddate(rs.getDate("proj_enddate"));
				post.setProj_status(rs.getString("proj_status"));
				post.setProj_members(rs.getString("proj_members"));

				post.setProj_created(rs.getDate("proj_created"));
				post.setProj_updated(rs.getDate("proj_updated"));

				post.setProj_import(rs.getString("proj_import"));
				post.setProj_tag(rs.getString("proj_tag"));
				post.setProj_tagcol(rs.getString("proj_tagcol"));

				post.setProj_fk_dpart_num(rs.getInt("proj_fk_dpart_num"));
				post.setProj_fk_user_num(rs.getInt("proj_fk_user_num"));
				post.setProj_fk_comp_num(rs.getInt("proj_fk_comp_num"));
				
			}
		} catch (Exception e) {
			System.out.println("getProjById error: " + e);
		} finally {
			if (conn != null) {
				pool.freeConnection(conn, stmt);
			}
		}
		return post;
	}
}
