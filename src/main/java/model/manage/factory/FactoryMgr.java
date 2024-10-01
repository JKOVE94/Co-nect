package model.manage.factory;

import model.Icommand;
import model.manage.command.*;

public class FactoryMgr {
    private FactoryMgr(){}
    private static FactoryMgr factMgr = new FactoryMgr();
    public static FactoryMgr newInstance() {
        return factMgr;
    }
    public Icommand createInstance(String fn) {

        //일반유저

        //관리자
        if (fn.equals("ADMIN_MANAGE")) {
            return new AdminMain();
        }
        else if (fn.equals("ADMIN_USERSET")) {
            return new AdminUserSetCmd();
        }
        else if (fn.equals("ADMIN_USERSET_PROC")) {
            return new AdminUserSetProcCmd();
        }
        else if (fn.equals("ADMIN_USERLIST_PROC")) { //유저리스트
            return new AdminUserListProcCmd();
        }
        else if (fn.equals("ADMIN_USERINFO_PROC")) { //유저정보
            return new AdminUserInfoProcCmd();
        }
        else if (fn.equals("ADMIN_USERUPDATE_PROC")) { //유저정보수정
            return new AdminUserUpdateProcCmd();
        }
        else if (fn.equals("ADMIN_USERDEL_PROC")) { //유저정보삭제
            return new AdminUserDelProcCmd();
        }
        else if (fn.equals("ADMIN_LOCKUSER")) { //잠긴유저정보
            return new AdminLockUserCmd();
        }
        else if (fn.equals("ADMIN_LOCKUSER_PROC")) { //잠김해제
            return new AdminLockUserProcCmd();
        }
        return null;
    }
}
