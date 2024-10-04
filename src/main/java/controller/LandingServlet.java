package controller;

import model.Icommand;
import model.landing.factory.FactoryLand;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/landing")
public class LandingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = "";
        String fn = req.getParameter("fn");

        Icommand icmd = null;
        FactoryLand factory = FactoryLand.newInstance();
        icmd = factory.createInstance(fn);
        url = (String) icmd.method(req,resp);

        RequestDispatcher view = req.getRequestDispatcher(url);
        view.forward(req, resp);
    }
}
