package db.dto;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class FavoritesDTO {
	private int number; //글번호
	private String name; //제목
	private String type; //proj인지, post인지 구분
	private int user; //작성자
	private Date regdate; //날짜
	private String status; //우선순위
	
}
