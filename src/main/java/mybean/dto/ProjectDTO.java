package mybean.dto;

import java.util.Date;

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
	private int proj_fk_post_num;
	
	
	public int getProj_fk_post_num() {
		return proj_fk_post_num;
	}
	public void setProj_fk_post_num(int proj_fk_post_num) {
		this.proj_fk_post_num = proj_fk_post_num;
	}
	public int getProj_pk_num() {
		return proj_pk_num;
	}
	public void setProj_pk_num(int proj_pk_num) {
		this.proj_pk_num = proj_pk_num;
	}
	public String getProj_name() {
		return proj_name;
	}
	public void setProj_name(String proj_name) {
		this.proj_name = proj_name;
	}
	public String getProj_desc() {
		return proj_desc;
	}
	public void setProj_desc(String proj_desc) {
		this.proj_desc = proj_desc;
	}
	public Date getProj_startdate() {
		return proj_startdate;
	}
	public void setProj_startdate(Date proj_startdate) {
		this.proj_startdate = proj_startdate;
	}
	public Date getProj_enddate() {
		return proj_enddate;
	}
	public void setProj_enddate(Date proj_enddate) {
		this.proj_enddate = proj_enddate;
	}
	public String getProj_status() {
		return proj_status;
	}
	public void setProj_status(String proj_status) {
		this.proj_status = proj_status;
	}
	public int getProj_fk_user_num() {
		return proj_fk_user_num;
	}
	public void setProj_fk_user_num(int proj_fk_user_num) {
		this.proj_fk_user_num = proj_fk_user_num;
	}
	public String getProj_members() {
		return proj_members;
	}
	public void setProj_members(String proj_members) {
		this.proj_members = proj_members;
	}
	public Date getProj_created() {
		return proj_created;
	}
	public void setProj_created(Date proj_created) {
		this.proj_created = proj_created;
	}
	public Date getProj_updated() {
		return proj_updated;
	}
	public void setProj_updated(Date proj_updated) {
		this.proj_updated = proj_updated;
	}
	public String getProj_import() {
		return proj_import;
	}
	public void setProj_import(String proj_import) {
		this.proj_import = proj_import;
	}
	public int getProj_fk_dpart_num() {
		return proj_fk_dpart_num;
	}
	public void setProj_fk_dpart_num(int proj_fk_dpart_num) {
		this.proj_fk_dpart_num = proj_fk_dpart_num;
	}
	public String getProj_tag() {
		return proj_tag;
	}
	public void setProj_tag(String proj_tag) {
		this.proj_tag = proj_tag;
	}
	public String getProj_tagcol() {
		return proj_tagcol;
	}
	public void setProj_tagcol(String proj_tagcol) {
		this.proj_tagcol = proj_tagcol;
	}
	public int getProj_fk_comp_num() {
		return proj_fk_comp_num;
	}
	public void setProj_fk_comp_num(int proj_fk_comp_num) {
		this.proj_fk_comp_num = proj_fk_comp_num;
	}
}
