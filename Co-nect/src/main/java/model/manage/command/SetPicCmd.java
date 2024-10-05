package model.manage.command;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import db.dto.UserDTO;
import model.Icommand;
import model.manage.Admin_userSet;
import model.manage.UserImage;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SetPicCmd implements Icommand {
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserImage image = new UserImage();
        Admin_userSet userset = new Admin_userSet();

        ServletContext context = req.getServletContext();
        String virtualPath = "/asset/emp_pic";
        String realPath = context.getRealPath(virtualPath);

        String encType = "UTF-8";
        int maxSize = 1024 * 1024 * 5; //5mb 파일크기제한
        MultipartRequest multi = null;
        try {
            multi = new MultipartRequest(req, realPath, maxSize,
                    encType, new DefaultFileRenamePolicy()); //중복시에 넘버링을 통해 중복방지
        }catch(Exception e) {};

        UserDTO dto = image.saveUserImage(realPath, multi);

        userset.setUser(dto);
        return "/WEB-INF/views/dashboard/dashboard.jsp";
    }
}
