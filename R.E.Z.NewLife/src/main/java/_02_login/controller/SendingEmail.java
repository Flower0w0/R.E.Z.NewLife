package _02_login.controller;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
//import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendingEmail {
	public static void main(String[] args) {
		// Sender's email ID needs to be mentioned
		String from = "R.E.Z.NewLife";// change accordingly //不確定要幹嘛 //你想要顯示的寄件人名稱
		String username = "r.e.z.newlife.r.e.z@gmail.com";// change accordingly //你的google帳號
		String password = "reznewlife";// change accordingly //你的google密碼

		// Assuming you are sending email through relay.jangosmtp.net
		String host = "smtp.gmail.com";
		int port = 587;

		String to = "wendylinforwork@gmail.com";// change accordingly //寄給誰

		// 必要的寄信屬性設定
		Properties props = new Properties();
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);

		// Get the Session object.
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		// 要不要顯示debug訊息
		session.setDebug(true);

		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field of the header.
			// 1.
			message.setFrom(new InternetAddress(username, from));
			// 2. (要自定義寄件人的名稱用這個方法、要丟出例外)
			// message.setFrom(new InternetAddress(username, "你想要顯示的寄件人名稱"));

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

			// Set Subject: header field
			message.setSubject("R.E.Z.NewLife忘記密碼認證"); //信件標題

			String token = UUID.randomUUID().toString().replace("-", "");
			// Now set the actual message
			message.setText("親愛的R.E.Z.NewLife會員您好:" + "\r\n" + "\r\n" +
					"以下是您的忘記密碼認證連結:" + "\r\n" + "\r\n" +
					"http://localhost:8080/R.E.Z.NewLife/?token=" + token); //信件內容 + /r/n

			// Send message
			Transport.send(message);

			System.out.println("Sent message successfully....");

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}