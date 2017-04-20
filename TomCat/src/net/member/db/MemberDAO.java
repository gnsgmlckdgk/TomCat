package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
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
	
	// 회원가입
	public void insertMember(MemberBean mb) {
		
		/* DB암호화 */
		// 비밀번호 단방향 암호화(SHA-256)
		// 전화번호 양방향 암호화(AES)
		
		try {
			con = getConnection();
			
			sql = "insert into member(id, pass, name, nick, gender, tel, reg_date, profile, auth) "
					+ "values(?, SHA2(?, 256), ?, ?, ?, HEX(AES_ENCRYPT(?, 'tel')), ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getPass());
			ps.setString(3, mb.getName());
			ps.setString(4, mb.getNick());
			ps.setString(5, mb.getGender());
			ps.setString(6, mb.getTel());		// 암호화키 임시로 tel로 해놓음
			ps.setTimestamp(7, mb.getReg_date());
			ps.setString(8, mb.getProfile());
			ps.setInt(9, 0);
			
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
