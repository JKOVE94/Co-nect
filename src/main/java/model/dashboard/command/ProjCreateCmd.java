package model.dashboard.command;

import model.Icommand;
import model.dashboard.Proj_Create;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProjCreateCmd implements Icommand{
	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("utf-8");

		Proj_Create create = new Proj_Create();
		create.setPost(req,resp);
		//return "";
		return "/WEB-INF/views/dashboard/project/projCreate.jsp";
	}
}