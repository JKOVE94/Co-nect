package model.dashboard.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Icommand;

public class ProjCreateWriteCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "/WEB-INF/views/dashboard/project/projCreate.jsp";
	}
	
}
