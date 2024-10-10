package db.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class JobDTO {
	private int job_pk_num; //직무 번호 [PK, INT]
	private String job_name; //직무 명 [VARCHAR]
}
