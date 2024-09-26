package model.manage;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.dto.UserDTO;

//spring 이후 적용
public class UserImage {
	public UserDTO saveUserImage(String realPath, MultipartRequest multi) {
		// String folderLoc = "파일경로";

		UserDTO dto = new UserDTO();

		// user_pk_num 파라미터 값 가져오기
		int userPkNum = Integer.parseInt(multi.getParameter("user_pk_num"));
		String newFileName = userPkNum + ".jpg";

		// 파라미터 값 가져오기
		String userName = multi.getParameter("user_name");
		String userPw = multi.getParameter("user_pw");
		String userMail = multi.getParameter("user_mail");
		String userRegDate = multi.getParameter("user_regdate");
		String userRank = multi.getParameter("user_rank");
		int userFkJobNum = Integer.parseInt(multi.getParameter("user_fk_job_num"));
		int userFkDpartNum = Integer.parseInt(multi.getParameter("user_fk_dpart_num"));
		int userFkAccAuthornum = Integer.parseInt(multi.getParameter("user_fk_acc_authornum"));
		int userFkCompNum = Integer.parseInt(multi.getParameter("user_fk_comp_num"));

		// DTO에 값 저장
		dto.setUser_name(userName);
		dto.setUser_pk_num(userPkNum);
		dto.setUser_pw(userPw);
		dto.setUser_mail(userMail);
		dto.setUser_regdate(userRegDate);
		dto.setUser_rank(userRank);
		dto.setUser_fk_job_num(userFkJobNum);
		dto.setUser_fk_dpart_num(userFkDpartNum);
		dto.setUser_fk_acc_authornum(userFkAccAuthornum);
		dto.setUser_fk_comp_num(userFkCompNum);
		
		// 파일을 새 이름으로 변경
		File oldFile = multi.getFile("user_pic");
		if (oldFile != null) {
			File newFile = new File(realPath, newFileName);
			oldFile.renameTo(newFile); // 파일 이름 변경
			// 최종 파일명을 DTO에 저장
			dto.setUser_pic("/asset/emp_pic/"+newFileName); // DTO에 최종 파일명 저장
		}
		return dto;
	}
}