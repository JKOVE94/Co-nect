package model.manage;

import db.dbcp.DBConnectionMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Admin_userDel {
	public void userDel(int user_pk_num) throws Exception {
		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "DELETE FROM user WHERE user_pk_num=?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, user_pk_num);
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("userDel" + e);
		} 
	}
	
}
