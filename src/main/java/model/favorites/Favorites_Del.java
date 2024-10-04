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
			
			//로그인한 유저의 pk num과 일치하고, post num 또는 proj num이 같다면 삭제
			String sql = "DELETE FROM favorites WHERE favor_fk_user_num = ? AND (favor_fk_post_num = ? OR favor_fk_proj_num = ?)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_pk_num);
			
			//프로젝트 게시글일 경우 favor_fk_post_num을 null로 전달 
			if(post_pk_num==null) {
				stmt.setNull(2, Types.NUMERIC);
			} else {
				stmt.setInt(2, Integer.parseInt(post_pk_num));
			}
			
			//자유게시글일 경우 favor_fk_proj_num을 null로 전달 
			if(proj_pk_num==null) {
				stmt.setNull(3, Types.NUMERIC);
			} else {
				stmt.setInt(3, Integer.parseInt(proj_pk_num));
			}
			
			stmt.executeUpdate();
			
		} catch (Exception e) { System.out.println("FavoritesDel"+e); }
		
		
	}
}
