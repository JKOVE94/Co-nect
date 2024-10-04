package model.dashboard;

import db.dbcp.DBConnectionMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class Proj_Delete {

        // 게시글을 삭제하는 메서드
        public void projDelete(String proj_pk_num) {
            DBConnectionMgr pool = null;
            Connection conn = null;
            PreparedStatement stmt = null;
          
            try {
                pool = DBConnectionMgr.getInstance();
                conn = pool.getConnection();
                String sql = "DELETE FROM project WHERE proj_pk_num = ?";

                stmt = conn.prepareStatement(sql);
                stmt.setString(1, proj_pk_num);
                
                          
                stmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                    pool.freeConnection(conn,stmt);
            }

        }
    }
