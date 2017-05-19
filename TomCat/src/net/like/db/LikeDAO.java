package net.like.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.board.db.boardBean;

public class LikeDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	int num = 0;

	private Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mySQL");
		con = ds.getConnection();
		return con;
	}

	public void addLike(LikeBean lb) {
		int like_num = 0;

		try {
			con = getConnection();
			sql = "select max(like_num)as max from love";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				like_num = rs.getInt("max") + 1;
			}
			sql = "insert into love(like_num,num,nick) values(?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, like_num);
			pstmt.setInt(2, lb.getNum());
			pstmt.setString(3, lb.getNick());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		} // finally

	}

	public void adddislike(LikeBean lb) {
		System.out.println(lb.getLike_num());
		try {
			 con = getConnection();	 

				sql = "delete from love where num=? and nick=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,lb.getNum());
				pstmt.setString(2, lb.getNick());
				pstmt.executeUpdate();
				System.out.println("정보삭제됨");
		} catch (Exception e) {
			e.printStackTrace();
//		} finally {
			if(rs!=null)
				try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)
				try {pstmt.close();} catch (SQLException ex) {}
			if (con != null)
				try {con.close();} catch (SQLException ex) {}
		}//finally

	}

	public int getLikecount(int num,String nick) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
				sql = "select count(*) from love where num=? and nick=?";
	
				pstmt = con.prepareStatement(sql);
	
				pstmt.setInt(1,num);
				pstmt.setString(2,nick);
				rs = pstmt.executeQuery();
			// select에서 검색한 첫번째 열에 값이 있는지 없는지 확인하는 작업
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		} // finally
		return count;
	}// getBoardcount
	
	
	
	public int getLikecountall(int num) {		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
				sql = "select count(*) from love where num=? ";
	
				pstmt = con.prepareStatement(sql);
	
				pstmt.setInt(1,num);
				rs = pstmt.executeQuery();
			// select에서 검색한 첫번째 열에 값이 있는지 없는지 확인하는 작업
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		} // finally
		return count;
	}// getBoardcount
	
	

}
