package controller;

import model.Icommand;
import model.dashboard.factory.FactoryDash;
import model.dashboard.Proj_TagColor;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet{

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
		FactoryDash factory = FactoryDash.newInstance();
		icmd = factory.createInstance(fn);
		url = (String) icmd.method(req,resp);
		
		
		
		//프로젝트 tagcolor 값
		String tagColor = req.getParameter("proj_tagcol");
		
		//Proj_TagColor 객체 생성 후 메서드 호출
		Proj_TagColor tagManager = new Proj_TagColor();
		String tagCode = tagManager.TagCodeReturn(tagColor);
		
		System.out.println("태그컬러코드(servlet):"+ tagCode);
		//이후 태그컬로 코드 EL로 출력
		
		
		

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
