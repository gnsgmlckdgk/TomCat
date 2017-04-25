package net.member.db;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
	
	// 아이디(이메일) 중복체크
	public int idOverlapCheck(String id) {
		int check = 0;	// 0은 중복, 1은 사용가능
		
		try {
			con = getConnection();
			
			sql = "select count(id) as count from member where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt("count") > 0) {	// 아이디 중복
					check = 0;
				}else {										// 아이디 사용가능
					check = 1;
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

	// 로그인 인증
	public int memberLogin(String id, String pass) {
		
		// -1 아이디없음, 0 비밀번호 틀림, 1 비밀번호 맞음
		int check = -1;
		
		try {
			
			con = getConnection();
			
			// DB의 pass가 단방향 암호화 SHA-256으로 되어있기때문에 매개변수 pass를 SHA-256암호화 후 비교한다.
			sql = "select pass from member where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String passSHA = txtSHA256(pass);	// SHA256 암호화
				if(rs.getString("pass").equals(passSHA)) {
					check = 1;
				}else {	// 비밀번호 틀림
					check = 0;
				}
			}else {	// 아이디 없음
				check = -1;
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
	
	// SHA256 암호화(비밀번호 확인 시 필요)
	public String txtSHA256(String str){
	
		String SHA = ""; 
	
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();

		}catch(NoSuchAlgorithmException e){
			System.out.println("SHA256암호화 오류");
			e.printStackTrace(); 
			SHA = null; 
		}
			return SHA;
	}
	
}








