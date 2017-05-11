package net.board.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs=null;
	int num=0;

	private Connection getConnection() throws Exception {
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/mySQL");
		con=ds.getConnection();
		return con;
	}


	public void insertBoard(boardBean bb) {
		int num=0;

		try {
			 con = getConnection();
			 sql="select max(num) from gram";
			 pstmt=con.prepareStatement(sql);			 
			 rs=pstmt.executeQuery();			 
			 if(rs.next()){num=rs.getInt(1)+1;}
	         sql = "insert into gram(num,nick,subject,content,image1,date) values(?,?,?,?,?,now())";
	         
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2,bb.getNick());
			pstmt.setString(3, bb.getSubject());
			pstmt.setString(4, bb.getContent());
			pstmt.setString(5, bb.getImage1());
			//date는 위에서 now()로 생성됨

		
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)
				try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)
				try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)
				try {con.close();} catch (SQLException ex) {}
		}//finally

	}//insertBoard 메소드

	public int getBoardcount(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs=null;
		int count=0;
		try{
			//1,2 디비연결 메서드 호출
			 con = getConnection();		
			 //3  sql 함수 count(*) 이용
			 sql="select count(*) from gram";
			 
			 pstmt=con.prepareStatement(sql);
			 
			 //4 rs실행저장
			 rs=pstmt.executeQuery();
			 //5 데이터있으면 count저장
			 
			 //select에서 검색한 첫번째 열에 값이 있는지 없는지 확인하는 작업
			  if(rs.next()){
				 count=rs.getInt(1);}		 
		}catch(Exception e){
			e.printStackTrace();}
		finally {
			if(rs!=null)
				try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)
				try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)
				try {con.close();} catch (SQLException ex) {}
		}//finally
		return count;		
	}//getBoardcount
	
	
	

	public List getBoardList(int startrow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;

		// 배열(컬렉션)객체 생성- 여러개의 기억공간 사용+기억공간 추가해서 사용
		List boardList = new ArrayList();
		try {
			// 1,2 디비연결 메서드 호출
			con = getConnection();
			// 3 sql member모든 데이터 가져오기
			//sql select*from board
			//최근글 위로 re_ref 그룹별 내림차순 정렬 re_seq 오름차순
			//re_ref desc, re_seq asc
			//글 잘라 오기 limit(시작행-1, 개수)
			sql = "select *from gram order by num desc limit ?,?";
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow-1);
			pstmt.setInt(2, pageSize);
			// 4 rs 실행저장
			rs = pstmt.executeQuery();
			
			
			// 5 rs while 첫행(다음행) 데이터 있으면
			// 자바빈 객체 생성 BoardBean bb
			// bb 멤버변수 <=rs열데이터 가져와서 저장
			// bb게시판 글 하나 =>boardList 한칸 저장
			
			while (rs.next()) {
				boardBean bb=new boardBean();
				bb.setNum(rs.getInt("num"));
				bb.setNick(rs.getString("nick"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setImage1(rs.getString("image1"));
				bb.setDate(rs.getDate("date"));

					
				//boardList 한칸 저장
				boardList.add(bb);
			}
	

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {rs.close();} catch (SQLException ex) {	}
			if (pstmt != null)
				try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)
				try {con.close();} catch (SQLException ex) {}

		}//finally
		return boardList;
	}

	
	public boardBean getBoard(int num) {
		boardBean bb=null;
		try{
		con = getConnection();
		sql = "select *from gram where num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,num);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			bb=new boardBean();
			
			bb.setNum(rs.getInt("num"));
			bb.setNick(rs.getString("nick"));
			bb.setSubject(rs.getString("subject"));
			bb.setContent(rs.getString("content"));
			bb.setImage1(rs.getString("image1"));
			bb.setDate(rs.getDate("date"));
		}
	
	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {rs.close();} catch (SQLException ex) {	}
		if (pstmt != null)
			try {pstmt.close();} catch (SQLException ex) {}
		if (con != null)
			try {con.close();} catch (SQLException ex) {}

	}//finally
	return bb;
}
	
	public void updateBoard(boardBean bb){
		//System.out.println(bb.getSubject());
	
		try{
			con = getConnection();
			
			
			
					sql = "update gram set nick=?, subject=?, content=?, image1=? where num=?";
					pstmt=con.prepareStatement(sql);
					
					pstmt.setString(1, bb.getNick());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setString(4,bb.getImage1());
					pstmt.setInt(5,bb.getNum());			
										
					pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {rs.close();} catch (SQLException ex) {	}
			if (pstmt != null)
				try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)
				try {con.close();} catch (SQLException ex) {}
		}//finally	
	}
	
	

	public void deleteboard(int num){
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		try {
			con = getConnection();

					sql = "delete from gram where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					System.out.println("정보삭제됨");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {rs.close();} catch (SQLException ex) {	}
			if (pstmt != null)
				try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)
				try {con.close();} catch (SQLException ex) {}
		}//finally	
		
		
	}
	
	
	
	
	
	
}//클래스 end