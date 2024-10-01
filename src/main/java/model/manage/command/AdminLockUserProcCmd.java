package model.manage.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dto.UserDTO;
import model.Icommand;
import model.manage.Locked_unlock;

public class AdminLockUserProcCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<UserDTO> list = new ArrayList<UserDTO>(); 
		String [] userPkNum = req.getParameterValues("user_pk_num");
		String [] userLocked = req.getParameterValues("user_locked");
		
		for(int i=0; i<userPkNum.length; i++) {
			UserDTO user = new UserDTO();
			user.setUser_pk_num(Integer.parseInt(userPkNum[i]));
			user.setUser_locked(Integer.parseInt(userLocked[i]));
			
			list.add(user);
		}
		
		Locked_unlock unlock = new Locked_unlock();
		unlock.UnLock(list);
		
		return "WEB-INF/views/manage/lockedUser/unlocksuccess.jsp";
	}

}
