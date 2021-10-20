package _05_shoppingCart.dao;

import java.sql.Connection;
import java.util.List;

import _05_shoppingCart.model.OrderBean;

public interface OrderDao {

	void save(OrderBean ob);

	OrderBean findById(int id);

	List<OrderBean> findByMember_Id(int member_Id);

	void setConnection(Connection con);
}