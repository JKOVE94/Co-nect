package model.dashboard.command;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Icommand;
import model.dashboard.Free_Create;

import javax.servlet.ServletException;

public class FreeCreateCmd implements Icommand{

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		PostDTO dto = new PostDTO();
		
		dto.setPost_kind(Integer.parseInt(req.getParameter("post_kind")));
		dto.setPost_targetnum(req.getParameter("post_targetnum"));
		dto.setPost_name(req.getParameter("post_name"));
		dto.setPost_import(req.getParameter("post_import"));
		dto.setPost_content(req.getParameter("post_content"));
		dto.setPost_tag(req.getParameter("post_tag"));
		dto.setPost_fk_dpart_num(Integer.parseInt(req.getParameter("post_fk_dpart_num")));
		dto.setPost_fk_user_num(Integer.parseInt(req.getParameter("post_fk_user_num")));
		dto.setPost_fk_comp_num(Integer.parseInt(req.getParameter("post_fk_comp_num")));
		
		Free_Create free = new Free_Create();
		free.setPost(dto);
	
        return "/WEB-INF/views/dashboard/free/freeList.jsp"; 
    }
}
