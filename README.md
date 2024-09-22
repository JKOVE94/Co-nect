# Acorn_Team2_WBS_Service

안녕하세요 팀장 김대현 입니다.<br>
원활한 코딩을 위해 공용으로 사용하는 method와 변수 이름 리스트 공유합니다. 참고 부탁드립니다 😊

<h1>⭐️ method ⭐️</h1>
====== 사전 입력 정보 ======

회사정보 (company)
1. comp_pk_num : (PK) 회사 고유번호
2. comp_name : 회사 명
3. comp_pic : 회사 로고사진 경로 (상대경로 사용 0_asset/emp_pic)

계정 정보 (account)
1. acc_pk_authornum: (PK) 계정 권한 고유번호 int (1, 2, 3, 4)
2. acc_author: 계정 권한 varchar (admin, manager, user, locked)

부서 (dpartment)
1. dpart_pk_num (PK): 부서 번호
2. dpart_name: 부서 이름
3. dpart_mail: 부서 이메일
4. dpart_fk_dpart_num: 상위 부서 번호 (FK => pk_dpart_num)
5. dpart_fk_comp_num : 부서의 회사 번호 (FK => comp_pk_num)

직무 (job)
1. job_pk_num (PK): 직무 번호
2. job_name: 직무 명

====== 유저 입력 정보 ======

사용자 (user)
1. user_pk_num (PK): 사용자 사번
2. user_regdate: 입사일
3. user_pw: 사용자 패스워드 (NN)
4. user_name: 사용자 이름
5. user_mail: 사용자 이메일
6. user_pic: 사용자 사진 경로 (상대경로 사용 0_asset/emp_pic)
7. user_rank: 사용자 직급
8. user_lastlogin: 사용자 마지막 로그인 일시 (DATETIME)
9. user_trynum : 사용자 로그인 시도 횟수 (로그인 실패 시 증가, 5회 초과시 acc_pk_authornum 4로 변경 (잠금), 로그인 성공시 0으로 설정) 
10. user_fk_job_num: 사용자 직무 번호 (FK => job_pk_num)
11. user_fk_dpart_num: 사용자 부서번호 (FK => dpart_pk_num)
12. user_fk_acc_authornum: 사용자 계정 권한 번호 (FK => acc_pk_authornum)
13. user_fk_comp_num : 사용자 회사 고유번호 (랜딩 페이지에서 입력한 회사 번호가 모든 페이지에서 따라다닐수 있게 input type=hidden으로 설정, 관리자가 설정시에 해당 데이터는 자동 전송)

프로젝트 (project)
1. proj_pk_num (PK): 프로젝트 번호
2. proj_name: 프로젝트 이름
3. proj_desc: 프로젝트 설명
4. proj_startdate: 프로젝트 시작일
5. proj_enddate: 프로젝트 종료일
6. proj_status: 프로젝트 상태 (계획, 진행 중, 완료)
7. proj_members : 프로젝트 참여자 사번 (String으로 저장 후 string tokenizer로 데이터 사용)
8. proj_created: 프로젝트 생성 일시
9. proj_updated: 프로젝트 정보 최종 수정 일시
10. proj_import: 프로젝트 중요도 (low, mid, high, ergen)
11. proj_tag : 프로젝트 태그
12. proj_tagcol : 프로젝트 태그 컬러
13. proj_fk_user_num: 프로젝트 담당자 사번 (FK => user_num)
14. proj_fk_dpart_num: 프로젝트 부서 번호 (FK => dpart_num)
15. proj_fk_comp_num : 프로젝트 회사 고유번호 (FK => comp_pk_num)
16. post_fk_post_num : 게시글 번호 (FK => post_pk_num)

게시글 (post)
1. post_pk_num (PK): 게시글 번호 (auto increase)
2. post_kind : 게시글 유형 enum(1 공지 ,2 프로젝트 ,3 일반)
3. post_targetnum : 게시글 대상 부서번호 (VARCHAR) => String으로 작성 이후 데이터사용은 String tokenizer 사용
4. post_name : 게시글 제목
5. post_regdate: 게시글 등록일
6. post_import: 게시글 중요도
7. post_content: 게시글 내용
8. post_tag: 게시글 태그
9. post_fk_dpart_num: 게시글 작성 부서 번호 (FK => dpart_pk_num)
10. post_fk_user_num: 게시글 작성자 사번 (FK => user_pk_num)
11. post_fk_comp_num : 게시글 회사 고유번호 (FK => comp_pk_num)

