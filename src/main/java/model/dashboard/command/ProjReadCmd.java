package model.dashboard.command;

import db.dto.ProjectDTO;
import db.dto.TaskDTO;
import model.Icommand;
import model.common.getAllProj;
import model.common.getAllTask;
import model.common.getAllUser;
import model.dashboard.Proj_Read;
import model.dashboard.Proj_ReadCheck;

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
		HashMap<String,String> getUserMap = null;
		getAllProj proj = new getAllProj();
		getAllTask task = new getAllTask();
		getAllUser user = new getAllUser();
		
		getProjDTO = proj.getAllProjInfo(proj_pk_num);
		getTaskList = task.getAllTaskInfo(proj_pk_num);
		getUserMap = user.getAllUserName();

		req.getSession().setAttribute("getProjDTO", getProjDTO);
		req.getSession().setAttribute("getTaskList", getTaskList);
		req.getSession().setAttribute("getUserMap", getUserMap);

		return "asset/2_dashboard/page/taskTree.jsp";
		//return "/WEB-INF/views/dashboard/project/projRead.jsp";
	}
}
