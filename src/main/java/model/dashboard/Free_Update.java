package model.dashboard;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Free_Update {

	// post_pk_num을 사용하여 게시글 정보를 조회하는 메서드
    public PostDTO updatePost(String post_pk_num) {
        PostDTO dto = new PostDTO(); // 게시글 정보를 담을 PostDTO 객체 생성
    	DBConnectionMgr pool = null; // DBConnectionMgr 인스턴스를 저장할 변수
        Connection conn = null; // 데이터베이스 연결 객체
        PreparedStatement stmt = null; // SQL 쿼리를 실행하기 위한 PreparedStatement 객체
        ResultSet rs = null; // SQL 쿼리 결과를 저장할 ResultSet 객체

        try {
            pool = DBConnectionMgr.getInstance(); // DBConnectionMgr 인스턴스 가져오기
            conn = pool.getConnection(); // 데이터베이스와 연결

            String sql = "SELECT * FROM post WHERE post_pk_num = ?"; // 게시글을 조회하는 SQL 쿼리
            stmt = conn.prepareStatement(sql); // PreparedStatement 객체 생성
               
            stmt.setString(1, post_pk_num); // 쿼리의 첫 번째 파라미터에 post_pk_num 설정      
            rs = stmt.executeQuery(); // 쿼리 실행 및 결과 집합 반환
            dto.setPost_pk_num(Integer.parseInt(post_pk_num));
            
            // 결과에서 존재하는 데이터
            if(rs.next()) {
            	dto.setPost_name(rs.getString("post_name"));
            	dto.setPost_targetnum(rs.getString("post_targetnum"));
             	dto.setPost_fk_user_num(Integer.parseInt(rs.getString("post_fk_user_num")));
            	dto.setPost_regdate(rs.getDate("post_regdate"));
            	dto.setPost_import(rs.getString("post_import"));
            	dto.setPost_content(rs.getString("post_content"));
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
    
        return dto;  // 조회한 게시글 정보를 담은 PostDTO 반환
    }
    
    public PostDTO saveUpdatePost(String post_pk_num, String post_name, String post_content, String post_import) {
        PostDTO updatedto = new PostDTO(); 
        DBConnectionMgr pool = null; 
        Connection conn = null; 
        PreparedStatement stmt = null; 

        try {
            pool = DBConnectionMgr.getInstance(); 
            conn = pool.getConnection(); 

            String sql = "UPDATE post SET post_name = ?, post_content = ?, post_import = ? WHERE post_pk_num = ?";
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, post_name);  
            stmt.setString(2, post_content);
            stmt.setString(3, post_import);
            stmt.setString(4, post_pk_num);
            
            stmt.executeUpdate();
            
            updatedto = updatePost(post_pk_num);

        } catch (Exception e) {
            System.out.println("saveUpdatePost error: " + e);
        } finally {
            if (stmt != null) try { stmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }

        return updatedto; 
    }
}