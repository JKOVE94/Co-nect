package db.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Data
public class TodoDTO {
    private int todo_pk_num; //투두리스트 고유 식별자 [PK, INT, INCREMENT]
    private String todo_title; // 투두리스트 제목 [VARCHAR]
    private String todo_content; //투두리스트 내용 [VARCHAR]
    private Date todo_start; //투두리스트 시작일 [DATETIME]
    private Date todo_end; //투두리스트 종료일 [DATETIME]
    private int todo_fk_user_num; //투두리스트 작성자 [INT}
    private int todo_icon;//투두 아이콘 넘버[INT] 
    /*
		1. bi-list-task: 할 일 목록 표시
		2. bi-clipboard: 클립보드 또는 임시 저장 표시
		3. bi-calendar: 날짜 및 일정 표시
		4. bi-check-circle: 완료된 작업 표시
		5. bi-alarm: 알림 또는 시간 경고 표시
		6. bi-file-earmark-text: 문서 또는 텍스트 파일 표시
		7. bi-clock: 시간 관련 기능 표시
      */
    private String todo_tagcol; //투두 태그 컬러 [VARCHAR] 
}
