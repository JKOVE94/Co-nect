<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>

<!--<jsp:useBean id="dto" class="mybean.dto.UserDTO" />-->
<jsp:useBean id="dao" class="mybean.dao.Admin_setUserProcDAO" />

<%request.setCharacterEncoding("UTF-8");%>

<%
    //String folderLoc = "파일경로";
	String folderLoc = application.getRealPath("/0_asset/emp_pic");
    String encType = "UTF-8";
    int maxSize = 1024 * 1024 * 5; //5mb 파일크기제한
    try {
        MultipartRequest multi = null;
        multi = new MultipartRequest(request, folderLoc, maxSize,
                encType, new DefaultFileRenamePolicy()); //중복시에 넘버링을 통해 중복방지
        
        //user_pk_num 파라미터 값 가져오기
        String userPkNum = multi.getParameter("user_pk_num");
        String newFileName = userPkNum+".jpg";
        
        //파라미터 값 가져오기
        String userName = multi.getParameter("user_name");
        String userPw = multi.getParameter("user_pw");
        String userMail = multi.getParameter("user_mail");
        String userRegDate = multi.getParameter("user_regdate");
        String userRank = multi.getParameter("user_rank");
        int userFkJobNum = Integer.parseInt(multi.getParameter("user_fk_job_num"));
        int userFkDpartNum = Integer.parseInt(multi.getParameter("user_fk_dpart_num"));
        int userFkAccAuthornum = Integer.parseInt(multi.getParameter("user_fk_acc_authornum"));
        int userFkCompNum = Integer.parseInt(multi.getParameter("user_fk_comp_num"));
        //DTO에 값 저장
        dto.setUser_name(userName);
        dto.setUser_pk_num(Integer.parseInt(userPkNum));
        dto.setUser_pw(userPw);
        dto.setUser_mail(userMail);
        dto.setUser_regdate(userRegDate);
        dto.setUser_rank(userRank);
        dto.setUser_fk_job_num(userFkJobNum);
        dto.setUser_fk_dpart_num(userFkDpartNum);
        dto.setUser_fk_acc_authornum(userFkAccAuthornum);
        dto.setUser_fk_comp_num(userFkCompNum);
        
        //파일을 새 이름으로 변경
        File oldFile = multi.getFile("user_pic");
        if(oldFile !=null){
        	File newFile = new File(folderLoc, newFileName);
       	 	oldFile.renameTo(newFile); // 파일 이름 변경
       	 // 최종 파일명을 DTO에 저장
            dto.setUser_pic(newFileName); // DTO에 최종 파일명 저장
          
        }
    } catch (IOException ioe) {
        System.out.println(ioe);
    } catch (Exception ex) {
        System.out.println(ex);
    }
%>
<hr/>
<br/>
<%
//DBCP 사용
dao.setUser(dto);
%>
