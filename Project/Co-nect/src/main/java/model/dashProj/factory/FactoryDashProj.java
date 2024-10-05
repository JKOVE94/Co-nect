package model.dashProj.factory;

import model.Icommand;
import model.dashProj.command.DashProjCreateCmd;

public class FactoryDashProj {
	private FactoryDashProj() {}
	private static FactoryDashProj factory = new FactoryDashProj();
	public static FactoryDashProj newInstance() {
		return factory;
	}
    public Icommand createInstance(String fn) {
    	
        if(fn.equals("Proj")){ 
        	return new DashProjCreateCmd();}
               
            // 다른 커맨드들을 여기에 추가할 수 있습니다.
            return null;
        }
    }
