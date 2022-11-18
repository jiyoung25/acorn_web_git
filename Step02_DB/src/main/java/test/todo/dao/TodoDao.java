package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	
	//오직 한 개만 생성된 TodoDao type 객체의 참조값을 담을 static field
	private static TodoDao dao;
	
	//외부에서 객체를 생성하지 못하도록 막아둔다.
	private TodoDao() {};
	
	//TodoDao객체의 참조값을 리턴해주는 static 메소드
	public static TodoDao getInstance() {
		//만일 필드에 저장된 값이 null이면(아직 TodoDao객체가 생성된 적이 없으면)
		if(dao==null) {
			//객체를 생성해서 참조값을 static 필드에 담아둔다.
			dao=new TodoDao();
		}
		//static 필드에 저장되어있는 TodoDao객체의 참조값 리턴하기
		return TodoDao.dao;
	}
	
	public List<TodoDto> getList(){
		List<TodoDto> list = new ArrayList<>();
		TodoDto dto=null;
		Connection conn= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num, content, regdate"
					+ " FROM todo"
					+ " ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getDate("regdate"));
				list.add(dto);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getList() 작업 중단");
		} finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null)	pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return list;
	}
	
	public TodoDto getData(int num){
		TodoDto dto = null;
		Connection conn= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT *"
					+ " FROM todo"
					+ " WHERE num = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto= new TodoDto(num, rs.getString("content"), rs.getDate("regdate"));
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getList() 작업 중단");
		} finally {
				try {
					if(rs!=null) rs.close();
					if(pstmt!=null)	pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return dto;
	}
	
	public boolean insert(TodoDto dto){
		int rowCount=0;
		Connection conn= null;
		PreparedStatement pstmt= null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="INSERT INTO todo"
					+ " (num, content, regdate)"
					+ " VALUES(todo_seq.NEXTVAL, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setDate(2, dto.getRegDate());
			rowCount = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("insert 작업 중단");
		} finally {
				try {
					if(pstmt!=null)	pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return rowCount>0? true:false;
	}
	
	public boolean update(TodoDto dto){
		int rowCount = 0;
		Connection conn= null;
		PreparedStatement pstmt= null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="UPDATE todo"
					+ " SET content = ?, regdate = ?"
					+ " WHERE num = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setDate(2, dto.getRegDate());
			pstmt.setInt(3, dto.getNum());
			rowCount=pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("update 작업 중단");
		} finally {
				try {
					if(pstmt!=null)	pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return rowCount>0? true:false;
	}
	
	public boolean delete(int num){
		int rowCount = 0;
		Connection conn= null;
		PreparedStatement pstmt= null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="DELETE FROM todo"
					+ " WHERE num = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rowCount=pstmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("delete 작업 중단");
		} finally {
				try {
					if(pstmt!=null)	pstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return rowCount>0? true:false;
	}
}