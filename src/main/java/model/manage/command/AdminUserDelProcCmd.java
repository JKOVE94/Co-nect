package model.manage.command;

import model.Icommand;
import model.manage.Admin_userDel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminUserDelProcCmd implements Icommand{

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int user_pk_num = Integer.parseInt(req.getParameter("user_pk_num"));
		
		Admin_userDel admin = new Admin_userDel();
		try {
			admin.userDel(user_pk_num);
		} catch (Exception e) {
			System.out.println("AdminUserDelProcCmd"+e);
		}
	
		return "/WEB-INF/views/manage/userList/userListTest.jsp";
	}
	
}
