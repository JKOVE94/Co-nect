package model.dashboard.command;

import model.Icommand;
import model.dashboard.Proj_Delete;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProjDeleteCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String projPkNum = req.getParameter("proj_pk_num");

        if (projPkNum != null && !projPkNum.isEmpty()) {
            Proj_Delete ProjDelete = new Proj_Delete();
            ProjDelete.projDelete(projPkNum ); //
        }

        // 삭제 후 목록 페이지로 리다이렉트
        return "/WEB-INF/views/dashboard/project/projList.jsp"; // 리다이렉트 할 때는 null을 반환
    }
}