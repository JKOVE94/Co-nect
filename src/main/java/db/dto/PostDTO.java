package db.dto;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostDTO {
	private int post_pk_num;
	private int post_kind;
	private String post_targetnum;
	private String post_name;
	private Date post_regdate;
	private String post_import;
	private String post_content;
	private String post_tag;
	private int post_fk_dpart_num;
	private int post_fk_comp_num;
	private int post_fk_user_num;
	private int post_depth;
	private int post_view;
	private boolean favoriteCheck; 
	//즐겨찾기에 등록되어있는지 확인하기 위한 변수 추가
}
