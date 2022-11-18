package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//자신의 참조값을 저장할 static 필드(하나만 만들어놓고 사용할 예정이기 때문에)
	private static MemberDao dao;
	
	//외부에서 객체를 생성하지 못하도록 생성자의 접근지정자를 private로 한다.
	private MemberDao() {
		
	}
	
	//자신의 참조값을 리턴하는 static 메소드를 제공한다.
	public static MemberDao getInstance() {
		//만일 최초 호출이라면 자신의 객체를 생성해서 static field에 담아둔다.
		if(dao==null) {
			dao=new MemberDao();
		}
		//필드에 있는 자신의 참조값을 리턴해준다.
		return dao;
	}
	
	//전체 회원의 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		//회원 목록을 담을 객체 생성
		List<MemberDto> list=new ArrayList<>();
		
		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			//Connection Pool에서 Connection객체를 하나 얻어온다.
			conn=new DbcpBean().getConn();
			//생성할 sql문의 뼈대 구성하기
			String sql="SELECT *"
					+ " FROM member"
					+ " ORDER BY num ASC";
			//sql문의 ?에 바인딩 할 것이 있으면 한다.
			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				//커서가 위치한 곳에 회원 한 명의 정보를 얻어내서 MemberDto에 담은 후
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//ArrayList객체에 누적시킨다.
				list.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("오류가 생겨 리스트를 불러올 수 없습니다.");
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close(); //Connection Pool에 Connection반납하기
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	//회원 1명의 정보 dao
	public MemberDto getData(int num){
		MemberDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT *"
					+ " FROM member"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류가 생겨 선택한 리스트를 불러올 수 없습니다.");
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
	
	public boolean insert(MemberDto dto) {
		int rowCount=0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			rowCount = pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("문제가 생겨 회원 추가에 실패했습니다.");
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return rowCount==0? false:true;
	}
	
	//회원 한 명의 정보를 수정·반영하는 메소드
	public boolean update(MemberDto dto) {
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE member"
					+ " SET name = ?, addr = ?"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류가 생겨 수정에 실패하였습니다.");
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
	
	public boolean delete(MemberDto dto) { //매개변수로 MemberDto dto 대신 int num해도 됨.
		int rowCount = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE"
					+ " FROM member"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("무언가 문제가 생겨 회원 정보 삭제에 실패했습니다.");
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
