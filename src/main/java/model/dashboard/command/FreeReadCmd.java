package model.dashboard.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.PostDTO;
import model.Icommand;
import model.dashboard.Free_Read;
import model.dashboard.Free_ReadCheck;
import model.favorites.Favorites_Check;
import model.landing.AES;

public class FreeReadCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Free_Read read = new Free_Read();
		String post_num = req.getParameter("post_num");
		req.setAttribute("post_num", post_num);
		Free_ReadCheck check = new Free_ReadCheck();
		PostDTO dto = null;

		dto = check.postDtoReturn(post_num);
		
		//즐겨찾기에 등록된 글인지 확인 후 dto에 값 저장
		Favorites_Check favor = new Favorites_Check();
		
		HttpSession session = req.getSession();
		String sessionID = null;
		try {
			sessionID = (String)AES.Decode((String)session.getAttribute("sessionID"));
		} catch (Exception e) { System.out.println("FreeReadCmd"+ e); }
		
		boolean favoriteCheck = favor.FavoritesPostCheck(sessionID, Integer.parseInt(post_num));
		dto.setFavoriteCheck(favoriteCheck);
		
		req.getSession().setAttribute("dto", dto);
		
		return "/WEB-INF/views/dashboard/free/freeRead.jsp";
	}

}
