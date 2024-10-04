package model.dashboard.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.PostDTO;
import db.dto.ProjectDTO;
import model.Icommand;
import model.dashboard.Free_Read;
import model.dashboard.Free_ReadCheck;
import model.dashboard.Proj_Read;
import model.dashboard.Proj_ReadCheck;
import model.favorites.Favorites_Check;

public class ProjReadCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Proj_Read read = new Proj_Read();
		String proj_pk_num = req.getParameter("proj_pk_num");

		Proj_ReadCheck check = new Proj_ReadCheck();
		ProjectDTO dto = null;

		dto = check.projDtoReturn(proj_pk_num);
		
		//즐겨찾기 관련 코드
		Favorites_Check favor = new Favorites_Check();
		HttpSession session = req.getSession();
		String sessionID = (String)session.getAttribute("sessionID");
		
		boolean favoriteCheck = favor.FavoritesProjCheck(sessionID, Integer.parseInt(proj_pk_num));
		//로그인한 유저의 즐겨찾기에 등록된 글인지 확인
		dto.setFavoriteCheck(favoriteCheck); //true, false 값 전달
		
		req.getSession().setAttribute("dto", dto);

		return "/WEB-INF/views/dashboard/project/projRead.jsp";
	}

}
