package model.dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.dbcp.DBConnectionMgr;
import db.dto.ProjectDTO;

public class Proj_Update {

    public ProjectDTO updatePost(String proj_pk_num) {
    	ProjectDTO proj = new ProjectDTO(); 
    	DBConnectionMgr pool = null; 
        Connection conn = null; 
        PreparedStatement stmt = null; 
        ResultSet rs = null; // SQL 쿼리 결과를 저장할 ResultSet 객체

        try {
            pool = DBConnectionMgr.getInstance(); // DBConnectionMgr 인스턴스 가져오기
            conn = pool.getConnection(); // 데이터베이스와 연결

            String sql = "SELECT * FROM project WHERE proj_pk_num = ?"; // 게시글을 조회하는 SQL 쿼리
            stmt = conn.prepareStatement(sql); // PreparedStatement 객체 생성
               
            stmt.setString(1, proj_pk_num);      
            rs = stmt.executeQuery(); 
            proj.setProj_pk_num(Integer.parseInt(proj_pk_num));
            
     
            if(rs.next()) {
            	
            	proj.setProj_name(rs.getString("proj_name"));
            	proj.setProj_desc(rs.getString("proj_desc"));
            	proj.setProj_status(rs.getString("proj_status"));
            	proj.setProj_members(rs.getString("proj_members"));
            	proj.setProj_import(rs.getString("proj_import"));
            	proj.setProj_tag(rs.getString("proj_tag"));
            	proj.setProj_tagcol(rs.getString("proj_tagcol"));
            	proj.setProj_fk_user_num(Integer.parseInt(rs.getString("proj_fk_user_num")));
            	proj.setProj_fk_dpart_num(Integer.parseInt(rs.getString("proj_fk_dpart_num")));
            	proj.setProj_fk_comp_num(Integer.parseInt(rs.getString("proj_fk_comp_num")));
            	proj.setProj_fk_post_num(Integer.parseInt(rs.getString("proj_fk_post_num")));
        		
            }
        }
        catch(Exception e) {
        	System.out.println("setuser : " + e);
        }
        finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    
        return proj; 
    }

    public ProjectDTO projSaveUpdatePost(String proj_name, String proj_desc,
			String proj_status, String proj_members, String proj_import, String proj_fk_user_num, String proj_fk_dpart_num, String proj_pk_num) {
        DBConnectionMgr pool = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ProjectDTO proju=null;

        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();


            String sql = "UPDATE project SET proj_name = ?, proj_desc = ?, proj_status = ?, proj_members = ?, proj_import = ?, proj_fk_user_num = ?, proj_fk_dpart_num = ? WHERE proj_pk_num = ?";
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, proj_name);
			stmt.setString(2, proj_desc);
			stmt.setString(3, proj_status);
			stmt.setString(4, proj_members);
			stmt.setString(5, proj_import);
			stmt.setInt(6, Integer.parseInt(proj_fk_user_num));
			stmt.setInt(7, Integer.parseInt(proj_fk_dpart_num));
			stmt.setInt(8, Integer.parseInt(proj_pk_num));

            stmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("projsaveUpdatePost error: " + e);
        } finally {
            if (stmt != null) try { stmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
        proju = updatePost(proj_pk_num);
        return proju;
    }
}