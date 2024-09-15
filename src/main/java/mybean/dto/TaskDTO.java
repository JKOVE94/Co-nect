package mybean.dto;

import java.util.Date;

public class TaskDTO {
	private int task_pk_num;
	private String task_title;
	private String task_desc;
	private Date task_startdate;
	private Date task_deadline;
	private Date task_enddate;
	private int task_duration;
	private int task_progress;
	private String task_status;
	private int task_priority;
	private Date task_created;
	private Date task_updated;
	private int task_version;
	private int task_fk_user_num;
	private int task_fk_proj_num;
	private int task_fk_task_num;
	
	public int getTask_pk_num() {
		return task_pk_num;
	}
	public void setTask_pk_num(int task_pk_num) {
		this.task_pk_num = task_pk_num;
	}
	public int getTask_fk_proj_num() {
		return task_fk_proj_num;
	}
	public void setTask_fk_proj_num(int task_fk_proj_num) {
		this.task_fk_proj_num = task_fk_proj_num;
	}
	public int getTask_fk_task_num() {
		return task_fk_task_num;
	}
	public void setTask_fk_task_num(int task_fk_task_num) {
		this.task_fk_task_num = task_fk_task_num;
	}
	public String getTask_title() {
		return task_title;
	}
	public void setTask_title(String task_title) {
		this.task_title = task_title;
	}
	public String getTask_desc() {
		return task_desc;
	}
	public void setTask_desc(String task_desc) {
		this.task_desc = task_desc;
	}
	public Date getTask_startdate() {
		return task_startdate;
	}
	public void setTask_startdate(Date task_startdate) {
		this.task_startdate = task_startdate;
	}
	public Date getTask_deadline() {
		return task_deadline;
	}
	public void setTask_deadline(Date task_deadline) {
		this.task_deadline = task_deadline;
	}
	public Date getTask_enddate() {
		return task_enddate;
	}
	public void setTask_enddate(Date task_enddate) {
		this.task_enddate = task_enddate;
	}
	public int getTask_duration() {
		return task_duration;
	}
	public void setTask_duration(int task_duration) {
		this.task_duration = task_duration;
	}
	public int getTask_progress() {
		return task_progress;
	}
	public void setTask_progress(int task_progress) {
		this.task_progress = task_progress;
	}
	public String getTask_status() {
		return task_status;
	}
	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}
	public int getTask_priority() {
		return task_priority;
	}
	public void setTask_priority(int task_priority) {
		this.task_priority = task_priority;
	}
	public int getTask_fk_user_num() {
		return task_fk_user_num;
	}
	public void setTask_fk_user_num(int task_fk_user_num) {
		this.task_fk_user_num = task_fk_user_num;
	}
	public Date getTask_created() {
		return task_created;
	}
	public void setTask_created(Date task_created) {
		this.task_created = task_created;
	}
	public Date getTask_updated() {
		return task_updated;
	}
	public void setTask_updated(Date task_updated) {
		this.task_updated = task_updated;
	}
	public int getTask_version() {
		return task_version;
	}
	public void setTask_version(int task_version) {
		this.task_version = task_version;
	}
}
