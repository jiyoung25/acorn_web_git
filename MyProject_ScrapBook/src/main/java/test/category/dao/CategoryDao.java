package test.category.dao;

import test.category.dto.CategoryDto;
import test.util.DbcpBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
	private static CategoryDao dao;
	private CategoryDao() {
	}
	
	static {
		if(dao==null) {
			dao = new CategoryDao();
		}
	}
	public static CategoryDao getInstance() {
		return dao;
	}
	
	public List<CategoryDto> getList() {
		//회원 목록을 담을 객체 생성
		List<CategoryDto> list = new ArrayList<>();

		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CategoryDto dto = null;

		try {
			//Connection Pool에서 Connection객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//생성할 sql문의 뼈대 구성하기
			String sql = "SELECT tab_name, tab_sub"
					+ " FROM board_category";
			//sql문의 ?에 바인딩 할 것이 있으면 한다.

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new CategoryDto();
				dto.setTab_name(rs.getString(1));
				dto.setTab_name(rs.getString(2));
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
	
	public CategoryDto getData(String num) {
		//회원 목록을 담을 객체 생성
		List<CategoryDto> list = new ArrayList<>();

		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CategoryDto dto = null;

		try {
			//Connection Pool에서 Connection객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//생성할 sql문의 뼈대 구성하기
			String sql = "SELECT tab_name, tab_sub"
					+ " FROM board_category"
					+ " WHERE num = ?";
			//sql문의 ?에 바인딩 할 것이 있으면 한다.

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new CategoryDto();
				dto.setTab_name(rs.getString(1));
				dto.setTab_sub(rs.getString(2));
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
	
	public CategoryDto getData(int bignum) {
		//회원 목록을 담을 객체 생성
		List<CategoryDto> list = new ArrayList<>();

		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CategoryDto dto = null;

		try {
			//Connection Pool에서 Connection객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//생성할 sql문의 뼈대 구성하기
			String sql = "SELECT tab_name, tab_sub"
					+ " FROM board_category"
					+ " WHERE bignum = ?";
			//sql문의 ?에 바인딩 할 것이 있으면 한다.

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bignum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new CategoryDto();
				dto.setTab_name(rs.getString(1));
				dto.setTab_sub(rs.getString(2));
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
	
}
