package model.manage;

import com.oreilly.servlet.MultipartRequest;
import db.dto.FileDTO;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;

public class FileSave {
	
	public HashMap doFileSave(HttpServletRequest request) throws IOException {
		
		HashMap map = new HashMap();
		
		FileDTO fileDto = new FileDTO();
		fileDto.setDirPath("/asset/emp_pic"); //파일을 저장할 디렉토리명
		fileDto.setSize(10 * 1024 * 1024); //저장할 파일의 최대 사이즈
		
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath(fileDto.getDirPath()); //실제 파일 시스템 경로
		
		MultipartRequest multi = new MultipartRequest(request, realPath, fileDto.getSize(), "UTF-8"); //파일저장
		
		File oldFile = multi.getFile("user_pic"); //저장된 파일의 이름을 변경하기 위해 객체 생성
		
		if (oldFile!= null) {
			String oldFileName = oldFile.getName();
			String fileExtension = oldFileName.substring(oldFileName.lastIndexOf('.'),oldFileName.length());
			int userPkNum = Integer.parseInt(multi.getParameter("user_pk_num"));
			fileDto.setFileName(fileDto.getDirPath()+"/"+userPkNum +fileExtension); // DB에 저장될 파일명은 디렉토리/사번.확장
			
			File newFile = new File(realPath, userPkNum + fileExtension); //새로 저장될 파일명
			
			if(newFile.exists()) { //기존에 저장되어 있는 이미지 파일 삭제
				newFile.delete();
			}
			oldFile.renameTo(newFile); //이름변경
		}

		//파일정보와 multiReq 정보 전달
		map.put("FileDTO", fileDto); 
		map.put("MultipartRequest", multi);
		
		return map;
	}

	
	
}
