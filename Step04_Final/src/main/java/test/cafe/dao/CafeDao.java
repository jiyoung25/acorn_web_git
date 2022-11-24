package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	private CafeDao(){};
	
	/*
	 *  static method 생성자를 호출하지 않고 클래스명으로 바로 호출을 하기 때문에
	 *  메소드 호출 전에 무언가 준비 작업을 하고싶다면 static block 안에서 하면 된다.
	 *  static block은 해당 클래스를 최초로 사용할 때 한 번만 실행되기 때문에
	 *  초기화 작업을 하기에 적합한 블럭이다. 
	 */
	static {
		if(dao == null) {
			dao= new CafeDao();
		}
	}
	
	public static CafeDao getInstance() {
		return dao;
	}
	
	public List<CafeDto> getList() {
		List<CafeDto> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT num, writer, title, content, viewCount, regdate"
					+ " FROM board_cafe"
					+ " ORDER BY num ASC";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CafeDto dto = new CafeDto();
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setViewCount(rs.getInt(5));
				dto.setRegdate(rs.getString(6));
				
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류가 생겨 리스트를 불러올 수 없습니다.");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}
	
	public boolean insert(CafeDto dto) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_cafe"
					+ " VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("무언가 문제가 생겨 insert() 실패");
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return rowCount > 0 ? true : false;
	}
	
	public CafeDto getData(int num) {
		CafeDto dto= null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer, title, content, viewCount, TO_CHAR(regdate, 'YYYY.MM.DD') as regdate"
					+ " FROM board_cafe"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto=new CafeDto();
				dto.setNum(num);
				dto.setWriter(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setViewCount(rs.getInt(4));
				dto.setRegdate(rs.getString(5));
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류가 생겨 리스트를 불러올 수 없습니다.");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection반납하기
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return dto;
	}
	
	public boolean countUpdate(int num, int viewCount) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
					+ " SET viewCount = ?"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, viewCount);
			pstmt.setInt(2, num);
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("무언가 문제가 생겨 countUpdate 실패");
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return rowCount > 0 ? true : false;
	}
}
