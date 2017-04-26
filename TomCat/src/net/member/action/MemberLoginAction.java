package net.member.action;

import java.io.PrintWriter;
import java.security.PrivateKey;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int check = -1;
		
		// 한글처리
		request.setCharacterEncoding("utf-8");
		
		// 파라미터 값 가져오기
		String securedId = request.getParameter("id_login");
		String securedPass = request.getParameter("pass_login");
		
		// RSA암호화 한 값 복호화
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
        session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.

        if (privateKey == null) {
            throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
        }
        try {
            String id = decryptRsa(privateKey, securedId);
            String pass = decryptRsa(privateKey, securedPass);
            
            // DB에서 확인
            MemberDAO mdao = new MemberDAO();
            check = mdao.memberLogin(id, pass);
            
            if(check==1) {
            	// 세션값 생성
            	session.setAttribute("id", id);	// 아이디
            	
            	MemberBean mb = mdao.getMember(id);
            	session.setAttribute("nick", mb.getNick());	// 닉네임
            }
            
        } catch (Exception ex) {
        	System.out.println("복호화 과정 오류");
            throw new ServletException(ex.getMessage(), ex);
        }
        
        // 인증 확인 후 이동
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if(check == 1){
        	out.println("<script>");
        	out.println("alert('인증완료');");
        	out.println("");
        	out.println("location.href='./Main.me?loginCheck=1';");
        	out.println("</script>");
        	out.close();
        	
        }else if(check == 0) {
        	out.println("<script>");
        	out.println("alert('비밀번호가 일치하지 않습니다.');");
        	out.println("location.href='./Main.me?loginCheck="+check+"';");
        	out.println("</script>");
        	out.close();
        	
        }else {
        	out.println("<script>");
        	out.println("alert('아이디가 존재하지 않습니다.');");
        	out.println("location.href='./Main.me?loginCheck="+check+"';");
        	out.println("</script>");
        	out.close();
        }
        
        // 이동정보 없음(script로 이동함)
        return null;
    }
	
	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        System.out.println("will decrypt : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }

    /**
     * 16진 문자열을 byte 배열로 변환한다.
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
}

