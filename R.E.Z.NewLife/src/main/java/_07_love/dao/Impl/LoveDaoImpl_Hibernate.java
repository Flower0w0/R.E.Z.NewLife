package _07_love.dao.Impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _07_love.dao.LoveDao;
import _07_love.model.LoveBean;

// 本類別
//   1.新增一筆訂單到orders表格
//   2.查詢orders表格內的單筆訂單
//   3.查詢orders表格內的所有訂單
@Repository
public class LoveDaoImpl_Hibernate implements LoveDao {

	private static Logger log = LoggerFactory.getLogger(LoveDaoImpl_Hibernate.class);

	SessionFactory factory;
//	int orderNo = 0;

	@Autowired
	public LoveDaoImpl_Hibernate(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public void save(LoveBean loveBean) {
		log.info("儲存訂單(LoveDaoImpl)之Dao: ");
		Session session = factory.getCurrentSession();
		session.save(loveBean);
	}

	

	@Override
	public LoveBean findById(int id) {
		log.info("依照id編號讀取特定一筆訂單的所有資料之Dao, id=" + id);
		LoveBean lvb = null;
		Session session = factory.getCurrentSession();
		lvb = session.get(LoveBean.class, id);
		return lvb;
	}

	@Override
	public List<LoveBean> findByMember_Id(int member_Id) {
		log.info("讀取某位會員所有訂單之Dao: 開始");
		List<LoveBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM LoveBean l WHERE l.member_id = :mid";
		list = session.createQuery(hql, LoveBean.class)
					  .setParameter("mid", member_Id)
					  .getResultList();
		log.info("讀取某位會員所有訂單之Dao: 讀取完畢");
		return list;
	}
	
	@Override
	public List<LoveBean> findByM_IdAndN_Id(int member_Id, int newproduct_Id) {
		log.info("讀取某位會員收藏之Dao: 開始");
		List<LoveBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM LoveBean l WHERE l.member_id = :mid AND l.newproduct_id = :nid";
		list = session.createQuery(hql, LoveBean.class)
					  .setParameter("mid", member_Id)
					  .setParameter("nid", newproduct_Id)
					  .getResultList();
		log.info("讀取某位會員所有訂單之Dao: 讀取完畢");
		return list;
	}
	
	@Override
	public List<LoveBean> findByM_IdAndO_Id(int member_Id, int oldproduct_Id) {
		log.info("讀取某位會員收藏之Dao: 開始");
		List<LoveBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM LoveBean l WHERE l.member_id = :mid AND l.oldproduct_id = :oid";
		list = session.createQuery(hql, LoveBean.class)
					  .setParameter("mid", member_Id)
					  .setParameter("oid", oldproduct_Id)
					  .getResultList();
		log.info("讀取某位會員所有訂單之Dao: 讀取完畢");
		return list;
	}
	
	@Override
	public void delete(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LoveBean WHERE id = :id";
		LoveBean lb = session.createQuery(hql, LoveBean.class).setParameter("id", id).getSingleResult();
		session.delete(lb);
	}
	

	public void setConnection(Connection con) {
		throw new RuntimeException("OrderDaoImpl_Hibernate類別不用實作此方法");
	}

}