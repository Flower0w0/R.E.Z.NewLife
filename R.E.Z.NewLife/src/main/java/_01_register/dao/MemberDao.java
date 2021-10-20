package _01_register.dao;

import java.sql.Connection;
import java.util.List;

import _01_register.model.MemberBean;
import _05_shoppingCart.model.OrderBean;


public interface MemberDao {
	
	boolean existsById(String id);

	void save(MemberBean mb) ;
	
	MemberBean findByMemberId(String id);
	
	MemberBean findByMemberIdAndPassword(String memberId, String password);	
	
	void updateUnpaidAmount(OrderBean ob);

	void setConnection(Connection con);

	boolean existsEmail(String email);

	MemberBean findByEmail(String email);

	boolean updatepwd(String password, String token);

	List<MemberBean> findByMember(String memberId);

	void update(MemberBean memberBean);

	MemberBean findById(int id);
	
}