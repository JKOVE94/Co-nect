package model.dashboard.command;

import model.Icommand;
import model.dashboard.Free_Update;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dto.PostDTO;

import java.io.IOException;

public class FreeUpdatedCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String postNo = req.getParameter("post_pk_num");
	    String postName = req.getParameter("post_name");
	    String postContent = req.getParameter("post_content");
	    String postImport = req.getParameter("post_import");

	    Free_Update update = new Free_Update();
	   
	    PostDTO updatedto = update.saveUpdatePost(postNo, postName, postContent, postImport);

	    req.getSession().setAttribute("dto", updatedto);
    	
    	return "/WEB-INF/views/dashboard/free/freeRead.jsp?post_pk_num=" + postNo;
    }
}
