package model.dashboard.command;

import model.Icommand;
import model.dashboard.Proj_List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProjListCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	Proj_List list = new Proj_List();
    	req.getSession().setAttribute("list", list.getPost());
    	return "/WEB-INF/views/dashboard/project/projList.jsp";
    }
}
