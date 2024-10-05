package model.landing.factory;

import model.Icommand;
import model.landing.command.LoginCmd;

public class FactoryLand {
    private FactoryLand(){}
    private static FactoryLand factLand = new FactoryLand();
    public static FactoryLand newInstance() {
        return factLand;
    }

    public Icommand createInstance(String fn) {
        if (fn.equals("MAIN")) {
            return new LoginCmd();
        }
       /* else if (fn.equals("")) {
            return new ;
        }*/
        return null;
    }
}
