package model.dashboard.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dto.PostDTO;
import model.Icommand;
import model.dashboard.Free_Read;
import model.dashboard.Free_ReadCheck;

public class FreeReadCmd implements Icommand {

	@Override
	public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Free_Read read = new Free_Read();
		String post_num = req.getParameter("post_num");
		req.setAttribute("post_num", post_num);
		Free_ReadCheck check = new Free_ReadCheck();
		PostDTO dto = null;

		dto = check.postDtoReturn(post_num);

		req.getSession().setAttribute("dto", dto);

		return "/WEB-INF/views/dashboard/free/freeRead.jsp";
	}

}
