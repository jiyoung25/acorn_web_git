package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao() {
		
	}
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
	
	public int getCount() {
		int count = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			//생성할 sql문의 뼈대 구성하기
			String sql = "SELECT MAX(ROWNUM) AS num"
					+ " FROM board_file";
			//sql문의 ?에 바인딩 할 것이 있으면 한다.

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count=rs.getInt(1);
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

		return count;
	}
	
	   public List<FileDto> getList(FileDto dto){
		      //파일 목록을 담을 ArrayList 객체 생성 
		      List<FileDto> list=new ArrayList<FileDto>();
		      
		      //필요한 객체를 담을 지역변수를 미리 만들어 둔다. 
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         //Connection Pool 에서 Connection 객체를 하나 얻어온다.
		         conn = new DbcpBean().getConn();
		         //실행할 sql 문의 뼈대 구성하기
		         String sql = "SELECT * "
		               + " FROM"
		               + "   (SELECT result1.*, ROWNUM AS rnum"
		               + "   FROM"
		               + "      (SELECT num, writer, title, orgFileName, fileSize, regdate"
		               + "      FROM board_file"
		               + "      ORDER BY num DESC) result1)"
		               + " WHERE rnum BETWEEN ? AND ?";
		         //sql 문의 ? 에 바인딩 할게 있으면 한다.
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, dto.getStartRowNum());
		         pstmt.setInt(2, dto.getEndRowNum());
		         
		         //SELECT 문을 수행하고 결과값을 받아온다.
		         rs = pstmt.executeQuery();
		         //반복문 돌면서 ResultSet 에서 필요한 값을 얻어낸다.
		         while (rs.next()) {
		            //FileDto 객체에 select 된 row 하나의 정보를 담고
		            FileDto tmp=new FileDto();
		            tmp.setNum(rs.getInt("num"));
		            tmp.setWriter(rs.getString("writer"));
		            tmp.setTitle(rs.getString("title"));
		            tmp.setOrgFileName(rs.getString("orgFileName"));
		            tmp.setFileSize(rs.getLong("fileSize"));
		            tmp.setRegdate(rs.getString("regdate"));
		            //ArrayList 객체에 누적 시킨다.
		            list.add(tmp);
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         try {
		            if (rs != null)
		               rs.close();
		            if (pstmt != null)
		               pstmt.close();
		            if (conn != null)
		               conn.close(); //Connection Pool 에 Connection 반납하기
		         } catch (Exception e) {
		         }
		      }
		      return list;
		   }

	
	public boolean insert(FileDto dto) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " VALUES(board_file_seq.NEXTVAL, ?, ? , ?, ? , ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());

			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("");
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

		return rowCount == 0 ? false : true;
	}
	
	public FileDto getData(int num) {
		
		FileDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT writer, title, orgFileName, saveFileName, fileSize, regdate"
					+ " FROM board_file"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));
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
	
	public boolean delete(int num) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE"
					+ " FROM board_file"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("");
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

		return rowCount>0 ? true : false;
	}
}
