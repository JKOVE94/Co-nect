package model.dashboard;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import db.dbcp.DBConnectionMgr;
import db.dto.ProjectDTO;

public class Proj_ReadCheck {
	public ProjectDTO projDtoReturn(String proj_num){
		int proj_pk_num = Integer.parseInt(proj_num);
	    ProjectDTO dto = null;
	    
	    DBConnectionMgr pool =null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();

            String sql = "SELECT proj_pk_num, proj_name, proj_desc,  proj_startdate, proj_enddate, proj_status, proj_members, proj_created,proj_updated, proj_import, proj_tag, proj_tagcol, proj_fk_dpart_num, proj_fk_user_num, proj_fk_comp_num  FROM project WHERE proj_pk_num=?";

            //몇번째 ?에 값을 넣을것인가.
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, proj_pk_num);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	dto = new ProjectDTO();
                dto.setProj_pk_num(rs.getInt("proj_pk_num"));
                dto.setProj_name(rs.getString("proj_name"));
                dto.setProj_desc(rs.getString("proj_name"));
                dto.setProj_startdate(rs.getDate("proj_startdate"));
                dto.setProj_enddate(rs.getDate("proj_enddate"));
                dto.setProj_members(rs.getString("proj_members"));

                dto.setProj_created(rs.getDate("proj_created"));
                dto.setProj_updated(rs.getDate("proj_updated"));

                dto.setProj_import(rs.getString("proj_import"));
                dto.setProj_tag(rs.getString("proj_tag"));
                dto.setProj_tagcol(rs.getString("proj_tagcol"));

                dto.setProj_fk_dpart_num(rs.getInt("proj_fk_dpart_num"));
                dto.setProj_fk_user_num(rs.getInt("proj_fk_user_num"));
                dto.setProj_fk_comp_num(rs.getInt("proj_fk_comp_num"));
            }
        }
            catch (Exception e) {
            	System.out.println("Proj_ReadCheck : "+e);
        } finally {
            if (conn != null) {
                pool.freeConnection(conn,stmt);
            }
        }
	    return dto;
	}
	  
}


