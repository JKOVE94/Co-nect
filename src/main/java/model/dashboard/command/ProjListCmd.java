package model.dashboard.command;

import model.Icommand;
import model.dashboard.Proj_List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.ProjectDTO;

import java.io.IOException;
import java.util.List;

public class ProjListCmd implements Icommand {

	@Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Proj_List list = new Proj_List();
        String url = "";

        // sessionID를 사용해 프로젝트 리스트를 가져옴
        HttpSession session = req.getSession();
        String sessionID = (String) session.getAttribute("sessionID");
        List<ProjectDTO> projectList = null;
        
        //검색관련
        String keyField = req.getParameter("keyField");
        String keyWord = req.getParameter("keyWord");
        
        //검색어가 있을 경우 검색어가 들어있는 리스트만 가져옴
        projectList = list.getPost(sessionID,keyField,keyWord);
        

        // 리스트 저장
        if (projectList != null) {
        	session.setAttribute("list", projectList);
           url = "/WEB-INF/views/dashboard/project/projList.jsp";
        } else {
            // 만약 프로젝트 리스트가 비어있거나 null일 경우
            req.setAttribute("message", "프로젝트를 불러오는 데 실패했습니다.");
            url = "index.jsp";  // 실패 시 리디렉션
        }

        return url;
    }
}

