package db.dto;

public class AccountDTO {
	private int acc_pk_authornum;
	private String acc_author;
	
	public int getAcc_pk_authornum() {
		return acc_pk_authornum;
	}
	public void setAcc_pk_authornum(int acc_pk_authornum) {
		this.acc_pk_authornum = acc_pk_authornum;
	}
	public String getAcc_author() {
		return acc_author;
	}
	public void setAcc_author(String acc_author) {
		this.acc_author = acc_author;
	}
}
