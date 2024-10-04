package model.dashboard.command;

import model.Icommand;
import model.dashboard.Free_List;
import model.favorites.Favorites_Check;

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
            
            //즐겨찾기 등록 여부 확인을 위해 sessionID를 전달 
            HttpSession session = req.getSession();
            String sessionID = (String)session.getAttribute("sessionID");
            
            req.getSession().setAttribute("list", list.getPost(sessionID));
    		
        return "/WEB-INF/views/dashboard/free/freeList.jsp";
    }
}
