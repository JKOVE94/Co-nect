package model.dashboard;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Free_Read {

    public PostDTO getPostById(String postId) {
        DBConnectionMgr pool = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PostDTO post = null;

        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();

            // 1. 게시글 조회
            String sql = "SELECT * FROM post WHERE post_pk_num = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(postId));
            rs = stmt.executeQuery();

            if (rs.next()) {
                post = new PostDTO();
                post.setPost_pk_num(rs.getInt("post_pk_num"));
                post.setPost_name(rs.getString("post_name"));
                post.setPost_fk_user_num(rs.getInt("post_fk_user_num"));
                post.setPost_regdate(rs.getDate("post_regdate"));
                post.setPost_view(rs.getInt("post_view"));
                post.setPost_content(rs.getString("post_content"));
                
                // 2. 조회수 증가
                increaseViewCount(conn, post.getPost_pk_num());
            }
        } catch (Exception e) {
            System.out.println("getPostById error: " + e);
        } finally {
            if (conn != null) {
                pool.freeConnection(conn, stmt);
            }
        }
        return post;
    }

    // 조회수 증가를 위한 메서드
    private void increaseViewCount(Connection conn, int postId) throws Exception {
        String updateSql = "UPDATE post SET post_view = post_view + 1 WHERE post_pk_num = ?";
        try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
            updateStmt.setInt(1, postId);
            updateStmt.executeUpdate();
        }
    }
}