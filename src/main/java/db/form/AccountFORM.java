package db.form;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AccountFORM {
	private int acc_pk_authornum; //계정 권한 고유번호 [PK, INT] (1, 2, 3)
	private String acc_author; //계정 권한 [VARCHAR] (일반사용자, 매니저, 관리자)
}
