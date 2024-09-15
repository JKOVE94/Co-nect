package mybean.dto;

public class CompanyDTO {
	private int comp_pk_num;
	private String comp_name;
	private String comp_pic;
	
	public String getComp_pic() {
		return comp_pic;
	}
	public void setComp_pic(String comp_pic) {
		this.comp_pic = comp_pic;
	}
	public int getComp_pk_num() {
		return comp_pk_num;
	}
	public void setComp_pk_num(int comp_pk_num) {
		this.comp_pk_num = comp_pk_num;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
}
