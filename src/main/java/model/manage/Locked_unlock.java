package model.manage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.dbcp.DBConnectionMgr;
import db.dto.UserDTO;

public class Locked_unlock {
	public void UnLock(ArrayList list){
		
		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			for(int i=0; i<list.size(); i++) {
				UserDTO user = (UserDTO) list.get(i);
				
				String sql = "UPDATE user SET user_locked=? WHERE user_pk_num=? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setInt(1, user.getUser_locked());
				stmt.setInt(2, user.getUser_pk_num());
				
				if(user.getUser_locked()!=1) {
					stmt.executeUpdate();
				}
			}
		}
		catch( Exception e ) { e.printStackTrace(); }

	}
}
