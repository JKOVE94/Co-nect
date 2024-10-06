package model.dashProj.command;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.dbcp.DBConnectionMgr;
import db.dto.TaskDTO;
import model.Icommand;

public class DashProjCreateCmd implements Icommand {
    
    
    @Override
    public String method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TaskDTO dto = new TaskDTO();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dto.setTask_title(req.getParameter("task_title"));
   
       
        try {
        	
            java.util.Date startDate = dateFormat.parse(req.getParameter("task_startdate"));
            java.util.Date endDate = dateFormat.parse(req.getParameter("task_enddate"));
            dto.setTask_startdate(new Date(startDate.getTime()));
            dto.setTask_enddate(new Date(endDate.getTime()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        
       
        dto.setTask_status(req.getParameter("task_status"));
        dto.setTask_desc(req.getParameter("task_desc"));
        
        DBConnectionMgr pool = null;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();
                    
            String sql = "INSERT INTO task(task_title, task_startdate, task_enddate, task_status, task_desc) VALUES(?,?,?,?,?)";
            
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, dto.getTask_title());
            stmt.setDate(2, dto.getTask_startdate());
            stmt.setDate(3, dto.getTask_enddate());
            stmt.setString(4, dto.getTask_status());
            stmt.setString(5, dto.getTask_desc());
            
            stmt.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("Task : " + e);
        } finally {
            if (conn != null) {
                pool.freeConnection(conn, stmt);
            }
        }
    
        return "dashProj?fn=taskRead";
	}
}