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
}
