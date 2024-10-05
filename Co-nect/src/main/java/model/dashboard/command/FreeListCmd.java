package model.dashboard.command;

import model.Icommand;
import model.dashboard.Free_List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FreeListCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            Free_List list = new Free_List();
            req.getSession().setAttribute("list", list.getPost());

        return "/WEB-INF/views/dashboard/free/freeList.jsp";
    }
}
