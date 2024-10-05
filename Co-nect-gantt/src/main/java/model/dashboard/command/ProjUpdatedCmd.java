package model.dashboard.command;

import model.Icommand;
import model.dashboard.Proj_Update;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dto.ProjectDTO;

import java.io.IOException;

public class ProjUpdatedCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String proj = req.getParameter("proj_pk_num");
    	String projName = req.getParameter("proj_name");
	    String projMembers = req.getParameter("proj_members");
	    String projFk_user_num = req.getParameter("proj_fk_user_num");
	    String projFk_depart_num = req.getParameter("proj_fk_dpart_num");
	    String projStatus = req.getParameter("proj_status");
	    String projImport = req.getParameter("proj_import");
	    String projDesc = req.getParameter("proj_desc");

	    Proj_Update update = new Proj_Update();
	    
	    ProjectDTO proju = update.projSaveUpdatePost(projName, projDesc,
	    		projStatus, projMembers, projImport,
	    		projFk_user_num, projFk_depart_num, proj);

		req.getSession().setAttribute("dto",proju);

    	return "/WEB-INF/views/dashboard/project/projRead.jsp?proj_pk_num=" + proj;
    }
}
