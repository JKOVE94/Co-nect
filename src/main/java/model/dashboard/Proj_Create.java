package model.dashboard;

import db.dbcp.DBConnectionMgr;
import db.dto.ProjectDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class Proj_Create {

	public String projPostNum(String proj_name){

		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql ="";
		String post_pk_num="";

        try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			sql = "INSERT INTO post(post_kind, post_name) VALUES(?,?)";

            stmt = conn.prepareStatement(sql);
        	stmt.setInt(1, 2);
			stmt.setString(2, proj_name);

			stmt.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
		finally {
			pool.freeConnection(conn,stmt);
		}

		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			sql = "SELECT post_pk_num FROM post WHERE post_name=?";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, proj_name);
			rs = stmt.executeQuery();

			while(rs.next()){
				post_pk_num = rs.getString("post_pk_num");
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		finally {
			pool.freeConnection(conn,stmt);
		}

		return post_pk_num;
	}

	public void setPost(HttpServletRequest req, HttpServletResponse resp) {

		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		resp.setCharacterEncoding("utf-8");

		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;

		ProjectDTO dto = new ProjectDTO();
		String proj_name = req.getParameter("proj_name");
		dto.setProj_name(proj_name);
		dto.setProj_desc(req.getParameter("proj_desc"));
		dto.setProj_status(req.getParameter("proj_status"));
		dto.setProj_members(req.getParameter("proj_members"));
		dto.setProj_import(req.getParameter("proj_import"));
		dto.setProj_tag(req.getParameter("proj_tag"));
		dto.setProj_tagcol(req.getParameter("proj_tagcol"));

		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-DD");
		try {
			dto.setProj_startdate(format.parse(req.getParameter("proj_startdate")));
			dto.setProj_enddate(format.parse(req.getParameter("proj_enddate")));
		}
		catch (Exception e){}
		dto.setProj_fk_user_num(Integer.parseInt(req.getParameter("proj_fk_user_num")));
		dto.setProj_fk_dpart_num(Integer.parseInt(req.getParameter("proj_fk_dpart_num")));
		dto.setProj_fk_comp_num(Integer.parseInt(req.getParameter("proj_fk_comp_num")));

		int proj_fk_post_num = Integer.parseInt(projPostNum(proj_name));

		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();

			String sql = "INSERT INTO project(proj_name, proj_desc,"+
					"proj_status, proj_members, Proj_import, proj_tag, proj_tagcol,"+
					"proj_fk_user_num, proj_fk_dpart_num, proj_fk_comp_num, proj_fk_post_num, proj_created, proj_updated, proj_startdate, proj_enddate) VALUES(?,?,?,?,?,?,?,?,?,?,?,now(),now(),?,?)";

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
			stmt.setInt(11, proj_fk_post_num);
			stmt.setString(12, format.format(dto.getProj_startdate()));
			stmt.setString(13, format.format(dto.getProj_enddate()));

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