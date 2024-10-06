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
			
			//현재 로그인한 유저가 즐겨찾기한 프로젝트게시글의 num과 name을 불러오는 sql문
			String sql = " SELECT proj_pk_num, proj_name, proj_fk_user_num, proj_import, proj_enddate FROM (SELECT * FROM favorites"
					+ " 	WHERE favor_fk_proj_num IS NOT NULL AND favor_fk_user_num = ? ) AS favorites"
					+ "		LEFT JOIN project ON favor_fk_proj_num = proj_pk_num";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_pk_num);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				FavoritesDTO dto = new FavoritesDTO();
				
				dto.setNumber(rs.getInt("proj_pk_num"));
				dto.setName(rs.getString("proj_name"));
				dto.setUser(rs.getInt("proj_fk_user_num"));
				dto.setRegdate(rs.getDate("proj_enddate"));
				dto.setStatus(rs.getString("proj_import"));
				dto.setType("proj");
				
				list.add(dto);
			}

		}
		catch (Exception e) { System.out.println("FavoritesList"+e); }
		
		return list;
	}

}
