package model.common;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;
import db.dto.ProjectDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;

public class getAllProj {
    public HashMap<Integer, ProjectDTO> getAllProjInfo(){
            DBConnectionMgr pool =null;
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            HashMap<Integer,ProjectDTO> map = new HashMap<Integer,ProjectDTO>();
            try {
                pool = DBConnectionMgr.getInstance();
                conn = pool.getConnection();

                String sql = "SELECT * FROM project";

                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    ProjectDTO dto = new ProjectDTO();
                    int proj_pk_num = rs.getInt("proj_pk_num");

                    dto.setProj_pk_num(rs.getInt("proj_pk_num"));
                    dto.setProj_name(rs.getString("proj_name"));
                    dto.setProj_desc(rs.getString("proj_desc"));
                    dto.setProj_startdate(rs.getDate("proj_startdate"));
                    dto.setProj_enddate(rs.getDate("proj_enddate"));
                    dto.setProj_status(rs.getString("proj_status"));
                    dto.setProj_members(rs.getString("proj_members"));
                    dto.setProj_created(rs.getDate("proj_created"));
                    dto.setProj_updated(rs.getDate("proj_updated"));
                    dto.setProj_import(rs.getString("proj_import"));
                    dto.setProj_tag(rs.getString("proj_tag"));
                    dto.setProj_tagcol(rs.getString("proj_tagcol"));
                    dto.setProj_fk_dpart_num(rs.getInt("proj_fk_dpart_num"));
                    dto.setProj_fk_user_num(rs.getInt("proj_fk_user_num"));
                    dto.setProj_fk_comp_num(rs.getInt("proj_fk_comp_num"));

                    map.put(proj_pk_num,dto);
                }
            }
            catch (Exception e) {
                System.out.println("setUser : "+e);

            } finally {
                if (conn != null) {
                    pool.freeConnection(conn,stmt);
                }
            }
            return map;
    }
}
