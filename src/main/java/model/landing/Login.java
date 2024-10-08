package model.landing;

import db.dbcp.DBConnectionMgr;
import db.dto.UserDTO;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Login {
    private DBConnectionMgr pool;
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;


    public Login() {
        pool = DBConnectionMgr.getInstance();
    }

    public UserDTO dtoReturn(HttpServletRequest req) {
        UserDTO dto = new UserDTO();
        dto.setUser_fk_comp_num(Integer.parseInt(req.getParameter("comp_pk_num")));
        dto.setUser_pk_num(Integer.parseInt(req.getParameter("user_pk_num")));
        dto.setUser_pw(req.getParameter("user_pw"));
        
        return dto;
    }


    public String LoginMessage(HttpServletRequest req) throws Exception {
        

    	//로그인 실패 메시지 변수
        String message = null;
        
    
        //dtoReturn 메서드 호출
        UserDTO user = dtoReturn(req);
        
        //변수에 DTO(req)값 담기 
        int compNum = user.getUser_fk_comp_num();
        int userNum = user.getUser_pk_num();
        String userPw = user.getUser_pw();
        
        /*
        if(compNum<0||userNum<0) {
        	message = "잘못된 정보입니다.";
        	System.out.println("음수 막힘");
        }else {
        */
       
        	//사용자 입력 값 null empty 일때 try catch, 그리고 message 추가 
        	String checkCompanySql = "SELECT * FROM user WHERE user.user_fk_comp_num = ?";
        	String checkUserNumSql = "SELECT * FROM user WHERE user.user_fk_comp_num = ? AND user.user_pk_num = ?";
        	String checkPasswordSql = "SELECT * FROM user WHERE user.user_fk_comp_num = ? AND user.user_pk_num = ? AND user.user_pw =?";

        	try {

        		conn = pool.getConnection();


        		// 1.회사코드 확인
        		stmt = conn.prepareStatement(checkCompanySql);
        		stmt.setInt(1, compNum); // 회사 코드

        		rs = stmt.executeQuery();
        		if(!rs.next()) {
        			message = "존재하지 않는 회사 코드입니다.";

        		}
        		rs.close();
        		stmt.close();

        		//2.사번까지 확인
        		stmt = conn.prepareStatement(checkUserNumSql);
        		stmt.setInt(1, compNum); //회사 코드
        		stmt.setInt(2, userNum); // 사번 ID
        		if(!rs.next()) {
        			message = "잘못된 정보입니다.";
        		}
        		rs.close();
        		stmt.close();

        		//3. 패스워드 확인
        		stmt = conn.prepareStatement(checkPasswordSql);
        		stmt.setInt(1, compNum);//회사코드
        		stmt.setInt(2, userNum);  //사번 ID
        		stmt.setString(3, userPw); //패스워드
        		rs = stmt.executeQuery();

        		//로그인 실패시
        		if(!rs.next()) {
        			//로그인 실패 : 계정 잠금 확인(사번 회사번호만 맞아도 확인)
        			if(lockedUserCheck(user)) {
        				message = "잠긴 계정입니다 담당자에게 문의하세요(비밀번호 틀림 5회 초과)";
        			}else {
        				incrementLoginAttempts(user); //로그인 시도 횟수 증가
        				lockUserAccount(user); //5회 초과시 계정 잠금
        				message = "잘못된 정보입니다.";
        			}

        		}
        		//로그인 성공
        		else {

        			//로그인 성공 : 계정 잠금 확인
        			if(lockedUserCheck(user)) {
        				message = "잠긴 계정입니다 담당자에게 문의하세요(비밀번호 틀림 5회 초과)";
        			}else {
        				//시도 횟수 초기화
        				resetLoginAttempts(user);
            			message = null;
        			}
        			
        		}
        	
            
        	
        	}catch(Exception e) {
        		System.out.println("로그인(sql) 오류 :" + e);
        		message = "잘못된 정보입니다.";
        		System.out.println("Loginjava:"+ message);
        
        
        	}finally {pool.freeConnection(conn, stmt, rs);}
        
   //  }

        return message;
   }



    //계정 잠금 확인
    private boolean lockedUserCheck(UserDTO user) throws Exception {
        String lockCheckSql = "SELECT user_locked FROM user WHERE user_fk_comp_num = ? AND user_pk_num = ?";
        try {
            conn = pool.getConnection();
            stmt = conn.prepareStatement(lockCheckSql);
            stmt.setInt(1, user.getUser_fk_comp_num()); //회사 코드
            stmt.setInt(2, user.getUser_pk_num()); // 사번 ID
            rs = stmt.executeQuery();

            if(rs.next()) {
                int accountLocked = rs.getInt("user_locked");
                return accountLocked == 1;
            }
            return false;

        }finally {pool.freeConnection(conn, stmt, rs);}

    }


    // 로그인 실패 시 시도 횟수 증가
    private void incrementLoginAttempts(UserDTO user) throws Exception {
        String incrementTryNumSql = "UPDATE user SET user_trynum = user_trynum + 1 WHERE user_fk_comp_num = ? AND user_pk_num = ?";

        try {
            conn = pool.getConnection();
            stmt = conn.prepareStatement(incrementTryNumSql);
            stmt.setInt(1, user.getUser_fk_comp_num()); // 회사 코드
            stmt.setInt(2, user.getUser_pk_num());      // 사번 ID
            stmt.executeUpdate();
        } finally {pool.freeConnection(conn, stmt, rs);}
    }


    // 로그인 성공 시 시도 횟수 초기화
    private void resetLoginAttempts(UserDTO user) throws Exception {
        String resetTryNumSql = "UPDATE user SET user_trynum = 0 WHERE user_fk_comp_num = ? AND user_pk_num = ?";

        try {
            conn = pool.getConnection();
            stmt = conn.prepareStatement(resetTryNumSql);
            stmt.setInt(1, user.getUser_fk_comp_num()); // 회사 코드
            stmt.setInt(2, user.getUser_pk_num());      // 사번 ID
            stmt.executeUpdate();
        } finally {pool.freeConnection(conn, stmt, rs);}
    }


    // 5회 이상 실패 시 계정 잠금 처리 lockUserAccount
    private void lockUserAccount(UserDTO user) throws Exception {
        String checkTryNumSql = "SELECT user_trynum FROM user WHERE user_fk_comp_num = ? AND user_pk_num = ?";

        try {
            conn = pool.getConnection();
            stmt = conn.prepareStatement(checkTryNumSql);
            stmt.setInt(1, user.getUser_fk_comp_num());
            stmt.setInt(2, user.getUser_pk_num());
            rs = stmt.executeQuery();

            if (rs.next() && rs.getInt("user_trynum") >= 5) {
                String lockUserSql = "UPDATE user SET user_locked = 1 WHERE user_fk_comp_num = ? AND user_pk_num = ?";
                stmt = conn.prepareStatement(lockUserSql);
                stmt.setInt(1, user.getUser_fk_comp_num());
                stmt.setInt(2, user.getUser_pk_num());
                stmt.executeUpdate();
            }
        } finally {
            pool.freeConnection(conn, stmt, rs);
        }
    }

}