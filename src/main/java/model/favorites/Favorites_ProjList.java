package model.favorites;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;

import db.dbcp.DBConnectionMgr;
import db.dto.FavoritesDTO;

public class Favorites_ProjList {
	
	public ArrayList<FavoritesDTO> FavoritesProjList(int user_pk_num) {
		
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = " SELECT proj_pk_num, proj_name FROM (SELECT * FROM favorites"
					+ " 	WHERE favor_fk_proj_num IS NOT NULL AND favor_fk_user_num = ? ) AS favorites"
					+ "		LEFT JOIN project ON favor_fk_proj_num = proj_pk_num";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_pk_num);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				PreparedStatement stmt2 = null;
				
				FavoritesDTO dto = new FavoritesDTO();
				
				dto.setNumber(rs.getInt("proj_pk_num"));
				dto.setName(rs.getString("proj_name"));
				dto.setType("proj");
				
				list.add(dto);
			}

		}
		catch (Exception e) { System.out.println("FavoritesList"+e); }
		
		return list;
	}

}
