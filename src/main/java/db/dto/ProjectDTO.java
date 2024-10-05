package db.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ProjectDTO {
	private int proj_pk_num; //프로젝트 번호 [PK, INT]
	private String proj_name; //프로젝트 이름 [VARCHAR]
	private String proj_desc; //프로젝트 설명 [TEXT]
	private Date proj_startdate; //프로젝트 시작일 [DATETIME]
	private Date proj_enddate; // 프로젝트 종료일 [DATETIME]
	private String proj_status; // 프로젝트 상태 [VARCHAR] (예정, 진행 중, 완료)
	private String proj_members; // 프로젝트 참여자 사번 [VARCHAR] (String으로 저장 후 string tokenizer로 데이터 사용)
	private Date proj_created; //프로젝트 생성 일시 [DATETIME]
	private Date proj_updated; // 프로젝트 정보 최종 수정 일시 [DATETIME]
	private String proj_import; //프로젝트 중요도 [VARCHAR] (낮음, 보통, 높음, 매우높음)
	private String proj_tag; //임의로 부여하는 프로젝트 태그 [VARCHAR] => 검색용
	private String proj_tagcol; //프로젝트 태그 컬러 [VARCHAR]
	private String proj_icon; //프로젝트 아이콘 코드 [VARCHAR] => 부트스트랩 아이콘
	private int proj_fk_dpart_num; //프로젝트 부서 번호 [FK, INT]
	private int proj_fk_user_num; //프로젝트 담당자 사번 [FK, INT]
	private int proj_fk_comp_num; //프로젝트 회사 고유번호 [FK, INT]
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
	public String getProj_icon() {
		return proj_icon;
	}
	public void setProj_icon(String proj_icon) {
		this.proj_icon = proj_icon;
	}
	public int getProj_fk_dpart_num() {
		return proj_fk_dpart_num;
	}
	public void setProj_fk_dpart_num(int proj_fk_dpart_num) {
		this.proj_fk_dpart_num = proj_fk_dpart_num;
	}
	public int getProj_fk_user_num() {
		return proj_fk_user_num;
	}
	public void setProj_fk_user_num(int proj_fk_user_num) {
		this.proj_fk_user_num = proj_fk_user_num;
	}
	public int getProj_fk_comp_num() {
		return proj_fk_comp_num;
	}
	public void setProj_fk_comp_num(int proj_fk_comp_num) {
		this.proj_fk_comp_num = proj_fk_comp_num;
	}
	
	
	
}
