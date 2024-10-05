package model.landing.command;

import model.Icommand;
import model.landing.Login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Login dao = new Login();
        String message = null, url="";


        try {
            message = dao.LoginMessage(req);
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