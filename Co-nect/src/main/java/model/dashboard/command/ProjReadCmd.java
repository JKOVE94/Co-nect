package model.dashboard.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dto.PostDTO;
import db.dto.ProjectDTO;
import model.Icommand;
import model.dashboard.Free_Read;
import model.dashboard.Free_ReadCheck;
import model.dashboard.Proj_Read;
import model.dashboard.Proj_ReadCheck;

public class ProjReadCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Proj_Read read = new Proj_Read();
		String proj_pk_num = req.getParameter("proj_pk_num");

		Proj_ReadCheck check = new Proj_ReadCheck();
		ProjectDTO dto = null;

		dto = check.projDtoReturn(proj_pk_num);

		req.getSession().setAttribute("dto", dto);

		return "/WEB-INF/views/dashboard/project/projRead.jsp";
	}

}
