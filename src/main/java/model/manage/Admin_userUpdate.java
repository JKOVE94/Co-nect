package model.manage;

import java.sql.*;

import db.dbcp.DBConnectionMgr;
import db.dto.UserDTO;

public class Admin_userUpdate {
	public void userUpdate(UserDTO user) throws Exception {
		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			String sql = "UPDATE user SET user_pw=?, user_name=?, user_mail=?, user_pic=?,"
					+ "user_regdate=?, user_rank=?, user_fk_job_num=?, user_fk_dpart_num=?, "
					+ "user_fk_acc_authornum=? WHERE user_pk_num = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, user.getUser_pw()); //pw
			stmt.setString(2, user.getUser_name()); //name
			stmt.setString(3, user.getUser_mail()); //mail
			stmt.setString(4, user.getUser_pic()); //사진경로
			stmt.setDate(5, (Date)user.getUser_regdate()); //가입일자
			stmt.setString(6, user.getUser_rank()); //직급
			stmt.setInt(7, user.getUser_fk_job_num()); //사용자 직무 번호
			stmt.setInt(8, user.getUser_fk_dpart_num()); //사용자 부서 번호
			stmt.setInt(9, user.getUser_fk_acc_authornum()); //사용자 권한
			stmt.setInt(10, user.getUser_pk_num()); //사번
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
}
