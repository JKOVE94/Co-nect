package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Icommand;
import model.dashProj.factory.FactoryDashProj;
import db.dto.TaskDTO;
import model.dashProj.command.DashProjReadCmd;

@WebServlet("/dashProj")
public class DashProjServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = "";
        
        Icommand icmd = null;
        FactoryDashProj factory = FactoryDashProj.newInstance();
        
        // fn 파라미터가 없으면 기본적으로 작업 목록 읽기 실행
        String fn = req.getParameter("fn");
        if (fn == null || fn.isEmpty()) {
            fn = "taskRead";
        }
        
        icmd = factory.createInstance(fn);
        
        if (icmd == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Unknown command");
            return;
        }

        url = (String) icmd.method(req, resp);
        
        if (url == null) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Command returned null");
            return;
        }

        RequestDispatcher view = req.getRequestDispatcher(url);
        view.forward(req, resp);
    }
}