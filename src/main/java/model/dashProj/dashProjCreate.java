
/*
package model.dashProj;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbcp.DBConnectionMgr;
import db.dto.ProjectDTO;

public class dashProjCreate {
    
    public String setPost(HttpServletRequest req, HttpServletResponse resp) {
    
        try {
            req.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        resp.setCharacterEncoding("utf-8");
        
        ProjectDTO dto = new ProjectDTO();
        
        dto.setProj_name(req.getParameter("proj_name"));
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date startDate = dateFormat.parse(req.getParameter("proj_startdate"));
            java.util.Date endDate = dateFormat.parse(req.getParameter("proj_enddate"));
            dto.setProj_startdate(new Date(startDate.getTime()));
            dto.setProj_enddate(new Date(endDate.getTime()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        dto.setProj_members(req.getParameter("proj_members"));
        dto.setProj_status(req.getParameter("proj_status"));
        dto.setProj_import(req.getParameter("proj_import"));
        
        DBConnectionMgr pool = null;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            pool = DBConnectionMgr.getInstance();
            conn = pool.getConnection();
                    
            String sql = "INSERT INTO project(proj_name, proj_startdate, proj_enddate, proj_status, proj_members, proj_import) VALUES(?,?,?,?,?,?)";
            
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, dto.getProj_name());
            stmt.setDate(2, dto.getProj_startdate());
            stmt.setDate(3, dto.getProj_enddate());
            stmt.setString(4, dto.getProj_members());
            stmt.setString(5, dto.getProj_status());
            stmt.setString(6, dto.getProj_import());
            
            stmt.executeUpdate();
            
        } catch (Exception e) {
            System.out.println("Project : " + e);
        } finally {
            if (conn != null) {
                pool.freeConnection(conn, stmt);
            }
            
        }
        
        return "/webapp/prototype/details.jsp";
    }
}
*/