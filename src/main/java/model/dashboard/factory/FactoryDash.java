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
        if (fn.equals("HOME")){
            return new DashHomeCmd();
        }
        else if (fn.equals("FREE_LIST")) {
            return new FreeListCmd();
        }
        else if (fn.equals("FREE_READ")) {
            return new FreeReadCmd();
        }

        else if (fn.equals("FREE_UPDATE")) {
            return new FreeUpdateCmd();
        }

        else if (fn.equals("FREE_UPDATED")) {
            return new FreeUpdatedCmd();
        }
        else if (fn.equals("FREE_CREATE")) {
            return new FreeCreateWriteCmd() ;
        }
        else if (fn.equals("FREE_POST")) {
            return new FreeCreateCmd();
        }
        else if (fn.equals("FREE_DELETE")) {
            return new FreeDeleteCmd();
        }
        else if (fn.equals("PROJ_LIST")) {
            return new ProjListCmd();
        }
        else if (fn.equals("PROJ_POST")) {
            return new ProjCreateWriteCmd();
        }
        else if (fn.equals("PROJ_READ")) {
            return new ProjReadCmd();
        }
        else if (fn.equals("PROJ_CREATE")) {
            return new ProjCreateCmd();

        }
        else if (fn.equals("PROJ_UPDATE")) {
            return new ProjUpdateCmd();

        }
        else if (fn.equals("PROJ_UPDATED")) {
            return new ProjUpdatedCmd();

        }
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
