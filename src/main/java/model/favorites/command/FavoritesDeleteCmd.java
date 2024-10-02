package model.favorites.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Icommand;
import model.favorites.Favorites_Del;
import model.landing.AES;

public class FavoritesDeleteCmd implements Icommand{

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String post_pk_num = req.getParameter("post_pk_num");
		String proj_pk_num = req.getParameter("proj_pk_num");
		String url = req.getParameter("url");
		
		HttpSession session = req.getSession();
		String sessionID = null;
		try {
			sessionID = AES.Decode((String) session.getAttribute("sessionID"));
		} catch (Exception e) { System.out.println("FavoritesDeleteCmd"+e); }
		
		Favorites_Del favor = new Favorites_Del();
		
		favor.FavoritesDel(Integer.parseInt(sessionID), post_pk_num, proj_pk_num);
		
		if(post_pk_num != null && url.equals("LIST")) {
			return "/dashboard?fn=FREE_LIST";
		} else if(post_pk_num != null && url.equals("READ")) {
			return "/dashboard?fn=FREE_READ&post_num="+post_pk_num;
		} else if(proj_pk_num != null && url.equals("LIST")) {
			return "/dashboard?fn=PROJ_LIST";
		} else if(proj_pk_num != null && url.equals("READ")){
			return "/dashboard?fn=PROJ_READ&proj_num="+proj_pk_num;
		} else {
			return "/favorites?fn=FAVOR_LIST";
		} 
		
	}

}
