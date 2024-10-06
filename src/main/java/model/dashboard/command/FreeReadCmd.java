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

public class FreeReadCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Free_Read read = new Free_Read();
		String post_pk_num = req.getParameter("post_pk_num");
		req.setAttribute("post_pk_num", post_pk_num);
		Free_ReadCheck check = new Free_ReadCheck();
		PostDTO dto = null;

		dto = check.postDtoReturn(post_pk_num);
		
		//즐겨찾기 관련 코드
		Favorites_Check favor = new Favorites_Check();
		HttpSession session = req.getSession();
		String sessionID = (String)session.getAttribute("sessionID"); //로그인한 유저의 user_pk_num 가져오기
		boolean favoriteCheck = favor.FavoritesPostCheck(sessionID, Integer.parseInt(post_pk_num)); //로그인한 유저의 즐겨찾기에 등록된 글인지 확인
		dto.setFavoriteCheck(favoriteCheck); //true, false 값 전달
		
		req.getSession().setAttribute("dto", dto);
		
		return "/WEB-INF/views/dashboard/free/freeRead.jsp";
	}

}
