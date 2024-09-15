package mybean.dao;
import java.sql.*;

import mybean.dto.UserDTO;
import mybean.dbcp.DBConnectionMgr;

public class admin_setUserProcDAO {
	
	public void setUser(UserDTO user) {
		DBConnectionMgr pool =null;
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
					
			String sql = "INSERT INTO user(user_pk_num,user_regdate,user_pw,"+
					"user_name,user_mail,user_pic,user_rank,user_lastlogin,user_fk_job_num,"+
					"user_fk_dpart_num,user_fk_acc_authornum,user_fk_comp_num) VALUES(?,?,?,?,?,?,?,now(),?,?,?,?)";
			
			//connection에 prepareStatement로 query
			stmt = conn.prepareStatement(sql);
		
			//몇번째 ?에 값을 넣을것인가.
			stmt.setInt(1, user.getUser_pk_num()); //사번
			stmt.setString(2, user.getUser_regdate()); //입사일
			stmt.setString(3, user.getUser_pw()); //패스워드ㅋ
			stmt.setString(4, user.getUser_name()); //이름
			stmt.setString(5, user.getUser_mail()); // 이메일
			stmt.setString(6, user.getUser_pic()); //사진경로
			stmt.setString(7, user.getUser_rank()); //사진경로
			stmt.setInt(8, user.getUser_fk_job_num()); //직무 번호
			stmt.setInt(9, user.getUser_fk_dpart_num()); //부서 번호
			stmt.setInt(10, user.getUser_fk_acc_authornum()); //직원 계정권한 번호
			stmt.setInt(11, user.getUser_fk_comp_num()); //직원 회사 번호
			
			stmt.executeUpdate(); //DML명령어 때 사용
			
			//response.sendRedirect("dashboard.jsp");
			
		} catch (Exception e) {
			System.out.println("setUser : "+e);
		} finally {
			if (conn != null) {
				pool.freeConnection(conn,stmt);
			}
		}
	}
	
	
	
	
	
}
