package model.dashboard.command;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import db.dbcp.DBConnectionMgr;
import db.dto.ProjectDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Icommand;
import model.dashboard.Proj_Create;

import javax.servlet.ServletException;

public class ProjCreateCmd implements Icommand{

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		ProjectDTO dto = new ProjectDTO();
		
		dto.setProj_name(req.getParameter("proj_name"));
		dto.setProj_desc(req.getParameter("proj_desc"));
		dto.setProj_status(req.getParameter("proj_status"));
		dto.setProj_members(req.getParameter("proj_members"));
		dto.setProj_import(req.getParameter("proj_import"));
		dto.setProj_tag(req.getParameter("proj_tag"));
		dto.setProj_tagcol(req.getParameter("proj_tagcol"));
		dto.setProj_fk_user_num(Integer.parseInt(req.getParameter("proj_fk_user_num")));
		dto.setProj_fk_dpart_num(Integer.parseInt(req.getParameter("proj_fk_dpart_num")));
		dto.setProj_fk_comp_num(Integer.parseInt(req.getParameter("proj_fk_comp_num")));
		
		Proj_Create proj = new Proj_Create();
		proj.setPost(dto);
		
		return "/WEB-INF/views/dashboard/project/projList.jsp"; 
    }
}

