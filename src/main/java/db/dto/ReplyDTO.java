package db.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class ReplyDTO {
	private int reply_pk_num; //댓글 번호 [PK, INT]
	private String reply_cont; //댓글 내용 {TEXT]
	private int reply_fk_post_num; //게시글 번호 [FK, INT]
	private int reply_fk_user_num; //댓글 작성자 사번 [FK, INT]
}
