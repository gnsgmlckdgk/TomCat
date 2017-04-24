package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Pattern;

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
	
	// 닉네임 중복체크
	public int nickOverlapCheck(String nick) {
		int check = -1;	// -1: 정규표현식 오류, 0: 중복, 1: 사용가능
		
		// 정규표현식 검사
		// 영문, 한글 시작 영문,숫자,한글 조합 가능 2~9자
		if(!Pattern.matches("^[a-z|A-Z|가-힣][a-z|A-Z|0-9|가-힣]{1,8}", nick)) {		// 정규표현식에 맞지 않으면
			return check;	// -1 반환
		}
		
		// 중복검사
		try{
			con = getConnection();
			
			sql = "select count(id) as count from member where nick=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt("count") == 0) {
					check = 1;
				}else if(rs.getInt("count")>0) {
					check = 0;
				}
			}
			
		}catch(Exception e) {
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
		
		return check;
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
			ps.setInt(9, mb.getAuth());		// 처음 가입땐 1(일반사용자)
			
			ps.executeUpdate();
			
		}catch(Exception e) {
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
		
	}

	
}
