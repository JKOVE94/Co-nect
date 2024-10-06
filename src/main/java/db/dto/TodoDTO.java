package db.dto;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class TodoDTO {
	private int todo_pk_num; //일정 고유 넘버
	private int todo_fk_user_num; //일정을 작성한 유저의 넘버
	private String todo_title; //일정 제목 
	private String todo_content; //일정 내용
	private Date todo_start; //일정 시작 날짜
	private Date todo_end; //일정 끝 날짜
		
}
