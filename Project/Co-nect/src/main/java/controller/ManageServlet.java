package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Icommand;
import model.manage.factory.FactoryMgr;

@WebServlet("/manage")
public class ManageServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String url = "";
		String fn = req.getParameter("fn");

		Icommand icmd = null;
		FactoryMgr factory = FactoryMgr.newInstance();
		icmd = factory.createInstance(fn);
		url = (String) icmd.method(req,resp);

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
