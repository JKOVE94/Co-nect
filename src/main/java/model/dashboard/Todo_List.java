package model.dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.dbcp.DBConnectionMgr;
import db.dto.TodoDTO;

public class Todo_List {
	public ArrayList<TodoDTO> getTodoList(String SessionID){
		
		DBConnectionMgr pool = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList list = new ArrayList();
		try {
			//현재 로그인된 사용자가 등록한 일정(todo)만 가져오기
			String sql = "SELECT todo_pk_num, todo_title, todo_content, todo_start, todo_end FROM todo WHERE todo_fk_user_num = ?";
			
			pool = DBConnectionMgr.getInstance();
			conn = pool.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, Integer.parseInt(SessionID));
			rs = stmt.executeQuery();
			while(rs.next()) {
				TodoDTO dto = new TodoDTO();
				dto.setTodo_pk_num(rs.getInt("todo_pk_num"));
				dto.setTodo_title(rs.getString("todo_title"));
				dto.setTodo_content(rs.getString("todo_content"));
				dto.setTodo_start(rs.getDate("todo_start"));
				dto.setTodo_end(rs.getDate("todo_end"));
				
				list.add(dto);
			}
			
		} catch(Exception e) { System.out.println("todoList"+e);}
		
		
		return list;
	}
}
