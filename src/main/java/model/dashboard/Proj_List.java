package model.dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.dbcp.DBConnectionMgr;
import db.dto.ProjectDTO;

public class Proj_List {

	public ArrayList<ProjectDTO> getPost(String sessionID, String keyField, String keyWord) {
        DBConnectionMgr pool =null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<ProjectDTO> list = new ArrayList<ProjectDTO>();
        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();

            //전체 글 목록과 해당 글이 로그인한 사용자의 즐겨찾기에 등록되어있는지 확인하는 쿼리
            if(keyWord == null) {
            	 String sql = "SELECT proj_pk_num, proj_name, proj_fk_user_num, proj_startdate, proj_enddate, proj_import, proj_status, favor.favor_fk_proj_num FROM project"
                 		+ " LEFT OUTER JOIN (SELECT favor_fk_proj_num FROM favorites WHERE favor_fk_user_num = ?) AS favor"
                 		+ "	ON project.proj_pk_num = favor.favor_fk_proj_num;";
            	 stmt = conn.prepareStatement(sql);
                 stmt.setString(1, sessionID);
                 rs = stmt.executeQuery();
            }
            else if((keyWord != null) && (keyWord != " ")) {
            	//키워드가 들어있는 글만 가져오는 쿼리
            	String sql = "SELECT proj_pk_num, proj_name, proj_fk_user_num, proj_startdate, proj_enddate, proj_import, proj_status, favor.favor_fk_proj_num FROM"
            		+ "	(SELECT * FROM project WHERE "+keyField+" LIKE ?) AS project "
            		+ " LEFT OUTER JOIN (SELECT favor_fk_proj_num FROM favorites WHERE favor_fk_user_num = ?) AS favor"
            		+ " ON project.proj_pk_num = favor.favor_fk_proj_num;";
            	stmt = conn.prepareStatement(sql);
            	stmt.setString(1, "%"+keyWord+"%");
            	stmt.setString(2, sessionID);
            	rs = stmt.executeQuery();
            }
            
            while (rs.next()) {
            	ProjectDTO dto = new ProjectDTO();
                dto.setProj_pk_num(rs.getInt("proj_pk_num"));
                dto.setProj_name(rs.getString("proj_name"));
                dto.setProj_fk_user_num(rs.getInt("proj_fk_user_num"));
                dto.setProj_startdate(rs.getDate("proj_startdate"));
                dto.setProj_enddate(rs.getDate("proj_enddate"));
                dto.setProj_import(rs.getString("proj_import"));
                dto.setProj_status(rs.getString("proj_status"));
                
                if(rs.getString("favor_fk_proj_num")!=null) {
                	//값이 null이 아니라면, 즐겨찾기 저장된 항목이므로 true
                	dto.setFavoriteCheck(true);
                } else {
                	dto.setFavoriteCheck(false);
                }
                
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

