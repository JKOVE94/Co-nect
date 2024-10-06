package model.common;

import db.dbcp.DBConnectionMgr;
import db.dto.PostDTO;
import db.dto.TodoDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class getAllTodo {
	public ArrayList<TodoDTO> getAllTodoList() {
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<TodoDTO> list = new ArrayList<TodoDTO>();
		try {
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();

			String sql = "SELECT * FROM todo";

			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				TodoDTO dto = new TodoDTO();
				dto.setTodo_pk_num(rs.getInt("todo_pk_num"));
				dto.setTodo_title(rs.getString("todo_title"));
				dto.setTodo_content(rs.getString("todo_content"));
				dto.setTodo_start(rs.getDate("todo_start"));
				dto.setTodo_end(rs.getDate("todo_end"));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getAllTodo : " + e);

		} finally {
			if (conn != null) {
				pool.freeConnection(conn, stmt);
			}
		}
		return list;
	}

}
