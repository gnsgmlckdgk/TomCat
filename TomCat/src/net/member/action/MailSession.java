package net.member.action;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/* SMTP서버와 관련된 정보를 지정 */
public class MailSession {

	public int sendMail(String email) throws MessagingException {
		
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");// 프로토콜 설정
		props.put("mail.smtp.host", "smtp.gmail.com");// gmail SMTP 서비스 주소(호스트)
		props.put("mail.smtp.port", "465");// gmail SMTP 서비스 포트 설정
		props.put("mail.smtp.starttls.enable","true");
		// gmail 인증용 Secure Socket Layer(SSL) 설정
		props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");// SMTP 인증을 설정
		 
		/**
		  * SMTP 인증이 필요한 경우 반드시 Properties 에 SMTP 인증을 사용한다고 설정하여야 한다.
		  * 그렇지 않으면 인증을 시도조차 하지 않는다.
		  * 그리고 Authenticator 클래스를 상속받은 SMTPAuthenticator 클래스를 생성한다.
		  * getPasswordAuthentication() 메소드만 override 하면 된다.
		  */
		 
		Authenticator auth = new SMTPAuthenticator();
		 
		Session mailSession = Session.getDefaultInstance(props, auth);
		
		MimeMessage message = new MimeMessage(mailSession);
		InternetAddress from = new InternetAddress("overtimearmy@gamil.com");		// 보내는 사람 이메일
		message.setFrom(from);
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));		// 받는사람 이메일
		message.setSubject("TomCat 회원가입 인증번호");		// 메일 제목
		
		int certificationNumber = (int)(Math.random() * 90000 + 10000);	// 인증번호
		String txt = "임시확인용\n나중에 내용바꿔야 함\n인증번호: " + certificationNumber;
		
		message.setContent(txt, "text/plain");		// 메일 내용
		message.setSentDate(new Date());
		
		Transport.send(message);
		
		return certificationNumber;
	}
}

/* 보내는 메일 인증 */
class SMTPAuthenticator extends Authenticator {
	 
    protected PasswordAuthentication getPasswordAuthentication() {
         String username = "overtimearmy@gmail.com"; // gmail 사용자;
         String password = "qhrtkgkwlak";  // 패스워드;	// 복사하지마
         return new PasswordAuthentication(username, password);
    }
}

