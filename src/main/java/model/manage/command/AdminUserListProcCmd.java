package model.manage.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Icommand;
import model.manage.Admin_userList;

public class AdminUserListProcCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList list = new ArrayList();
		Admin_userList userList = new Admin_userList();
		
		try {
			list = userList.userList(1);
		} catch (Exception e) {
			System.out.println("AdminUserListCmd :" +e);
		}
		HttpSession session = req.getSession();
		
		session.setAttribute("userList", list);
		return "/WEB-INF/views/manage/userList/userListTest.jsp";
	}

}
