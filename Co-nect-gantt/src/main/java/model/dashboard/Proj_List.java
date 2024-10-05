package model.dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.dbcp.DBConnectionMgr;
import db.dto.ProjectDTO;

public class Proj_List {

	public ArrayList<ProjectDTO> getPost() {
        DBConnectionMgr pool =null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<ProjectDTO> list = new ArrayList<ProjectDTO>();
        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();

            String sql = "SELECT proj_pk_num, proj_name, proj_fk_user_num, proj_startdate, proj_enddate, proj_import, proj_status FROM project";

            //몇번째 ?에 값을 넣을것인가.
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	ProjectDTO dto = new ProjectDTO();
                dto.setProj_pk_num(rs.getInt("proj_pk_num"));
                dto.setProj_name(rs.getString("proj_name"));
                dto.setProj_fk_user_num(rs.getInt("proj_fk_user_num"));
                dto.setProj_startdate(rs.getDate("proj_startdate"));
                dto.setProj_enddate(rs.getDate("proj_enddate"));
                dto.setProj_import(rs.getString("proj_import"));
                dto.setProj_status(rs.getString("proj_status"));
            	list.add(dto);
            }
        }
            catch (Exception e) {
            System.out.println("Proj_List : "+e);

        } finally {
            if (conn != null) {
                pool.freeConnection(conn,stmt);
            }
        }
        return list;
    }
}

