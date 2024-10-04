package model.common;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class getAllPost {
    public HashMap<Integer, PostDTO> getAllPostInfo(){
            DBConnectionMgr pool =null;
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            HashMap<Integer,PostDTO> map = new HashMap<Integer,PostDTO>();
            try {
                pool = DBConnectionMgr.getInstance();
                conn = pool.getConnection();

                String sql = "SELECT * FROM post";

                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    PostDTO dto = new PostDTO();
                    int post_pk_num = rs.getInt("post_pk_num");

                    dto.setPost_pk_num(rs.getInt("post_pk_num"));
                    dto.setPost_kind(rs.getInt("post_kind"));
                    dto.setPost_targetnum(rs.getString("post_targetnum"));
                    dto.setPost_name(rs.getString("post_name"));
                    dto.setPost_regdate(rs.getDate("post_regdate"));
                    dto.setPost_import(rs.getString("post_import"));
                    dto.setPost_content(rs.getString("post_content"));
                    dto.setPost_tag(rs.getString("post_tag"));
                    dto.setPost_fk_dpart_num(rs.getInt("post_fk_dpart_num"));
                    dto.setPost_fk_comp_num(rs.getInt("post_fk_comp_num"));
                    dto.setPost_fk_user_num(rs.getInt("post_fk_user_num"));
                    dto.setPost_view(rs.getInt("post_view"));

                    map.put(post_pk_num,dto);
                }
            }
            catch (Exception e) {
                System.out.println("getAllPost : "+e);

            } finally {
                if (conn != null) {
                    pool.freeConnection(conn,stmt);
                }
            }
            return map;
    }
}
