package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {};
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
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
	
	//인자로 전달되는 dto에 있는 id와 pwd를 이용해서 해당 정보가 유요한지 여부를 리턴하는 메소드
	public boolean isValid(UsersDto dto) {
		
		//id와 pwd유효성 여부를 담을 변수를 만들고 초기값 false를 부여하기
		boolean isValid = false;
		
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT id, pwd, email, profile, regdate"
					+ " FROM users"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				isValid = true;
				dto.setId(rs.getString(1));
				dto.setEmail(rs.getString(3));
				dto.setProfile(rs.getString(4));
				dto.setRegdate(rs.getString(5));
				
			}
			
			rowCount = pstmt.executeUpdate();

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

		return rowCount == 0 ? false : true;
	}
}
