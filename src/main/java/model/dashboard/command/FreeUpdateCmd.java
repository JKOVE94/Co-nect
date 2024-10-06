package model.dashboard.command;

import db.dto.PostDTO;
import model.Icommand;
import model.dashboard.Free_Update;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FreeUpdateCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String postNo = req.getParameter("post_pk_num");
		Free_Update update = new Free_Update();
		
		PostDTO dto = update.updatePost(postNo);
		req.getSession().setAttribute("dto", dto);
		
        return "/WEB-INF/views/dashboard/free/freePostUpdate.jsp";
    }
}
