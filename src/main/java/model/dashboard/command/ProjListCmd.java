package model.dashboard.command;

import model.Icommand;
import model.common.getAllUser;
import model.dashboard.Proj_List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class ProjListCmd implements Icommand {

    @Override
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	Proj_List list = new Proj_List();
    	req.getSession().setAttribute("list", list.getPost());

        //유저 정보 맵 전송
        HashMap<String,String> getUserMap = null;
        getAllUser user = new getAllUser();
        getUserMap = user.getAllUserName();
        req.getSession().setAttribute("getUserMap", getUserMap);
        
    	return "/WEB-INF/views/dashboard/project/projList.jsp";
    }
}
