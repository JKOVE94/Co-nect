package model.dashboard.factory;

import model.Icommand;
import model.dashboard.command.DashHomeCmd;
import model.dashboard.command.FreeCreateCmd;
import model.dashboard.command.FreeCreateWriteCmd;
import model.dashboard.command.FreeDeleteCmd;
import model.dashboard.command.FreeListCmd;
import model.dashboard.command.FreeReadCmd;
import model.dashboard.command.FreeUpdateCmd;
import model.dashboard.command.FreeUpdatedCmd;
import model.dashboard.command.ProjCreateCmd;
import model.dashboard.command.ProjCreateWriteCmd;
import model.dashboard.command.ProjDeleteCmd;
import model.dashboard.command.ProjListCmd;
import model.dashboard.command.ProjReadCmd;
import model.dashboard.command.ProjUpdateCmd;
import model.dashboard.command.ProjUpdatedCmd;

public class FactoryDash {
    private FactoryDash(){}
    private static FactoryDash factDash = new FactoryDash();
    public static FactoryDash newInstance() {
        return factDash;
    }

    public Icommand createInstance(String fn) {
        //대시보드 기본 페이지로 이동
        if (fn.equals("HOME")){
            return new DashHomeCmd();
        }
        //자유게시판 리스트 페이지 이동
        else if (fn.equals("FREE_LIST")) {
            return new FreeListCmd();
        }
        //자유게시판 작성 페이지 이동
        else if (fn.equals("FREE_POST")) {
            return new FreeCreateCmd();
        }
        //자유게시판 작성 내용 DB연동
        else if (fn.equals("FREE_CREATE")) {
            return new FreeCreateWriteCmd() ;
        }
        //자유게시판 조회
        else if (fn.equals("FREE_READ")) {
            return new FreeReadCmd();
        }
        //자유게시판 수정 페이지 이동
        else if (fn.equals("FREE_UPDATE")) {
            return new FreeUpdateCmd();
        }
        //자유게시판 수정 내용 DB연동
        else if (fn.equals("FREE_UPDATED")) {
            return new FreeUpdatedCmd();
        }
        //자유게시판 삭제
        else if (fn.equals("FREE_DELETE")) {
            return new FreeDeleteCmd();
        }

        //프로젝트 리스트 페이지 이동
        else if (fn.equals("PROJ_LIST")) {
            return new ProjListCmd();
        }
        //프로젝트 작성 페이지 이동
        else if (fn.equals("PROJ_POST")) {
            return new ProjCreateWriteCmd();
        }
        //프로젝트 작성 내용 DB연동
        else if (fn.equals("PROJ_CREATE")) {
            return new ProjCreateCmd();
        }
        //프로젝트 조회
        else if (fn.equals("PROJ_READ")) {
            return new ProjReadCmd();
        }
        //프로젝트 수정 페이지 이동
        else if (fn.equals("PROJ_UPDATE")) {
            return new ProjUpdateCmd();

        }
        //프로젝트 수정 내용 DB연동
        else if (fn.equals("PROJ_UPDATED")) {
            return new ProjUpdatedCmd();

        }
        //프로젝트 삭제
        else if (fn.equals("PROJ_DELETE")) {
            return new ProjDeleteCmd();
        }

        // 프로토타입
       /* else if (fn.equals("")) {
            return new ;
        }*/
        return null;
    }
}
