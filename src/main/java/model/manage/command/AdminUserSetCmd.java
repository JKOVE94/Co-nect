package model.manage.command;

import model.Icommand;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminUserSetCmd implements Icommand {
@Override
public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
    return "/WEB-INF/views/manage/userSetting/admin_setUser.jsp";
    }
}
