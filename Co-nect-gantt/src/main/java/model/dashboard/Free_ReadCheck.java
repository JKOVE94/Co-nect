package model.dashboard;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;

public class Free_ReadCheck {
	public PostDTO postDtoReturn(String post_num){
	    //int post_pk_num = Integer.parseInt(req.getParameter("post_num"));
		int post_pk_num = Integer.parseInt(post_num);
	    PostDTO dto = null;
	    
	    DBConnectionMgr pool =null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();

            String sql = "SELECT post_pk_num, post_targetnum, post_name,  post_regdate, post_import, post_content, post_tag, post_fk_dpart_num, post_fk_user_num, post_view, post_depth FROM post WHERE post_pk_num=?";

            //몇번째 ?에 값을 넣을것인가.
            stmt = conn.prepareStatement(sql);
            
            stmt.setInt(1, post_pk_num);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	dto = new PostDTO();
                dto.setPost_pk_num(rs.getInt("post_pk_num"));
                dto.setPost_targetnum(rs.getString("post_targetnum"));
                dto.setPost_name(rs.getString("post_name"));
                dto.setPost_regdate(rs.getDate("post_regdate"));
                dto.setPost_import(rs.getString("post_import"));
                dto.setPost_content(rs.getString("post_content"));
                dto.setPost_tag(rs.getString("post_tag"));
                dto.setPost_fk_dpart_num(rs.getInt("post_fk_dpart_num"));
                dto.setPost_fk_user_num(rs.getInt("post_fk_user_num"));
                dto.setPost_view(rs.getInt("post_view"));
                dto.setPost_depth(rs.getInt("post_depth"));
            	
            }
        }
            catch (Exception e) {
            	System.out.println("setUser : "+e);

        } finally {
            if (conn != null) {
                pool.freeConnection(conn,stmt);
            }
        }
	    return dto;
	}
	  
}


