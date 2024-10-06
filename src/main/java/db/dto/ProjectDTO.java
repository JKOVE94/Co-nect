package db.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ProjectDTO {
	private int proj_pk_num;
	private String proj_name;
	private String proj_desc;
	private Date proj_startdate;
	private Date proj_enddate;
	private String proj_status;
	private String proj_members;
	private Date proj_created;
	private Date proj_updated;
	private String proj_import;
	private String proj_tag;
	private String proj_tagcol;
	private int proj_fk_dpart_num;
	private int proj_fk_user_num;
	private int proj_fk_comp_num;
	private boolean favoriteCheck;
	//즐겨찾기에 등록되어있는지 확인하기 위한 변수 추가
	
}
