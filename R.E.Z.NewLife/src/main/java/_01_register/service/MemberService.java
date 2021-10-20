package _01_register.service;

import java.util.List;

import _01_register.model.MemberBean;
import _05_shoppingCart.model.OrderBean;

public interface MemberService {
	boolean existsById(String id);
	
	void save(MemberBean mb);
	
	void checkUnpaidAmount(OrderBean ob);
	
	MemberBean findByMemberId(String id);
	
	MemberBean findByMemberIdAndPassword(String memberId, String password) ;

	boolean sendEmail(String email);

	boolean updatepwd(String password, String token);
	
	List<MemberBean> findByMember(String memberId);
	
	void update(MemberBean memberBean);

	MemberBean findById(int id);
}
