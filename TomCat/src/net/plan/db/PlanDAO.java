package net.plan.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PlanDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
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
	
	/* 국가 페이지 */
	// 국가의 도시 리스트 갯수
	public int getCityCount(String str) {
		int count = 0;
		String country_code;
		
		String nation = str;
		if("한국".equals(nation)) {
			nation = "대한민국";
		}
		
		System.out.println("DAO getCityCount()의 nation: " + nation);
		
		try {
			con = getConnection();
			
			// country_code 값 가져오기
			sql = "select country_code from country where name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nation);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// 검색된 국가가 있으면
				country_code = rs.getString("country_code");
				
				sql = "select count(*) as count from city where country_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, country_code);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt("count");
				}
			}else {	// 검색된 국가가 없으면
				return count;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return count;
	}
	
	// 국가페이지의 도시리스트 가져오기
	public List<PlanCityBean> getCityList(String str, int startRow, int pageSize) {
		
		String country_code = "";
		List<PlanCityBean> list = new ArrayList<PlanCityBean>();
		
		String nation = str;
		if("한국".equals(nation)) {
			nation = "대한민국";
		}
		
		try {
			con = getConnection();
			
			// country_code 값 가져오기
			sql = "select country_code from country where name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nation);
			rs = pstmt.executeQuery();
						
			if(rs.next()) {	// 검색된 국가가 있으면
				country_code = rs.getString("country_code");
				
				sql = "select city_code, name, en_name, info, country_code from city where country_code = ? limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, country_code);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				
				rs = pstmt.executeQuery();
				
				PlanCityBean pcb = null;
				while(rs.next()) {
					pcb = new PlanCityBean();
					
					pcb.setCity_code(rs.getString("city_code"));
					pcb.setName(rs.getString("name"));
					pcb.setEn_name(rs.getString("en_name"));
					pcb.setInfo(rs.getString("info"));
					pcb.setCountry_code(rs.getString("country_code"));
					
					list.add(pcb);
				}
				
			}else {
				return null;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	/* 지역페이지? */
	public int getTravelCount(String region){
		
		ResultSet rs = null;
		int count = 0;
		try{			
			//1,2디비연결 메서드호출
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			
			sql = "select count(travel_id) from travel where address like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + region + "%" );
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
	
	public List<PlanTravelBean> getTravelList(int startRow, int pageSize, String region){
		ResultSet rs = null;
		List<PlanTravelBean> planTravelList = new ArrayList<PlanTravelBean>();
		try{
			
			//1,2디비연결 메서드호출
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			sql = "select * from travel where address like ? order by travel_id desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + region + "%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				PlanTravelBean ptb = new PlanTravelBean();
				ptb.setTravel_id(rs.getInt(1));
				ptb.setType(rs.getString(2));
				ptb.setConuntry_code(rs.getString(3));
				ptb.setCity_code(rs.getString(4));
				ptb.setName(rs.getString(5));
				ptb.setLatitude(rs.getFloat(6));
				ptb.setLongitude(rs.getFloat(7));
				ptb.setInfo(rs.getString(8));
				ptb.setAddress(rs.getString(9));				
				ptb.setFile(rs.getString(10));
				planTravelList.add(ptb);
			}

		}catch (Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null) {try {rs.close();} catch (SQLException ex) {}	}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException ex) {}}
			if (con != null) {try {con.close();} catch (SQLException ex) {	}}
		}
		return planTravelList;
	} //getBoardList() end
	
	//국가리스트 뽑아오기
		public List<PlanCountryBean> getCountryList(){
			List<PlanCountryBean> countryList = new ArrayList();
			
			PlanCountryBean cb = null;
			Connection con = null;
			String sql = "";
			ResultSet rs = null;
			Statement stmt = null;
			
			try {
				//1,2디비연결 메서드 호출
				con=getConnection();
				
				
				//3 sql member모든 데이터 가져오기
				sql="select * from country order by name asc";
				//4 rs 실행저장
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				
				//5 rs while 첫행 데이터 있으면
				while(rs.next()){
					//자바빈 객체생성 MemberBean mb
					cb = new PlanCountryBean();
					//mb 멤버변수  <= rs에 id열에 해당하는 데이터 저장
					cb.setCountry_code(rs.getString("country_code"));
					cb.setName(rs.getString("name"));
					cb.setInfo(rs.getString("info"));
					cb.setContinent(rs.getString("continent"));
					cb.setEn_name(rs.getString("en_name"));
					
					// mb주소값을 memberList 한칸에 저장
					countryList.add(cb);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				// 예외상관없이 마무리 작업
				// 객체생성 닫기
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException ex) {
					} // Exception 이 가장 큰 범위
				} // if
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException ex) {
					} // Exception 이 가장 큰 범위
				} // if
				if (con != null) {
					try {
						con.close();
					} catch (SQLException ex) {
					} // Exception 이 가장 큰 범위
				} // if
				
			}
			return countryList;
			
		}
		
		//국가 추가하기
		public void insertCountry(PlanCountryBean pcb){
			PlanCountryBean cb = null;
			Connection con = null;
			String sql = "";
			ResultSet rs = null;
			Statement stmt = null;
			
			try{
				
				con=getConnection();
				sql =  "insert into country(country_code, name, info, continent, en_name) values(?,?,?,?,?)";
				pstmt= con.prepareStatement(sql);
				
				pstmt.setString(1, pcb.getCountry_code());
				pstmt.setString(2, pcb.getName());
				pstmt.setString(3, pcb.getInfo());
				pstmt.setString(4, pcb.getContinent());
				pstmt.setString(5, pcb.getEn_name());
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				// 예외상관없이 마무리 작업
				// 객체생성 닫기
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException ex) {
					} // Exception 이 가장 큰 범위
				} // if
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException ex) {
					} // Exception 이 가장 큰 범위
				} // if
				if (con != null) {
					try {
						con.close();
					} catch (SQLException ex) {
					} // Exception 이 가장 큰 범위
				} // if
				
			}
			
		}
		
	
}
