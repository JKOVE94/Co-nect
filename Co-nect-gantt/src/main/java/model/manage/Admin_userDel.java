package model.manage;

import java.sql.*;

import db.dbcp.DBConnectionMgr;
import db.dto.UserDTO;

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
