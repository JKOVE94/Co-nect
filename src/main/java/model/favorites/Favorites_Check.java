package model.favorites;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.dbcp.DBConnectionMgr;

public class Favorites_Check {
	
	//로그인한 유저의 즐겨찾기에 등록된 자유게시글인지 확인
	public Boolean FavoritesPostCheck(String ID, int post_num) {
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		boolean check = false;
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "SELECT COUNT(*) AS count FROM favorites WHERE favor_fk_user_num = ? AND favor_fk_post_num = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, Integer.parseInt(ID));
			stmt.setInt(2, post_num);
			
			rs = stmt.executeQuery();
			rs.next();
			if(rs.getInt("count")>0) {
				check = true;
			}
		} catch(Exception e) { System.out.println("FavoritesCheck"+e); }
		return check;
		
	}
	
	//로그인한 유저의 즐겨찾기에 등록된 프로젝트인지 확인
	public Boolean FavoritesProjCheck(String ID, int proj_num) {
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		boolean check = false;
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "SELECT COUNT(*) AS count FROM favorites WHERE favor_fk_user_num = ? AND favor_fk_proj_num = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, Integer.parseInt(ID));
			stmt.setInt(2, proj_num);
			
			rs = stmt.executeQuery();
			rs.next();
			if(rs.getInt("count")>0) {
				check = true;
			}
		} catch(Exception e) { System.out.println("FavoritesCheck"+e); }
		return check;
		
	}
}
