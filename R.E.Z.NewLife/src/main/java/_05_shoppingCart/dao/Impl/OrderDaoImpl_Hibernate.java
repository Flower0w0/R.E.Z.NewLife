package _05_shoppingCart.dao.Impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _05_shoppingCart.dao.OrderDao;
import _05_shoppingCart.model.OrderBean;

// 本類別
//   1.新增一筆訂單到orders表格
//   2.查詢orders表格內的單筆訂單
//   3.查詢orders表格內的所有訂單
@Repository
public class OrderDaoImpl_Hibernate implements OrderDao {

	private static Logger log = LoggerFactory.getLogger(OrderDaoImpl_Hibernate.class);

	SessionFactory factory;
//	int orderNo = 0;

	@Autowired
	public OrderDaoImpl_Hibernate(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public void save(OrderBean orderBean) {
		log.info("儲存訂單(OrderDaoImpl)之Dao: ");
		Session session = factory.getCurrentSession();
		session.save(orderBean);
	}

	

	@Override
	public OrderBean findById(int id) {
		log.info("依照id編號讀取特定一筆訂單的所有資料之Dao, id=" + id);
		OrderBean ob = null;
		Session session = factory.getCurrentSession();
		ob = session.get(OrderBean.class, id);
		return ob;
	}

	@Override
	public List<OrderBean> findByMember_Id(int member_Id) {
		log.info("讀取某位會員所有訂單之Dao: 開始");
		List<OrderBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean ob WHERE ob.member_id = :mid";
		list = session.createQuery(hql, OrderBean.class)
					  .setParameter("mid", member_Id)
					  .getResultList();
		log.info("讀取某位會員所有訂單之Dao: 讀取完畢");
		return list;
	}

	public void setConnection(Connection con) {
		throw new RuntimeException("OrderDaoImpl_Hibernate類別不用實作此方法");
	}

}