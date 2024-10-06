package model.common;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;
import db.dto.TaskDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class getAllTask {
	public HashMap<Integer, TaskDTO> getAllTaskInfo() {
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		HashMap<Integer, TaskDTO> map = new HashMap<Integer, TaskDTO>();
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();

			String sql = "SELECT * FROM task";

			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				TaskDTO dto = new TaskDTO();
				int task_pk_num = rs.getInt("task_pk_num");
				dto.setTask_pk_num(task_pk_num);
				dto.setTask_title(rs.getString("task_title"));
				dto.setTask_desc(rs.getString("task_desc"));
				dto.setTask_startdate(rs.getDate("task_startdate"));
				dto.setTask_deadline(rs.getDate("task_deadline"));
				dto.setTask_enddate(rs.getDate("task_enddate"));
				dto.setTask_duration(rs.getInt("task_duration"));
				dto.setTask_progress(rs.getInt("task_progress"));
				dto.setTask_priority(rs.getInt("task_priority"));
				dto.setTask_created(rs.getDate("task_created"));
				dto.setTask_updated(rs.getDate("task_updated"));
				dto.setTask_version(rs.getInt("task_version"));
				dto.setTask_fk_user_num(rs.getInt("task_fk_user_num"));
				dto.setTask_fk_proj_num(rs.getInt("task_fk_proj_num"));
				dto.setTask_fk_task_num(rs.getInt("task_fk_task_num"));

				map.put(task_pk_num, dto);
			}
		} catch (Exception e) {
			System.out.println("getAllTask : " + e);

		} finally {
			if (conn != null) {
				pool.freeConnection(conn, stmt);
			}
		}

		return map;
	}

	//task_fk_proj_num 을 통해 해당되는 테스크 get
	public ArrayList<TaskDTO> getAllTaskInfo(String proj_pk_num) {
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<TaskDTO> list = new ArrayList<TaskDTO>();
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();

			String sql = "SELECT * FROM task WHERE task_fk_proj_num= " + proj_pk_num +" ORDER BY task_fk_proj_num, task_fk_task_num, task_pk_num";

			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				TaskDTO dto = new TaskDTO();
				int task_pk_num = rs.getInt("task_pk_num");
				dto.setTask_pk_num(task_pk_num);

				dto.setTask_title(rs.getString("task_title"));
				dto.setTask_desc(rs.getString("task_desc"));
				dto.setTask_status(rs.getString("task_status"));
				dto.setTask_startdate(rs.getDate("task_startdate"));
				dto.setTask_deadline(rs.getDate("task_deadline"));
				dto.setTask_enddate(rs.getDate("task_enddate"));
				dto.setTask_duration(rs.getInt("task_duration"));
				dto.setTask_progress(rs.getInt("task_progress"));
				dto.setTask_priority(rs.getInt("task_priority"));
				dto.setTask_created(rs.getDate("task_created"));
				dto.setTask_updated(rs.getDate("task_updated"));
				dto.setTask_version(rs.getInt("task_version"));
				dto.setTask_fk_user_num(rs.getInt("task_fk_user_num"));
				dto.setTask_fk_proj_num(rs.getInt("task_fk_proj_num"));
				dto.setTask_fk_task_num(rs.getInt("task_fk_task_num"));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getAllTask : " + e);

		} finally {
			if (conn != null) {
				pool.freeConnection(conn, stmt);
			}
		}
		return list;
	}
}
