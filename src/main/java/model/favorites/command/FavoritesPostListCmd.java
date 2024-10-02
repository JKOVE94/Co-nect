package model.favorites.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.FavoritesDTO;
import model.Icommand;
import model.favorites.Favorites_PostList;
import model.landing.AES;

public class FavoritesPostListCmd implements Icommand{

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String sessionID = null;
		try {
			sessionID = AES.Decode((String)session.getAttribute("sessionID"));
		} catch (Exception e) { System.out.println("FavoritesListCmd" + e); }
		
		
		Favorites_PostList favor = new Favorites_PostList();
		ArrayList list = favor.FavoritesPostList(Integer.parseInt(sessionID));
		
		req.setAttribute("list", list);

		return "/WEB-INF/views/favorites/favoritespostlist.jsp";
	}

}
