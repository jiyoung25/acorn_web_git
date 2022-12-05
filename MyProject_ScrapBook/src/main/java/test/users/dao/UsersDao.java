package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.spi.DirStateFactory.Result;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {
		
	}
	static {
		if(dao==null) {
			dao = new UsersDao();
		}
	}
	public static UsersDao getInstance() {
		return dao;
	}
	
	public boolean insert(UsersDto dto) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO users2"
					+ " (id, nickname, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert 실패");
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

		return rowCount >0 ? true : false;
	}
	public UsersDto getData(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		UsersDto dto = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT nickname ,pwd, email, profile, TO_CHAR(regdate, 'YYYY.MM.DD') AS regdate"
					+ " FROM users2"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setNickname(rs.getString(1));
				dto.setPwd(rs.getString(2)); //rs.getString("pwd")도 가능
				dto.setEmail(rs.getString(3));
				dto.setProfile(rs.getString(4));
				dto.setRegdate(rs.getString(5));
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
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.print("getData 실패");
			}
		}

		return dto;
	}

	public boolean checkNick(String nickname) {
		boolean isExist = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT rownum"
					+ " FROM users2"
					+ " WHERE nickname= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isExist = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("chekNick실패");
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
		return isExist;
	}
	
	public boolean isValid(String id) {
		boolean isExist = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT rownum"
					+ " FROM users2"
					+ " WHERE id= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isExist = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isValid 실패");
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
		return isExist;
	}
	
	public boolean updatePwd(String pwd, String id) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "Update users2"
					+ " SET pwd = ?"
					+ " WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updatePwd 실패");
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
	
	public boolean update(UsersDto dto) {
		
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE users2"
					+ " SET nickname=?, email=?, profile=?"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNickname());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getProfile());
			pstmt.setString(4, dto.getId());
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
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
}
