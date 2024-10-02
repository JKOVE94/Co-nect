package model.dashboard.command;

import model.Icommand;
import model.dashboard.Proj_List;
import model.landing.AES;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

public class ProjListCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	Proj_List list = new Proj_List();
    	
    	//세션에 저장된 암호화된 user_pk_num을 복호화하여 매개변수로 전달(즐겨찾기 관련 코드)
    	HttpSession session = req.getSession();
    	String sessionID = null;
    	try { sessionID = (String)AES.Decode((String)session.getAttribute("sessionID")); } 
    	catch ( Exception e ) { System.out.println("ProjListCmd + e"); }
    	
    	req.getSession().setAttribute("list", list.getPost(sessionID));
    	return "/WEB-INF/views/dashboard/project/projList.jsp";
    }
}
