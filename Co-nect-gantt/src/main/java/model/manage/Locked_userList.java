package model.manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dbcp.DBConnectionMgr;
import db.dto.UserDTO;

public class Locked_userList {
	public ArrayList<UserDTO> userList() throws Exception {
		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();

			String sql = "SELECT * FROM user WHERE user_locked = 1";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				UserDTO user = new UserDTO();
				//리스트 페이지에 뿌릴 정보 
				//우선 사번, 유저명만 
				user.setUser_pk_num(rs.getInt("user_pk_num"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_locked(rs.getInt("user_locked"));
				list.add(user);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
