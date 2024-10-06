package model.dashboard.command;

import model.Icommand;
import model.dashboard.Todo_List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

public class DashHomeCmd implements Icommand {
    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	HttpSession session = req.getSession();
    	String sessionID = (String)session.getAttribute("sessionID");
    	
    	Todo_List todo = new Todo_List();
    	ArrayList todoList = todo.getTodoList(sessionID);
    	req.setAttribute("todoList", todoList);
    	
        return "/WEB-INF/views/dashboard/dashboard.jsp";
    }
}
