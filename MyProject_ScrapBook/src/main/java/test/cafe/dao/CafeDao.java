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
					+ " FROM board_cafe2"
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
	
	//카테고리 소분류별 numbering
	public List<CafeDto> getRowList(CafeDto dto, String category) {
		List<CafeDto> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			
			String sql = "SELECT *"
					+" FROM"
					+" (SELECT result1.*, ROWNUM AS rnum"
					+" FROM"
					+"	(SELECT f.num, f.writer, f.title, f.viewCount, TO_CHAR(f.regdate, 'YYYY.MM.DD') AS regdate, f.category"
					+"	FROM board_cafe2 f, board_category t"
					+"	WHERE f.category=t.num AND t.bignum=(SELECT bignum"
					+"					FROM board_category"
					+"					WHERE num = ?)"
					+"	ORDER BY num DESC) result1)"
					+" WHERE rnum BETWEEN ? AND ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new CafeDto();
				
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setViewCount(rs.getInt(4));
				dto.setRegdate(rs.getString(5));
				dto.setCategory(rs.getString(6));
				
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
					conn.close(); //Connection Pool에 Connection반납하기
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}
	
	//전체목록 numbering
	public List<CafeDto> getRowList(CafeDto dto) {
		List<CafeDto> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			
			String sql = "SELECT *"
					+" FROM"
					+" (SELECT result1.*, ROWNUM AS rnum"
					+" FROM"
					+"	(SELECT f.num, f.writer, f.title, f.viewCount, TO_CHAR(f.regdate, 'YYYY.MM.DD') AS regdate"
					+"	FROM board_cafe2 f, board_category t"
					+"	WHERE f.category=t.num) result1)"
					+" WHERE rnum BETWEEN ? AND ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new CafeDto();
				
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setViewCount(rs.getInt(4));
				dto.setRegdate(rs.getString(5));
				
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
					conn.close(); //Connection Pool에 Connection반납하기
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}
	
	//bignum 으로 페이지 넘버링
	public List<CafeDto> getRowList(CafeDto dto, int num) {
		List<CafeDto> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			
			String sql = "SELECT *"
					+" FROM"
					+" (SELECT result1.*, ROWNUM AS rnum"
					+" FROM"
					+"	(SELECT f.num, f.writer, f.title, f.viewCount, TO_CHAR(f.regdate, 'YYYY.MM.DD') AS regdate, f.category"
					+"	FROM board_cafe2 f, board_category t"
					+"	WHERE f.category=t.num AND t.bignum= ? "
					+"	ORDER BY num DESC) result1)"
					+" WHERE rnum BETWEEN ? AND ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new CafeDto();
				
				dto.setNum(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setViewCount(rs.getInt(4));
				dto.setRegdate(rs.getString(5));
				dto.setCategory(rs.getString(6));
				
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
					conn.close(); //Connection Pool에 Connection반납하기
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
			String sql = "INSERT INTO board_cafe2"
					+ " VALUES(board_cafe_seq2.NEXTVAL, ?, ?, ?, 0, SYSDATE, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getCategory());
			
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
			String sql = "SELECT writer, title, content, viewCount, TO_CHAR(regdate, 'YYYY.MM.DD') as regdate, category"
					+ " FROM board_cafe2"
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
				dto.setCategory(rs.getString(6));
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
	
	public boolean addViewCount(int num, int viewCount) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe2"
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
	
	public boolean update(CafeDto dto) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe2"
					+ " SET title = ?, content = ?, category = ?"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getCategory());
			pstmt.setInt(4, dto.getNum());
			
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("무언가 문제가 생겨 update 실패");
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

		return rowCount> 0 ? true : false;
	}
	
	public boolean delete(int num) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_cafe2"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete실패");
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
	
	//전체 글의 개수를 리턴하는 메소드
	public int getCount() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT MAX(ROWNUM) AS num"
					+ " FROM board_cafe2";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("num");
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

		return count;
	}
}
