package model.manage.factory;

import model.Icommand;
import model.manage.command.AdminUserSetCmd;
import model.manage.command.AdminUserSetProcCmd;

public class FactoryMgr {
    private FactoryMgr(){}
    private static FactoryMgr factMgr = new FactoryMgr();
    public static FactoryMgr newInstance() {
        return factMgr;
    }
    public Icommand createInstance(String fn) {
        if (fn.equals("ADMIN_USERSET")) {
            return new AdminUserSetCmd();
        }
        else if (fn.equals("ADMIN_USERSET_PROC")) {
            return new AdminUserSetProcCmd();
        }
        return null;
    }
}
