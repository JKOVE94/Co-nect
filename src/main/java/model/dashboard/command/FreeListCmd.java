package model.dashboard.command;

import model.Icommand;
import model.dashboard.Free_List;
import model.favorites.Favorites_Check;
import model.landing.AES;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.dto.PostDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class FreeListCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            Free_List list = new Free_List();
            
            //세션에 저장된 암호화된 user_pk_num을 복호화하여 매개변수로 전달(즐겨찾기 관련 코드)
            HttpSession session = req.getSession();
            String sessionID = null;
			try { sessionID = (String)AES.Decode((String)session.getAttribute("sessionID"));} 
			catch (Exception e) {System.out.println("FreeListCmd"+e);}
            
            req.getSession().setAttribute("list", list.getPost(sessionID));
    		
        return "/WEB-INF/views/dashboard/free/freeList.jsp";
    }
}
