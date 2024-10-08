package model.manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.dbcp.DBConnectionMgr;

public class Admin_check {
	public boolean AdminCheck(String sessionID) {
		boolean b = false;
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "SELECT user_fk_acc_authornum FROM user WHERE user_pk_num = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(sessionID));
			rs = stmt.executeQuery();
			rs.next();
			if (rs.getInt("user_fk_acc_authornum") == 3) {
				b = true;
			}
			
		} catch (Exception e) { System.out.println("AdminCheck"+e); }
		
		
		return b;
	}
}
