package db.dto;

public class ReplyDTO {
	private int reply_pk_num;
	private String reply_cont;
	private int reply_fk_post_num;
	private int reply_fk_user_num;
	
	public int getReply_pk_num() {
		return reply_pk_num;
	}
	public void setReply_pk_num(int reply_pk_num) {
		this.reply_pk_num = reply_pk_num;
	}
	public String getReply_cont() {
		return reply_cont;
	}
	public void setReply_cont(String reply_cont) {
		this.reply_cont = reply_cont;
	}
	public int getReply_fk_post_num() {
		return reply_fk_post_num;
	}
	public void setReply_fk_post_num(int reply_fk_post_num) {
		this.reply_fk_post_num = reply_fk_post_num;
	}
	public int getReply_fk_user_num() {
		return reply_fk_user_num;
	}
	public void setReply_fk_user_num(int reply_fk_user_num) {
		this.reply_fk_user_num = reply_fk_user_num;
	}
}
