package model.dashboard.command;

import model.Icommand;
import model.dashboard.Free_Delete;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FreeDeleteCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postPkNum = req.getParameter("post_pk_num");
        
        if (postPkNum != null && !postPkNum.isEmpty()) {
            Free_Delete freeDelete = new Free_Delete();
            freeDelete.deletePost(postPkNum); // 게시글 삭제
        }

        // 삭제 후 목록 페이지로 리다이렉트
        return "/dashboard?fn=FREE_LIST"; // 리다이렉트 할 때는 null을 반환
    }
}