package net.myplan.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.member.db.MemberBean;

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
