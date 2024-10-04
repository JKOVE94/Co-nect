package model.manage.command;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import db.dto.FileDTO;
import db.dto.UserDTO;
import model.Icommand;
import model.manage.Admin_userDel;
import model.manage.Admin_userInfo;
import model.manage.Admin_userUpdate;
import model.manage.FileSave;

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
