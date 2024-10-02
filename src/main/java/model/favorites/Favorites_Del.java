package model.favorites;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;

import db.dbcp.DBConnectionMgr;

public class Favorites_Del{
	public void FavoritesDel(int user_pk_num, String post_pk_num, String proj_pk_num) {
		
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "DELETE FROM favorites WHERE favor_fk_user_num = ? AND (favor_fk_post_num = ? OR favor_fk_proj_num = ?)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_pk_num);
			
			if(post_pk_num==null) {
				stmt.setNull(2, Types.NUMERIC);
			} else {
				stmt.setInt(2, Integer.parseInt(post_pk_num));
			}
			
			if(proj_pk_num==null) {
				stmt.setNull(3, Types.NUMERIC);
			} else {
				stmt.setInt(3, Integer.parseInt(proj_pk_num));
			}
			
			stmt.executeUpdate();
			
		} catch (Exception e) { System.out.println("FavoritesDel"+e); }
		
		
	}
}
