package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto2;
import test.util.DbcpBean;

public class TodoDao2 {
   //오직한개만 생성된 TodoDao type 객체의 참조값을 담을 static 필드
   private static TodoDao2 dao;
   
   //외부에서 객체 생성하지 못하도록 
   private TodoDao2() {}
   
   //TodoDao 객체의 참조값을 리턴해주는 static 메소드
   public static TodoDao2 getInstance() {
      //만일 필드에 저장된 값이 null 이면( 아직 TodoDao 객체가 생성된적이 없으면 )
      if(dao==null) {
         //객체를 생성해서 참조값을 static 필드에 담아 둔다.
         dao=new TodoDao2();
      }
      //static 필드에 저장되어 있는 TodoDao 객체의 참조값 리턴하기
      return dao;
   }
   //할일을 저장하는 메소드
   public boolean insert(TodoDto2 dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int rowCount = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "INSERT INTO todo"
               + " (num, content, regdate)"
               + " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 여기서 바인딩
         pstmt.setString(1, dto.getContent());
         //insert or update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
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
         }
      }
      if (rowCount > 0) {
         return true;
      } else {
         return false;
      }
   }
   //할일을 수정하는 메소드
   public boolean update(TodoDto2 dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int rowCount = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "UPDATE todo"
               + " SET content=?"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 여기서 바인딩
         pstmt.setString(1, dto.getContent());
         pstmt.setInt(2, dto.getNum());
         //insert or update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
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
         }
      }
      if (rowCount > 0) {
         return true;
      } else {
         return false;
      }
   }
   //할일을 삭제하는 메소드
   public boolean delete(int num) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int rowCount = 0;
      try {
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "DELETE FROM todo"
               + " WHERE num=?";
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 여기서 바인딩
         pstmt.setInt(1, num);
         //insert or update or delete 문 수행하고 변화된 row 의 갯수 리턴 받기
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
         }
      }
      if (rowCount > 0) {
         return true;
      } else {
         return false;
      }
   }
   //할일 한개의 정보를 리턴하는 메소드
   public TodoDto2 getData(int num) {
      TodoDto2 dto=null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         //Connection 객체의 참조값 얻어오기 
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "SELECT content,TO_CHAR(regdate,'YYYY.MM.DD HH24:MI') AS regdate"
               + " FROM todo"
               + " WHERE num=?";
         //PreparedStatement 객체의 참조값 얻어오기
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 여기서 바인딩
         pstmt.setInt(1, num);
         //select 문 수행하고 결과를 ResultSet 으로 받아오기
         rs = pstmt.executeQuery();
         //select 된 결과가 있다면 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
         if (rs.next()) {
            //TodoDto 객체를 생성해서 select 된 결과를 담아준다. 
            dto=new TodoDto2();
            dto.setNum(num);
            dto.setContent(rs.getString("content"));
            dto.setRegdate(rs.getString("regdate"));
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
         }
      }
      return dto;
   }
   //할일 목록을 리턴하는 메소드
   public List<TodoDto2> getList(){
      List<TodoDto2> list=new ArrayList<>();
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         //Connection 객체의 참조값 얻어오기 
         conn = new DbcpBean().getConn();
         //실행할 sql 문 작성
         String sql = "SELECT num, content, TO_CHAR(regdate, 'YY.MM.DD AM HH:MI') regdate"
               + " FROM todo"
               + " ORDER BY num ASC";
         //PreparedStatement 객체의 참조값 얻어오기
         pstmt = conn.prepareStatement(sql);
         //? 에 바인딩할 내용이 있으면 여기서 바인딩

         //select 문 수행하고 결과를 ResultSet 으로 받아오기
         rs = pstmt.executeQuery();
         //반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
         while (rs.next()) {
            // select 된 row 하나당 TodoDto 객체를 하나씩 생성해서 
            TodoDto2 dto=new TodoDto2();
            // row 에 있는 칼럼 내용을 담고 
            dto.setNum(rs.getInt("num"));
            dto.setContent(rs.getString("content"));
            dto.setRegdate(rs.getString("regdate"));
            // 위에서 생성된 TodoDto 객체의 참조값을 List 에 누적 시킨다.
            list.add(dto);
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
         }
      }
      return list;
   }   
}