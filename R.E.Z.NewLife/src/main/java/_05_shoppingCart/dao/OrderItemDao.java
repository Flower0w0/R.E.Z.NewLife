package _05_shoppingCart.dao;

import java.sql.Connection;
import java.util.List;

import _05_shoppingCart.model.OrderItemBean;

public interface OrderItemDao {
	
	double findItemAmount(OrderItemBean oib);

	void updateProductStock(OrderItemBean ob);
	
	void setConnection(Connection conn);

	List<OrderItemBean> findByOiId(int id);


}
