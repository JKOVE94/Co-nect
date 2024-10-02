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
import model.landing.AES;

public class ProjReadCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Proj_Read read = new Proj_Read();
		String proj_pk_num = req.getParameter("proj_pk_num");

		Proj_ReadCheck check = new Proj_ReadCheck();
		ProjectDTO dto = null;

		dto = check.projDtoReturn(proj_pk_num);
		
		//즐겨찾기에 등록된 글인지 확인 후 dto에 값 저장
		Favorites_Check favor = new Favorites_Check();
		
		HttpSession session = req.getSession();
		String sessionID = null;
		try { sessionID = (String)AES.Decode((String)session.getAttribute("sessionID")); } 
		catch (Exception e) { System.out.println("ProjReadCmd"+ e); }
		
		boolean favoriteCheck = favor.FavoritesProjCheck(sessionID, Integer.parseInt(proj_pk_num));
		dto.setFavoriteCheck(favoriteCheck);
		
		req.getSession().setAttribute("dto", dto);

		return "/WEB-INF/views/dashboard/project/projRead.jsp";
	}

}
