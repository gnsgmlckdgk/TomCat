package net.myplan.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MyPlanDAO {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "";
	
	// Connection pool
	private Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mySQL");
		con = ds.getConnection();
		
		return con;
	}

	public void insertMyplan(MyPlanBean mplBean) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int num=0;
		try {
			//1,2 디비연결
			con=getConnection();
			//num구하기
			sql="select max(travel_id) from travel";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1;
			}else{
				num=1;
			}
			//3 sql insert
			sql="insert into travel(travel_id,type,country_code,city_code,name,latitude,longitude,info,address) values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, mplBean.getTravel_id());
			pstmt.setString(2, mplBean.getType());
			pstmt.setString(3, mplBean.getCountry_code());
			pstmt.setString(4, mplBean.getCity_code());
			pstmt.setString(5, mplBean.getName());
			pstmt.setString(6, mplBean.getLatitude());
			pstmt.setString(7, mplBean.getLongitude());
			pstmt.setString(8, mplBean.getInfo());
			pstmt.setString(9, mplBean.getAddress());
		
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}

	public List getMyPlanList() {
		// TODO Auto-generated method stub
		List myplanList =new ArrayList();
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			sql="select * from travel";
			pstmt=con.prepareStatement(sql);
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs데이터 있으면 자바빈 객체 생성 mplBean
			//  rs => 자바빈 멤버변수 저장 => goodsList 한칸 저장
			while(rs.next()){
				MyPlanBean mpl =new MyPlanBean();
				mpl.setTravel_id(rs.getInt("travel_id"));
				mpl.setType(rs.getString("type"));
				mpl.setCountry_code(rs.getString("country_code"));
				mpl.setCity_code(rs.getString("city_code"));
				mpl.setName(rs.getString("name"));
				mpl.setLatitude(rs.getString("latitude"));
				mpl.setLongitude(rs.getString("longitude"));
				mpl.setInfo(rs.getString("info"));
				mpl.setAddress(rs.getString("address"));
				//자바빈 => 배열 한칸 저장
				myplanList.add(mpl);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return myplanList;
	}


			
		/* map DAO 추후사용예정
		 * 
		 * 	public List<MyPlanBean> MyPlan(){

		List<MyPlanBean> MyPlan = new ArrayList<MyPlanBean>();
		
		try {			
			con = getConnection();
			
			sql = "select name, latitude, longitude from travel";
			ps = con.prepareStatement(sql);
		
			
			rs = ps.executeQuery();
			
			MyPlanBean mb;
			while(rs.next()) {
				mb = new MyPlanBean();
				mb.setName(rs.getString("name"));
				mb.setLatitude(rs.getString("latitude"));
				mb.setLongitude(rs.getString("longitude"));
				
				MyPlan.add(mb);
			}
			
		}catch(Exception e) {
			System.out.println("MemberDAO클래스 getFinderMemberId() 예외 오류");
			e.printStackTrace();
		}finally {
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return MyPlan;
		
		}*/

	
	

}
