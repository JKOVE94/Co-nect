package model;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface Icommand {
    public Object method(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
