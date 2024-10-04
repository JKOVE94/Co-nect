package model.dashboard.command;

import model.Icommand;
import model.dashboard.Proj_List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

public class ProjListCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	Proj_List list = new Proj_List();
    	
    	//즐겨찾기 등록 여부 확인을 위해 sessionID를 전달 
    	HttpSession session = req.getSession();
    	String sessionID = (String)session.getAttribute("sessionID");
    	
    	req.getSession().setAttribute("list", list.getPost(sessionID));
    	return "/WEB-INF/views/dashboard/project/projList.jsp";
    }
}
