package db.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class JobDTO {
	private int job_pk_num; //직무 번호 [PK, INT]
	private String job_name; //직무 명 [VARCHAR]
}
