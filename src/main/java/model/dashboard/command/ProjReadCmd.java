package model.dashboard.command;

import db.dto.ProjectDTO;
import db.dto.TaskDTO;
import model.Icommand;
import model.common.getAllProj;
import model.common.getAllTask;
import model.common.getAllUser;
import model.dashboard.Proj_Read;
import model.dashboard.Proj_ReadCheck;
import model.dashboard.Proj_TagColor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class ProjReadCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Proj_Read read = new Proj_Read();
		String proj_pk_num = req.getParameter("proj_pk_num");

		Proj_ReadCheck check = new Proj_ReadCheck();
		ProjectDTO getProjDTO = null;
		ArrayList<TaskDTO> getTaskList = null;
		HashMap<String,String> getUserNameMap = null;
		HashMap<String,String> getUserMailMap = null;
		HashMap<String,String> getProTagColMap =  new HashMap<String,String>();
		

		getAllProj proj = new getAllProj();
		getAllTask task = new getAllTask();
		getAllUser user = new getAllUser();
		
		getProjDTO = proj.getAllProjInfo(proj_pk_num);
		
		/*태그컬러 관련 코드*/
	
		//Proj_TagColor 객체 생성
		Proj_TagColor tagCode = new Proj_TagColor();
		//getAllProjInfo 메서드에서 tagcol 값 가져오기
		String projTagcol = getProjDTO.getProj_tagcol();
		//map에 저장
		getProTagColMap.put(projTagcol, tagCode.TagCodeReturn(projTagcol));
		
		
		getTaskList = task.getAllTaskInfo(proj_pk_num);
		getUserNameMap = user.getAllUserName();
		getUserMailMap = user.getAllUserEmail();
		
		
		
		//세션에 저장
		req.getSession().setAttribute("getProjDTO", getProjDTO);
		req.getSession().setAttribute("getTaskList", getTaskList);
		req.getSession().setAttribute("getUserNameMap", getUserNameMap);
		req.getSession().setAttribute("getUserMailMap", getUserMailMap);
		req.getSession().setAttribute("getProTagColMap", getProTagColMap);
		

		//return "asset/2_dashboard/page/taskTree.jsp";
		return "/WEB-INF/views/dashboard/project/projRead.jsp";
	}
}