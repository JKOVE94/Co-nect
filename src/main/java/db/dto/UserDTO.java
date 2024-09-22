package db.dto;

import java.util.Date;

public class UserDTO {

	private int user_pk_num;
	private String user_regdate;
	private String user_name;
	private String user_mail;
	private String user_pw;
	private String user_pic;
	private String user_rank;
	private Date user_lastlogin;
	private int user_fk_job_num;
	private int user_fk_dpart_num;
	private int user_fk_acc_authornum;
	private int user_fk_comp_num;
	private int user_trynum;
	private boolean user_locked;
	
	public boolean isUser_locked() {
		return user_locked;
	}
	public void setUser_locked(boolean user_locked) {
		this.user_locked = user_locked;
	}
	public int getUser_trynum() {
		return user_trynum;
	}
	public void setUser_trynum(int user_trynum) {
		this.user_trynum = user_trynum;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public Date getUser_lastlogin() {
		return user_lastlogin;
	}
	public int getUser_fk_comp_num() {
		return user_fk_comp_num;
	}
	public void setUser_fk_comp_num(int user_fk_acc_comp_num) {
		this.user_fk_comp_num = user_fk_acc_comp_num;
	}
	public int getUser_pk_num() {
		return user_pk_num;
	}
	public void setUser_pk_num(int user_pk_num) {
		this.user_pk_num = user_pk_num;
	}
	public String getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(String user_regdate) {
		this.user_regdate = user_regdate;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_pic() {
		return user_pic;
	}
	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}
	public String getUser_rank() {
		return user_rank;
	}
	public void setUser_rank(String user_rank) {
		this.user_rank = user_rank;
	}
	public int getUser_fk_job_num() {
		return user_fk_job_num;
	}
	public void setUser_fk_job_num(int user_fk_job_num) {
		this.user_fk_job_num = user_fk_job_num;
	}
	public int getUser_fk_dpart_num() {
		return user_fk_dpart_num;
	}
	public void setUser_fk_dpart_num(int user_fk_dpart_num) {
		this.user_fk_dpart_num = user_fk_dpart_num;
	}
	public int getUser_fk_acc_authornum() {
		return user_fk_acc_authornum;
	}
	public void setUser_fk_acc_authornum(int user_fk_acc_authornum) {
		this.user_fk_acc_authornum = user_fk_acc_authornum;
	}
}
