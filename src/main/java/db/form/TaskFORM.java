package db.form;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class TaskFORM {
	private int task_pk_num; //작업 고유 식별자 [PK, INT, INCREMENT]
	private String task_title; //작업 제목 [VARCHAR]
	private String task_desc; //작업 설명 {TEXT]
	private Date task_startdate; //작업 시작일 {DATETIME]
	private Date task_deadline; //마감 기한일 [DATETIME]
	private Date task_enddate; //작업 종료일 [DATETIME]
	private int task_duration; //작업 기간 (일 단위) [INT]
	private int task_progress; //진행률 (%) [INT]
	private String task_status; //작업 상태 [VARCHAR] (예정, 진행중, 완료)
	private int task_priority; //우선순위 [INT]
	private Date task_created; //작업 생성 일시 [DATETIME]
	private Date task_updated; //작업 정보 최종 수정 일시 [DATETIME]
	private double task_version; //작업 버전 번호 [FLOAT]
	private int task_fk_user_num; //담당자 사번 [FK, INT]
	private int task_fk_proj_num; //연관된 프로젝트 번호 [FK, INT]
	private int task_fk_task_num; //상위 작업 번호 [FK, INT]
}
