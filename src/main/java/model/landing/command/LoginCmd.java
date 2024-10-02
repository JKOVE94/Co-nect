package model.landing.command;

import model.Icommand;
import model.landing.AES;
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
    	String sessionID = null;
    	
        try {
            message = dao.LoginMessage(req);
            
            //user_pk_num을 암호화하여 session에 저장합니다(즐겨찾기 관련 코드)
            sessionID = AES.Encode(user_pk_num);
			session.setAttribute("sessionID", sessionID);
			
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