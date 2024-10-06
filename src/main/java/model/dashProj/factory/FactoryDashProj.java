package model.dashProj.factory;

import model.Icommand;
import model.dashProj.command.DashProjCreateCmd;
import model.dashProj.command.DashProjReadCmd;

public class FactoryDashProj {
    private FactoryDashProj() {}
    private static FactoryDashProj factory = new FactoryDashProj();
    
    public static FactoryDashProj newInstance() {
        return factory;
    }
    
    public Icommand createInstance(String fn) {
        if (fn.equals("Proj")) { 
            return new DashProjCreateCmd();
        } else if (fn.equals("taskRead")) {
            return new DashProjReadCmd();
        } else {
            throw new IllegalArgumentException("Unknown command: " + fn);
        }
    }
}