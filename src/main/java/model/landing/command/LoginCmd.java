package model.landing.command;

import model.Icommand;
import model.dashboard.Todo_List;
import model.landing.Login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.TodoDTO;

import java.io.IOException;
import java.util.ArrayList;

public class LoginCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Login dao = new Login();
        String message = null, url="";

        HttpSession session = req.getSession(true); 
    	String user_pk_num = req.getParameter("user_pk_num");
    	
        try {
            message = dao.LoginMessage(req);
            
            //user_pk_num을 sessionID에 저장
			session.setAttribute("sessionID", user_pk_num);
			
			//로그인한 사용자의 일정 목록 todoList에 담기
			Todo_List todo = new Todo_List();
			ArrayList<TodoDTO> todoList = todo.getTodoList(user_pk_num);
			req.setAttribute("todoList", todoList);
					
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