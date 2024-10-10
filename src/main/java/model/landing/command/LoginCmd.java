package model.landing.command;

import db.dto.UserDTO;
import model.Icommand;
import model.common.getAllPost;
import model.common.getAllProj;
import model.common.getAllTodo;
import model.common.getAllUser;
import model.landing.Login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.PostDTO;
import db.dto.ProjectDTO;
import db.dto.TodoDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class LoginCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Login dao = new Login();
        String message = null, url="";
        
        HttpSession session = req.getSession(true); 
    	String user_pk_num = req.getParameter("user_pk_num");
    	String comp_pk_num = req.getParameter("comp_pk_num");
    	
    	req.getSession().setAttribute("sessionID", user_pk_num);
    	req.getSession().setAttribute("sessionComp", comp_pk_num);

        try {
            message = dao.LoginMessage(req);
        } catch (Exception e) {
            e.printStackTrace();
            message = "잘못된 정보입니다";
            //예외 확인
            System.out.println("예외발생(java) :" + e );
            System.out.println("message(LoginCmd_예외):"+ message);

        }

        if(message==null) {
            url = "/WEB-INF/views/dashboard/dashboard.jsp";
               
            //프로젝트 관련 정보
    		HashMap<String, String> getUserNameMap = null;
    		HashMap<String, String> getUserMailMap = null;
    		
    		getAllUser user = new getAllUser();
    		getAllProj proj = new getAllProj();
    		getAllPost post = new getAllPost();
    		getAllTodo todo = new getAllTodo();
    		
    		getUserNameMap = user.getAllUserName();
    		getUserMailMap = user.getAllUserEmail();

			HashMap<Integer, UserDTO> userMap = user.getAllUserInfo();
    		ArrayList<ProjectDTO> projList = proj.getAllProjInfoList();
    		ArrayList<PostDTO> postList = post.getAllPostInfoList();
    		ArrayList<TodoDTO> todoList = todo.getAllTodoList();
    		
    		//사번으로 사원의 이름을 찾을 수 있는 HashMap<사번, 이름>
    		req.getSession().setAttribute("getUserNameMap", getUserNameMap);
    		//사번으로 사원의 이메일을 찾을 수 있는 HashMap<사번, 이메일>
    		req.getSession().setAttribute("getUserMailMap", getUserMailMap);
    		//프로젝트 전체 정보
    		req.getSession().setAttribute("AllProject", projList);
    		//게시판 전체 정보
    		req.getSession().setAttribute("AllPost", postList);
    		//투두리스트 전체 정보
    		req.getSession().setAttribute("AllTodo", todoList);
    		//유저 권한 정보
			int authorNum = userMap.get(Integer.parseInt(user_pk_num)).getUser_fk_acc_authornum();

			req.getSession().setAttribute("sessionAuthor",authorNum);

        }
        else {
            req.setAttribute("message", message);
            System.out.println("message(LoginCmd_로그인 실패):"+ message);
            url = "index.jsp";
        }
        return url;
    }
}