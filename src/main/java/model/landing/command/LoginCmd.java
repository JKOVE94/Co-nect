package model.landing.command;

import model.Icommand;
import model.landing.Login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

public class LoginCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Login dao = new Login();
        String message = null, url="";

        HttpSession session = req.getSession(true); 
    	String user_pk_num = req.getParameter("user_pk_num");
    	
        try {
            message = dao.LoginMessage(req);
            
            //유저별로 즐겨찾기 목록이 다르기 때문에
            //user_pk_num을 sessionID에 저장하여 전달합니다.
			session.setAttribute("sessionID", user_pk_num);
			
        } catch (Exception e) {
            e.printStackTrace();
        }        
        
        if(message==null) {
            url = "/WEB-INF/views/dashboard/dashboard.jsp";
        }
        else {
            req.setAttribute("message", message);
            url = "index.jsp";
        }
        return url;
    }
}