package model.dashboard;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Free_List {

	public ArrayList<PostDTO> getPost(String sessionID, String keyField, String keyWord) {
        DBConnectionMgr pool =null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<PostDTO> list = new ArrayList<PostDTO>();
        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();
            
            if (keyWord == null) {
            	//전체 글 목록과 해당 글이 로그인한 사용자의 즐겨찾기에 등록되어있는지 확인하는 쿼리
                String sql ="SELECT post_pk_num, post_name, post_fk_user_num, post_regdate, post_view, favor_fk_post_num FROM post "
                		+ "LEFT OUTER JOIN (SELECT favor_fk_post_num FROM favorites WHERE favor_fk_user_num = ?) AS favor "
                		+ "ON post.post_pk_num = favor.favor_fk_post_num;";

                stmt = conn.prepareStatement(sql);
                stmt.setString(1, sessionID); //로그인한 사용자 사번 전달
                rs = stmt.executeQuery();
                
            } else if ((keyWord != null) && (keyWord != " ")) {
            	//키워드가 들어있는 글만 가져오는 쿼리
            	String sql = "SELECT post_pk_num, post_name, post_fk_user_num, post_regdate, post_view, favor_fk_post_num FROM"
            			+ "	(SELECT * FROM post WHERE "+keyField+" LIKE ?) AS post"
            			+ " LEFT OUTER JOIN (SELECT favor_fk_post_num FROM favorites WHERE favor_fk_user_num = ? ) AS favor"
            			+ " ON post.post_pk_num = favor.favor_fk_post_num;";
            	
            	stmt = conn.prepareStatement(sql);
            	stmt.setString(1, "%"+keyWord+"%");
            	stmt.setString(2, sessionID);
            	

                rs = stmt.executeQuery();
            }
             
            while (rs.next()) {
            	PostDTO dto = new PostDTO();
                dto.setPost_pk_num(rs.getInt("post_pk_num"));
                dto.setPost_name(rs.getString("post_name"));
                dto.setPost_fk_user_num(rs.getInt("post_fk_user_num"));
                dto.setPost_regdate(rs.getDate("post_regdate"));
                dto.setPost_view(rs.getInt("post_view"));
                
               	if(rs.getString("favor_fk_post_num") != null) { 
               		//값이 null이 아니라면, 즐겨찾기 저장된 항목이므로 true
               		dto.setFavoriteCheck(true);
               	} else {
               		dto.setFavoriteCheck(false);
               	}
            	list.add(dto);
            }
        }
            catch (Exception e) {
            System.out.println("getPost : "+e);

        } finally {
            if (conn != null) {
                pool.freeConnection(conn,stmt);
            }
        }
        return list;
    }
}
