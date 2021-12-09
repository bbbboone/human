package util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/sendMail")
public class MailSend extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String code = randomCode();
		
		System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
		Properties props = System.getProperties();
//		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		// 세션 및 메세지 객체 생성
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				//변수를 받아와서 새팅하는 방법 확인 
				String name = "moly282828@gmail.com";
				String pw = "human28@";
				return new PasswordAuthentication(name, pw);
			}
			
		});
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setFrom(new InternetAddress("moly282828@gmail.com", "BOW"));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 회원 이메일
			msg.setSubject("인증 번호 확인"); //
			msg.setText(code, "utf-8"); //
			
			Transport.send(msg);
			resp.getWriter().print(code);
			System.out.println("이메일 발송 완료");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("이메일 확인 불가");
		}
	}
	
	public String randomCode() {
		String str = "";		
		for(int i = 1 ; i <= 6 ; i++) {
			str += (int)(Math.random() * 10) + "";
		}
		return str;
	}

//	public static void main(String[] args) throws Exception{
//		MailSend mailSend = new MailSend();
//		mailSend.sendMail("title",randomCode(),"bbbboone@naver.com"); // 비밀번호 받이메일 , 제목, 내용
//	}

}