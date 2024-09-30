package model.manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.dbcp.DBConnectionMgr;
import db.dto.UserDTO;

public class Admin_userInfo {
	public UserDTO userInfo(int user_pk_num) throws Exception {
		
		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		UserDTO user = new UserDTO();
		
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			
			//데이터 불러오기
			String sql = "SELECT * FROM user WHERE user_pk_num = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, user_pk_num); //사용자 회사 고유번호
			
			rs = stmt.executeQuery();
			rs.next();
			
			user.setUser_pk_num(rs.getInt("user_pk_num")); //사용자 사번
			user.setUser_regdate(rs.getDate("user_regdate")); //입사일
			user.setUser_pw(rs.getString("user_pw")); //사용자 패스워드
			user.setUser_name(rs.getString("user_name")); //사용자 이름
			user.setUser_mail(rs.getString("user_mail")); //사용자 이메일
			user.setUser_pic(rs.getString("user_pic")); //사진 경로
			user.setUser_rank(rs.getString("user_rank")); //사용자 직급
			user.setUser_fk_job_num(rs.getInt("user_fk_job_num")); //사용자 직무 번호
			user.setUser_fk_dpart_num(rs.getInt("user_fk_dpart_num")); //사용자 부서 번호
			user.setUser_fk_acc_authornum(rs.getInt("user_fk_acc_authornum")); //사용자 계정 권한 번호
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return user;
	}
}
