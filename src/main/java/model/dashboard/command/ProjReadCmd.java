package model.dashboard.command;

import db.dto.ProjectDTO;
import db.dto.TaskDTO;
import model.Icommand;
import model.common.getAllProj;
import model.common.getAllTask;
import model.common.getAllUser;
import model.dashboard.Proj_Read;
import model.dashboard.Proj_ReadCheck;
import model.dashboard.Proj_subfn;

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
		

		getAllProj proj = new getAllProj();
		getAllTask task = new getAllTask();
	
		getProjDTO = proj.getAllProjInfo(proj_pk_num);
		getTaskList = task.getAllTaskInfo(proj_pk_num);
		
		HashMap<String, Object> projSubFn = new HashMap<>();
		HashMap<String, String> getUserNameMap = null;
		HashMap<String, String> getUserMailMap = null;
		
		getAllUser user = new getAllUser();
		Proj_subfn subFn = new Proj_subfn();
		
		getUserNameMap = user.getAllUserName();
		getUserMailMap = user.getAllUserEmail();
		
		//서브 기능 : 프로젝트 잔여날자 계산, 진행도 계산
		String remainDate = subFn.remainDate(getProjDTO);
		String progression = subFn.progression(getTaskList);
		
		projSubFn.put("RD",remainDate); //남은일자
		projSubFn.put("PG",progression); //진행도
		
			
		//해당 프로젝트의 프로젝트 정보 DTO
		req.getSession().setAttribute("getProjDTO", getProjDTO);
		//해당 프로젝트의 전체 업무 정보 ArrayList<TaskDTO>
		req.getSession().setAttribute("getTaskList", getTaskList);
		req.getSession().setAttribute("projSubFn", projSubFn);
		

		// return "asset/2_dashboard/page/taskTree.jsp";
		return "/WEB-INF/views/dashboard/project/projRead.jsp";
	}
}
