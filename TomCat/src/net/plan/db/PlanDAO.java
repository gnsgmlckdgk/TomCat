package net.plan.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PlanDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	private Connection getConnection() throws Exception{		
		
		Connection con = null;
		//Context 객체 생성
		Context init = new InitialContext();
		//DateSource = 디비연동 이름 불러오기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mySQL");
		//con = DataSource
		con = ds.getConnection();
		return con;
	}
	
	public int getPlanCount(){
		ResultSet rs = null;
		int count = 0;
		try{			
			//1,2디비연결 메서드호출
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			
			sql = "select count(num) from images";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){count = rs.getInt(1);}
			
			//3. sql insert  디비날짜 now()
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return count;
	}// getBoardCount() end
	
	public List<PlanImageBean> getPlanList(int startRow, int pageSize){
		ResultSet rs = null;
		List<PlanImageBean> planImageList = new ArrayList<PlanImageBean>();
		try{
			
			//1,2디비연결 메서드호출
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			sql = "select * from images order by num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				PlanImageBean pib = new PlanImageBean();
				pib.setNum(rs.getInt(1));
				pib.setType(rs.getString(2));
				pib.setFile(rs.getString(3));
				pib.setCountry_code(rs.getString(4));
				pib.setCity_code(rs.getString(5));
				pib.setTravel_id(rs.getInt(6));
				pib.setNick(rs.getString(7));
				pib.setImg_info(rs.getString(8));				
				planImageList.add(pib);
			}

		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return planImageList;
	} //getBoardList() end
	
}
