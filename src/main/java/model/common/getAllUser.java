package model.common;

import db.dbcp.DBConnectionMgr;
import db.dto.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class getAllUser {
    public HashMap<Integer,UserDTO> getAllUserInfo(){
            DBConnectionMgr pool =null;
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            HashMap<Integer,UserDTO> map = new HashMap<Integer,UserDTO>();
            try {
                pool = DBConnectionMgr.getInstance();
                conn = pool.getConnection();

                String sql = "SELECT * FROM user";

                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
                    UserDTO dto = new UserDTO();
                    int user_pk_num = rs.getInt("user_pk_num");

                    dto.setUser_pk_num(rs.getInt("user_pk_num"));
                    dto.setUser_name (rs.getString("user_name"));
                    dto.setUser_pw(rs.getString("user_pw"));
                    dto.setUser_mail(rs.getString("user_mail"));
                    dto.setUser_pic(rs.getString("user_pic"));
                    dto.setUser_regdate(rs.getDate("user_regdate"));
                    dto.setUser_rank(rs.getString("user_rank"));
                    dto.setUser_lastlogin(rs.getDate("user_lastlogin"));
                    dto.setUser_fk_job_num(rs.getInt("user_fk_job_num"));
                    dto.setUser_fk_dpart_num(rs.getInt("user_fk_dpart_num"));
                    dto.setUser_fk_acc_authornum(rs.getInt("user_fk_acc_authornum"));
                    dto.setUser_fk_comp_num(rs.getInt("user_fk_comp_num"));
                    dto.setUser_trynum(rs.getInt("user_trynum"));
                    dto.setUser_locked(rs.getInt("user_locked"));

                    map.put(user_pk_num,dto);
                }
            }
            catch (Exception e) {
                System.out.println("getAllUser : "+e);

            } finally {
                if (conn != null) {
                    pool.freeConnection(conn,stmt);
                }
            }
            return map;
    }
    public HashMap<String,String> getAllUserName(){
        DBConnectionMgr pool =null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        HashMap<String,String> map = new HashMap<String,String>();
        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();

            String sql = "SELECT user_pk_num, user_name FROM user";

            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                String user_pk_num = rs.getString("user_pk_num");
                String user_name = rs.getString("user_name");

                map.put(user_pk_num,user_name);
            }
        }
        catch (Exception e) {
            System.out.println("getAllUser : "+e);

        } finally {
            if (conn != null) {
                pool.freeConnection(conn,stmt);
            }
        }
        return map;
    }
}
