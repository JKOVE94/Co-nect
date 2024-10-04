package model.manage.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Icommand;
import model.manage.Locked_userList;

public class AdminLockUserCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Locked_userList user = new Locked_userList();
		ArrayList userList = null;
		
		try {
			userList = user.userList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		req.getSession().setAttribute("userList", userList);
		
		return "WEB-INF/views/manage/lockedUser/userList.jsp";
	}

}
