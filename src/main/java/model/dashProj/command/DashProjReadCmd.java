package model.dashProj.command;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbcp.DBConnectionMgr;
import db.dto.TaskDTO;
import model.Icommand;

public class DashProjReadCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
        List<TaskDTO> taskList = new ArrayList<>();
        
        DBConnectionMgr pool = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String proj_pk_num =(String) req.getParameter("proj_pk_num");
        System.out.println("proj_pk_num : "+proj_pk_num);

        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();
            
            String sql = "SELECT * FROM task";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                TaskDTO task = new TaskDTO();
                task.setTask_pk_num(rs.getInt("task_pk_num"));
                task.setTask_title(rs.getString("task_title"));
                task.setTask_desc(rs.getString("task_desc"));
                task.setTask_startdate(rs.getDate("task_startdate"));
                task.setTask_deadline(rs.getDate("task_deadline"));
                task.setTask_enddate(rs.getDate("task_enddate"));
                task.setTask_duration(rs.getInt("task_duration"));
                task.setTask_progress(rs.getInt("task_progress"));
                task.setTask_status(rs.getString("task_status"));
                task.setTask_priority(rs.getInt("task_priority"));
                task.setTask_fk_user_num(rs.getInt("task_fk_user_num"));
                task.setTask_fk_proj_num(rs.getInt("task_fk_proj_num"));
                task.setTask_fk_task_num(rs.getInt("task_fk_task_num"));
                task.setTask_created(rs.getDate("task_created"));
                task.setTask_updated(rs.getDate("task_updated"));
                task.setTask_version(rs.getInt("task_version"));
                
                taskList.add(task);
            }

            req.setAttribute("taskList", taskList);

        } catch (Exception e) {
            System.out.println("Task Read 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (pool != null) {
                pool.freeConnection(conn, pstmt, rs);
            }
        }
        
       

        req.setAttribute("taskList", taskList);
        
        return "/dashboard?fn=PROJ_READ&proj_pk_num="+proj_pk_num;
    }
}