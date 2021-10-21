package _01_register.service.impl;

import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _00_init.util.GlobalService;
import _01_register.dao.MemberDao;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _05_shoppingCart.model.OrderBean;

@Service
public class MemberServiceImpl implements MemberService {
	private static Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);

	MemberDao memberDao;

//	SessionFactory factory;
	@Autowired
	public MemberServiceImpl(MemberDao memberDao) {
		this.memberDao = memberDao;
//		this.factory = factory;
	}

//	public MemberServiceImpl(MemberDao memberDao) {
//		this.memberDao = memberDao;
//		this.factory = HibernateUtils.getSessionFactory();
//	}
	@Transactional
	@Override
	public void save(MemberBean mb) {
		log.info("會員註冊功能之Service: 儲存會員資料");
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
		memberDao.save(mb);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null)  
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
	}

	@Transactional
	@Override
	public boolean existsById(String id) {
		log.info("會員註冊功能之Service: 檢查會員輸入的編號是否已被使用");
		boolean exist = false;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
		exist = memberDao.existsById(id);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null)  
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
		return exist;
	}

	@Transactional
	@Override
	public MemberBean findByMemberId(String id) {
		log.info("會員註冊功能之Service: 由會員編號找出對應的會員");
		MemberBean mb = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
		mb = memberDao.findByMemberId(id);
//			tx.commit();
//		} catch (Exception ex) {
//			if (tx != null) 
//				tx.rollback();
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
		return mb;
	}

	/*
	 * 功能：檢查客戶的未付款訂購金額。 說明：處理客戶訂單時，[訂單的總金額 + 該客戶的未付款餘額]不能超過限額， 此限額定義在
	 * GlobalService類別的常數: ORDER_AMOUNT_LIMIT 步驟： 1. 取出 OrderBean 內的訂單的總金額 1.
	 * 取出Member表格內的 Member#unpaid_amount欄位(未付款餘額) 2.
	 * unpaid_amount加上本訂單的總金額後，檢查該數值是否超過限額 (GlobalService.ORDER_AMOUNT_LIMIT)。
	 * 如果超過限額， 則 該訂單不予處裡， 丟出UnpaidOrderAmountExceedingException，
	 * 否則呼叫memberDao#updateUnpaidAmount(ob)：執行更新Member表格的 unpaid_amount欄位:
	 * Member#unpaid_amount += currentAmount;
	 */
//	@Transactional
//	@Override
//	public void checkUnpaidAmount(OrderBean ob) {
//		log.info("處理訂單之Service: 由會員編號找出對應的會員，計算新的未付款餘額");
////		Session session = factory.getCurrentSession();
////		Transaction tx = null;
////		try {
////			tx = session.beginTransaction();
//			double currentAmount = ob.getTotalAmount(); // 取出該訂單的總金額
//			double unpaidAmount = findByMemberId(ob.getMemberId()).getUnpaid_amount();
//			if (currentAmount + unpaidAmount > GlobalService.ORDER_AMOUNT_LIMIT) {
//				log.info("處理訂單之Service: 未付款金額超過限額: " + (currentAmount + unpaidAmount));
//				throw new UnpaidOrderAmountExceedingException("未付款金額超過限額: " 
//							+ (currentAmount + unpaidAmount));
//			} 
//			log.info("處理訂單之Service: 未付款金額並未超過限額，立即呼叫memberDao更新會員的未付款餘額");
//			memberDao.updateUnpaidAmount(ob);
////			tx.commit();
////		} catch (Exception ex) {
////			if (tx != null)
////				tx.rollback();
////			ex.printStackTrace();
////			throw new RuntimeException(ex);
////		}
//	}
	@Transactional
	@Override
	public MemberBean findByMemberIdAndPassword(String memberId, String password) {

		MemberBean mb = null;

		mb = memberDao.findByMemberIdAndPassword(memberId, password);
		log.info("會員登入功能之Service: 檢查帳號/密碼結果:" + (mb != null ? "帳號/密碼正確" : "帳號/密碼錯誤"));

		return mb;
	}

	@Override
	public void checkUnpaidAmount(OrderBean ob) {
		// TODO Auto-generated method stub

	}

	@Transactional
	@Override
	public boolean sendEmail(String email) {
		boolean member = memberDao.existsEmail(email);
		try {
			if (member = true) {
				String token = UUID.randomUUID().toString().replace("-", "");
				MemberBean bean = memberDao.findByEmail(email);
				bean.setToken(token);

				String from = "R.E.Z.NewLife";// change accordingly //你想要顯示的寄件人名稱
				String username = "";// change accordingly //你的google帳號
				String password = "";// change accordingly //你的google密碼

				// Assuming you are sending email through relay.jangosmtp.net
				String host = "smtp.gmail.com";
				int port = 587;

				String to = email; // change accordingly //寄給誰

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
					message.setSubject("R.E.Z.NewLife忘記密碼認證"); // 信件標題

					// Now set the actual message
					message.setText("親愛的R.E.Z.NewLife會員您好:" + "\r\n" + "\r\n" + "以下是您的忘記密碼認證連結:" + "\r\n" + "\r\n"
							+ "http://localhost:8080/R.E.Z.NewLife/_01_register/getpwd?token=" + token); // 信件內容 + /r/n

					// Send message
					Transport.send(message);

					System.out.println("Sent message successfully....");

				} catch (Exception e) {
					throw new RuntimeException(e);

				}
			}
		} catch (Exception e) {
			return false;
		}
		return member;
	}

	@Transactional
	@Override
	public boolean updatepwd(String password, String token) {
		if (memberDao.updatepwd(GlobalService.getMD5Endocing(GlobalService.encryptString(password)), token)) {
			return true;
		} else {
			return false;
		}

	}
	@Transactional
	@Override
	public List<MemberBean> findByMember(String memberId) {
		List<MemberBean> list = null;
		list = memberDao.findByMember(memberId);
		return list;
	}
	@Transactional
	@Override
	public void update(MemberBean memberBean) {
		memberDao.update(memberBean);
		
	}
	
	 @Transactional
	 @Override
	 public MemberBean findById(int id) {
	  log.info("會員註冊功能之Service: 由會員編號找出對應的會員");
	  MemberBean mb = null;
	  mb = memberDao.findById(id);
	  return mb;
	 }
	

}
