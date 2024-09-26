package model.dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;

public class Free_List {

	public ArrayList<PostDTO> getPost() {
        DBConnectionMgr pool =null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<PostDTO> list = new ArrayList<PostDTO>();
        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();

            String sql = "SELECT post_pk_num, post_name, post_fk_user_num, post_regdate, post_view FROM post";

            //몇번째 ?에 값을 넣을것인가.
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	PostDTO dto = new PostDTO();
                dto.setPost_pk_num(rs.getInt("post_pk_num"));
                dto.setPost_name(rs.getString("post_name"));
                dto.setPost_fk_user_num(rs.getInt("post_fk_user_num"));
                dto.setPost_regdate(rs.getString("post_regdate"));
                dto.setPost_view(rs.getInt("post_view"));
            	list.add(dto);
            }
        }
            catch (Exception e) {
            System.out.println("setUser : "+e);

        } finally {
            if (conn != null) {
                pool.freeConnection(conn,stmt);
            }
        }
        return list;
    }
}

