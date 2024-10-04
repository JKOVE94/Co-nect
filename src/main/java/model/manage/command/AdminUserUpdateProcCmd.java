package model.manage.command;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import db.dto.FileDTO;
import db.dto.UserDTO;
import model.Icommand;
import model.manage.Admin_userInfo;
import model.manage.Admin_userUpdate;
import model.manage.FileSave;

public class AdminUserUpdateProcCmd implements Icommand{

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FileSave file = new FileSave();
		HashMap map = file.doFileSave(req);
		MultipartRequest multi = (MultipartRequest)map.get("MultipartRequest");
		FileDTO fileDto = (FileDTO)map.get("FileDTO");
		
		UserDTO user = new UserDTO();
		int userPkNum = Integer.parseInt(multi.getParameter("user_pk_num"));
		user.setUser_pk_num(userPkNum);
		user.setUser_pw(multi.getParameter("user_pw"));
		user.setUser_name(multi.getParameter("user_name"));
		user.setUser_mail(multi.getParameter("user_mail"));
		user.setUser_pic(fileDto.getFileName());
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		Date date = null;
		try {
			date = format.parse(multi.getParameter("user_regdate"));
		} catch (ParseException e) {e.printStackTrace();}
		
		user.setUser_regdate(date);
		user.setUser_rank(multi.getParameter("user_rank"));
		user.setUser_fk_job_num(Integer.parseInt(multi.getParameter("user_fk_job_num")));
		user.setUser_fk_dpart_num(Integer.parseInt(multi.getParameter("user_fk_dpart_num")));
		user.setUser_fk_acc_authornum(Integer.parseInt(multi.getParameter("user_fk_acc_authornum")));
		
		Admin_userUpdate admin = new Admin_userUpdate();
		Admin_userInfo admin2 = new Admin_userInfo();
		
		try {
			admin.userUpdate(user);
			user = admin2.userInfo(userPkNum);
			req.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "WEB-INF/views/manage/userInfo/userInfoUpdateTest.jsp";
	}

}
