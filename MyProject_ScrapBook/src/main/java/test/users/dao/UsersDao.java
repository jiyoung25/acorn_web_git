package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			String sql = "INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert 성공");
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
			String sql = "SELECT pwd, email, profile, TO_CHAR(regdate, 'YYYY.MM.DD') AS regdate"
					+ " FROM users"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString(1)); //rs.getString("pwd")도 가능
				dto.setEmail(rs.getString(2));
				dto.setProfile(rs.getString(3));
				dto.setRegdate(rs.getString(4));
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
			}
		}

		return dto;
	}
}
