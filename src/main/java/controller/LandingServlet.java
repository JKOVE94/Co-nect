package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/landing")
public class LandingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = "";
        String fn = req.getParameter("fn");
		String compNum = req.getParameter("comp_pk_num");
        if (fn.equals("LOGIN")) {
			System.out.println("LOGIN 실행중");
            url = "/WEB-INF/views/dashboard/dashboard.jsp";
        }
		/* 여기를 수정해주세요
		else if (fn.equals("CART")) {
			url = "/WEB-INF/views/bookshop.jsp";
		}
		
		else if (fn.equals("DEL")) {
		}
		
		else if (fn.equals("BUY")) {
		}
		*/
        
        RequestDispatcher view = req.getRequestDispatcher(url);
        view.forward(req, resp);
    }

}
