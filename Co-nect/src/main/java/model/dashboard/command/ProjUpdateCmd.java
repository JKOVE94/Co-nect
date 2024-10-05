package model.dashboard.command;

import model.Icommand;
import model.dashboard.Free_Update;
import model.dashboard.Proj_Update;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dto.PostDTO;
import db.dto.ProjectDTO;

import java.io.IOException;

public class ProjUpdateCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String proj_pk_num = req.getParameter("proj_pk_num");
		Proj_Update update = new Proj_Update();

		ProjectDTO proj = update.updatePost(proj_pk_num);
		req.getSession().setAttribute("dto", proj);
		
        return "/WEB-INF/views/dashboard/project/projUpdate.jsp";
    }
}