댓글 (reply)
1. reply_pk_num (PK) : 댓글 번호
2. reply_cont : 댓글 내용
3. reply_fk_post_num : 게시글 번호 (FK => post_pk_num)
4. reply_fk_user_num : 댓글 작성자 사번 (FK => user_num)

작업 (task)
1. task_pk_num (PK): 작업 고유 식별자
2. task_title: 작업 제목
3. task_desc: 작업 설명
4. task_startdate : 작업 시작일
5. task_deadlien : 마감 기한일
6. task_enddate: 작업 종료일	
7. taks_duration: 작업 기간 (일 단위)
8. task_progress: 진행률 (%)
9. task_status: 작업 상태 (미시작, 진행중, 완료)
10. task_priority: 우선순위
11. task_created: 작업 생성 일시
12. task_updated: 작업 정보 최종 수정 일시
13. task_version: 작업 버전 번호
14. task_fk_user_num: 담당자 사번 (FK => user_num)
15. task_fk_proj_num: 연관된 프로젝트 번호 (FK => proj_pk_num)
16. task_fk_task_num: 상위 작업 번호 (FK => task_pk_num)

------------추후구현------------- 
개인화 (personalized)
pserson_fk_user_num : 유저 정보
person_favorit : 즐겨찾기


<h1>MVC패턴 관련 적용사항</h1>
1. controller에 정보를 줄 parameter명은 fn으로 통일 (예제 : http://localhost:8080/acorn_wbs/dashboard?fn=파라미터값)
parameter value는 팀별 기량으로 설정해주세요 (직관적인 명칭으로)
2. 컨트롤러 구조는 3단계로 나누기
1) landing->dashboard  @webServlet("/landing")
2) dashboard내에 다양한 기능들 (프로젝트, 자유게시판, 사용자 설정&관리자 설정) @webServlet("/dashboard") 
3) 사용자설정&관리자설정 내의 기능들 @webServlet("/manage")
3. 모든 view는 WEB-INF/views 폴더안에 위치 (index.html 제외)
이 때에 views안에 세부 폴더로 분리 => landing, dashboard, manage
dashboard의 경우에는 그 안에 세부폴더로 가능 분리 (예제 : WEB-INF/views/dashboard/project)
4. package명 설정
controller (내부 클래스 : LandingServlet, DashboardServlet, ManageServlet)
model.landing / model.dashboard / model.manage (내부 클래스 : 각 내부 클래스별 기능)
지금까지 작업했던 dao가 해당 모델 패키지로 이동한다고 생각하시면 됩니다.
단 기능을 직관적으로 구분하기 위해 해당 명칭의 규칙을 적용하겠습니다.
Class 파일명 규칙1 : 관례에 따라 첫 글자는 대문자로 통일
Class 파일명 규칙2 : 구분을 쉽게 하기 위해 언더바 적극 기용 => (예제 : model.dashbaord.Free_create -> model.dashboard 패키지 Free_create 자유게시판 생성)
db.dto / db.dbcp
dto의 class명은 변경하지 않겠습니다.
MVC패턴이 적용되면서 변경되는부분이 상당히 많습니다. 처음에 적용하는데 상당히 번거롭겠지만 평가 기준이 MVC패턴이고 추후 Spring이 MVC패턴의 구조를 띄고 있기 때문에 필히 적용해야하는 사항입니다. 기본적인 사항들은 제가 main branch, master branch를 통해 적용 / 수정해두겠습니다.
※ 이번에 package명, class명을 변경하다보니 예외가 발생할 확률이 매우 높습니다. package명, class명 변경시 기존에 적용해주셨던 문서에서도 해당 package명, class명 수정 필히 부탁드립니다. (꼭 eclipse의 Refactor - rename 기능을 사용해주시기 바랍니다)