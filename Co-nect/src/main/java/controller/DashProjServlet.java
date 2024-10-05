package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Icommand;
import model.dashProj.factory.FactoryDashProj;

@WebServlet("/dashProj")
public class DashProjServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
		
	}
	
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
    	String url = "";
        String fn = req.getParameter("fn");
        
        Icommand icmd = null;
		FactoryDashProj factory = FactoryDashProj.newInstance();
		icmd = factory.createInstance(fn);
		url = (String) icmd.method(req,resp);
		
	if (url == null) {
	    // 반환 값이 null인 경우 예외 처리
	    resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Command returned null");
	    return;
	}


		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		
    }
}
        