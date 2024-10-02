package db.dto;

import java.util.Date;

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
	private boolean favoriteCheck; //즐겨찾기에 등록되어있는지 확인하기 위한 변수

	public int getPost_view() {
		return post_view;
	}
	public void setPost_view(int post_view) {
		this.post_view = post_view;
	}
	public int getPost_pk_num() {
		return post_pk_num;
	}
	public void setPost_pk_num(int post_pk_num) {
		this.post_pk_num = post_pk_num;
	}
	public int getPost_kind() {
		return post_kind;
	}
	public void setPost_kind(int post_kind) {
		this.post_kind = post_kind;
	}
	public String getPost_targetnum() {
		return post_targetnum;
	}
	public void setPost_targetnum(String post_targetnum) {
		this.post_targetnum = post_targetnum;
	}
	public String getPost_name() {
		return post_name;
	}
	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}
	public Date getPost_regdate() {
		return post_regdate;
	}
	public void setPost_regdate(Date post_regdate) {
		this.post_regdate = post_regdate;
	}
	public String getPost_import() {
		return post_import;
	}
	public void setPost_import(String post_import) {
		this.post_import = post_import;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_tag() {
		return post_tag;
	}
	public void setPost_tag(String post_tag) {
		this.post_tag = post_tag;
	}
	public int getPost_fk_dpart_num() {
		return post_fk_dpart_num;
	}
	public void setPost_fk_dpart_num(int post_fk_dpart_num) {
		this.post_fk_dpart_num = post_fk_dpart_num;
	}
	public int getPost_fk_comp_num() {
		return post_fk_comp_num;
	}
	public void setPost_fk_comp_num(int post_fk_comp_num) {
		this.post_fk_comp_num = post_fk_comp_num;
	}
	public int getPost_fk_user_num() {
		return post_fk_user_num;
	}
	public void setPost_fk_user_num(int post_fk_user_num) {
		this.post_fk_user_num = post_fk_user_num;
	}

    public int getPost_depth() {
        return post_depth;
    }

    public void setPost_depth(int post_depth) {
        this.post_depth = post_depth;
    }
	public boolean isFavoriteCheck() {
		return favoriteCheck;
	}
	public void setFavoriteCheck(boolean favoriteCheck) {
		this.favoriteCheck = favoriteCheck;
	}
}
