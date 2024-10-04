package model.manage.command;

import db.dto.UserDTO;
import model.Icommand;
import model.manage.Admin_userInfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminUserInfoProcCmd implements Icommand{

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int user_pk_num = Integer.parseInt(req.getParameter("user_pk_num"));
		Admin_userInfo admin = new Admin_userInfo();
		
		HttpSession session = req.getSession();
		
		try {
			UserDTO user = admin.userInfo(user_pk_num);
			session.setAttribute("user", user);
			
		} catch (Exception e) {
			System.out.println("AdminUserInfoProcCmd" + e);
		}
		
		return "/WEB-INF/views/manage/userInfo/userInfoTest.jsp";
	}

}
