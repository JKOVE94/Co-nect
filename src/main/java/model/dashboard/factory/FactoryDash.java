package model.dashboard.factory;

import model.Icommand;
import model.dashboard.command.FreeListCmd;

public class FactoryDash {
    private FactoryDash(){}
    private static FactoryDash factDash = new FactoryDash();
    public static FactoryDash newInstance() {
        return factDash;
    }

    public Icommand createInstance(String fn) {
        if (fn.equals("FREE_LIST")) {
            return new FreeListCmd();
        }
       /* else if (fn.equals("")) {
            return new ;
        }*/
        return null;
    }
}
