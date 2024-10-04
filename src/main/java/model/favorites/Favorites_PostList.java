package model.favorites;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;

import db.dbcp.DBConnectionMgr;
import db.dto.FavoritesDTO;

public class Favorites_PostList {
	
	public ArrayList<FavoritesDTO> FavoritesPostList(int user_pk_num) {
		
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			//현재 로그인한 유저가 즐겨찾기한 자유게시글의 num과 name을 불러오는 sql문
			String sql = " SELECT post_pk_num, post_name FROM (SELECT * FROM favorites"
					+ " 	WHERE favor_fk_post_num IS NOT NULL AND favor_fk_user_num = ? ) AS favorites"
					+ "		LEFT JOIN post ON favor_fk_post_num = post_pk_num";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_pk_num);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				
				FavoritesDTO dto = new FavoritesDTO();
				
				dto.setNumber(rs.getInt("post_pk_num"));
				dto.setName(rs.getString("post_name"));
				dto.setType("post");

				list.add(dto);
			}

		}
		catch (Exception e) { System.out.println("FavoritesList"+e); }
		
		return list;
	}

}
