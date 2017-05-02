package net.member.action;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* 비밀번호 변경 페이지 가기전 RSA암호화 공개키, 개인키 셋팅 */
public class MemberPassUpdateKeySetting implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(2048);

		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");

		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();

		HttpSession session = request.getSession();
		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);

		// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		request.setAttribute("updatePass_publicKeyModulus", publicKeyModulus);
		request.setAttribute("updatePass_publicKeyExponent", publicKeyExponent);

		ActionForward forward = new ActionForward();
		forward.setPath("./member/memberPassUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
