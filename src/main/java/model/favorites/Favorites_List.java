package model.favorites;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;

import db.dbcp.DBConnectionMgr;
import db.dto.FavoritesDTO;

public class Favorites_List {
	
	public ArrayList<FavoritesDTO> FavoritesList(int user_pk_num) {
		
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "SELECT post_pk_num, post_name, proj_pk_num, proj_name FROM favorites"
					+ "	LEFT JOIN post ON favor_fk_post_num = post_pk_num"
					+ "	LEFT JOIN project ON favor_fk_proj_num = proj_pk_num"
					+ "	WHERE favor_fk_user_num = ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_pk_num);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				PreparedStatement stmt2 = null;
				
				FavoritesDTO dto = new FavoritesDTO();
				
				if(rs.getString("post_pk_num")!= null) {
					dto.setNumber(rs.getInt("post_pk_num"));
					dto.setName(rs.getString("post_name"));
					dto.setType("post");
				} else if (rs.getString("proj_pk_num")!= null) {
					dto.setNumber(rs.getInt("proj_pk_num"));
					dto.setName(rs.getString("proj_name"));
					dto.setType("proj");
				}
				
				list.add(dto);
			}

		}
		catch (Exception e) { System.out.println("FavoritesList"+e); }
		
		return list;
	}

}
