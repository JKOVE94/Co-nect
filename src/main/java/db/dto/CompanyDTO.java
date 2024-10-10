package db.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class CompanyDTO {
	private int comp_pk_num; //회사 고유번호 [PK, INT]
	private String comp_name; //회사 명 [VARCHAR]
	private String comp_pic; //회사 로고사진 경로 [VARCHAR] ( 0_asset/emp_pic)
}
