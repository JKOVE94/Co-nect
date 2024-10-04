package db.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DepartmentDTO {
	private int dpart_pk_num; //부서 번호 [PK, INT]
	private String dpart_name; //부서 이름 [VARCHAR]
	private String dpart_mail; //부서 이메일 [VARCHAR]
	private int dpart_fk_dpart_num; //상위 부서 번호 [FK, INT]
}
