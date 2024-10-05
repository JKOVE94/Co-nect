package db.dto;

import java.util.Date;

public class TodoDTO {
	private int todo_pk_num; //일정 고유 넘버
	private int todo_fk_user_num; //일정을 작성한 유저의 넘버
	private String todo_title; //일정 제목 
	private String todo_content; //일정 내용
	private Date todo_start; //일정 시작 날짜
	private Date todo_end; //일정 끝 날짜
	
	public int getTodo_pk_num() {
		return todo_pk_num;
	}
	public void setTodo_pk_num(int todo_pk_num) {
		this.todo_pk_num = todo_pk_num;
	}
	public int getTodo_fk_user_num() {
		return todo_fk_user_num;
	}
	public void setTodo_fk_user_num(int todo_fk_user_num) {
		this.todo_fk_user_num = todo_fk_user_num;
	}
	public String getTodo_title() {
		return todo_title;
	}
	public void setTodo_title(String todo_title) {
		this.todo_title = todo_title;
	}
	public String getTodo_content() {
		return todo_content;
	}
	public void setTodo_content(String todo_content) {
		this.todo_content = todo_content;
	}
	public Date getTodo_start() {
		return todo_start;
	}
	public void setTodo_start(Date todo_start) {
		this.todo_start = todo_start;
	}
	public Date getTodo_end() {
		return todo_end;
	}
	public void setTodo_end(Date todo_end) {
		this.todo_end = todo_end;
	}
	
	
}
