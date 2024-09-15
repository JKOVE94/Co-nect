package mybean.dto;

public class DepartmentDTO {
	private int dpart_pk_num;
	private String dpart_name;
	private String dpart_mail;
	private int dpart_fk_dpart_num;
	private int dpart_fk_comp_num;
	
	public int getDpart_pk_num() {
		return dpart_pk_num;
	}
	public void setDpart_pk_num(int dpart_pk_num) {
		this.dpart_pk_num = dpart_pk_num;
	}
	public String getDpart_name() {
		return dpart_name;
	}
	public void setDpart_name(String dpart_name) {
		this.dpart_name = dpart_name;
	}
	public String getDpart_mail() {
		return dpart_mail;
	}
	public void setDpart_mail(String dpart_mail) {
		this.dpart_mail = dpart_mail;
	}
	public int getDpart_fk_dpart_num() {
		return dpart_fk_dpart_num;
	}
	public void setDpart_fk_dpart_num(int dpart_fk_dpart_num) {
		this.dpart_fk_dpart_num = dpart_fk_dpart_num;
	}
	public int getDpart_fk_comp_num() {
		return dpart_fk_comp_num;
	}
	public void setDpart_fk_comp_num(int dpart_fk_comp_num) {
		this.dpart_fk_comp_num = dpart_fk_comp_num;
	}
}
