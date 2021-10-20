package _04_shop.dao.Impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _00_init.util.GlobalService;
import _04_shop.dao.GameDao;
import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;

// 本類別使用Hibernate的技術來存取資料庫。
@Repository
public class GameDaoImpl_Hibernate implements Serializable, GameDao {

	private static final long serialVersionUID = 1L;

	private static Logger log = LoggerFactory.getLogger(GameDaoImpl_Hibernate.class);

	public static final int recordsPerPage = GlobalService.RECORDS_PER_PAGE; // 預設值：每頁三筆
	private int totalPages = -1;
	
	SessionFactory factory;
	
	
    @Autowired
	public GameDaoImpl_Hibernate(SessionFactory factory) {
		this.factory = factory;
	}

	// 計算販售的商品總共有幾頁
	@Override
	public int getTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		log.info("totalPages=" + totalPages);
		return totalPages;
	}
	
	@Override
	public int getOldTotalPages() {
		// 注意下一列敘述的每一個型態轉換
				totalPages = (int) (Math.ceil(getOldRecordCounts() / (double) recordsPerPage));
				log.info("totalPages=" + totalPages);
				return totalPages;
	}

	@Override
	public int getNTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getNRecordCounts() / (double) recordsPerPage));
		log.info("totalPages=" + totalPages);
		return totalPages;
	}

	@Override
	public int getSTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getSRecordCounts() / (double) recordsPerPage));
		log.info("totalPages=" + totalPages);
		return totalPages;
	}
	
	@Override
	public int getOldNTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getOldNRecordCounts() / (double) recordsPerPage));
		log.info("totalPages=" + totalPages);
		return totalPages;
	}
	
	@Override
	public int getOldSTotalPages() {
		// 注意下一列敘述的每一個型態轉換
		totalPages = (int) (Math.ceil(getOldSRecordCounts() / (double) recordsPerPage));
		log.info("totalPages=" + totalPages);
		return totalPages;
	}
	// 查詢某一頁的商品(遊戲片)資料，執行本方法前，一定要先設定實例變數pageNo的初值
	@Override
	public Map<Integer, NewProductBean> getPageGames(int pageNo) {

		log.info("新增遊戲片之顯示遊戲片功能之Dao，讀取一頁商品資料之 pageNo=" + pageNo);

		Map<Integer, NewProductBean> map = new LinkedHashMap<>();
		List<NewProductBean> list = new ArrayList<NewProductBean>();
		String hql = "FROM NewProductBean";
		Session session = factory.getCurrentSession();

		int startRecordNo = (pageNo - 1) * recordsPerPage;

		list = session.createQuery(hql, NewProductBean.class)
					  .setFirstResult(startRecordNo)
					  .setMaxResults(recordsPerPage)
					  .getResultList();
		
		for (NewProductBean bean : list) {
			map.put(bean.getId(), bean);
		}
		
		log.info("新增遊戲片之顯示遊戲片功能之Dao，存放商品資料之map=" + map);
		return map;
	}
	
	@Override
	public Map<Integer, OldProductBean> getOldPageGames(int pageNo) {

		log.info("新增遊戲片之顯示遊戲片功能之Dao，讀取一頁商品資料之 pageNo=" + pageNo);

		Map<Integer, OldProductBean> map = new LinkedHashMap<>();
		List<OldProductBean> list = new ArrayList<OldProductBean>();
		String hql = "FROM OldProductBean";
		Session session = factory.getCurrentSession();

		int startRecordNo = (pageNo - 1) * recordsPerPage;

		list = session.createQuery(hql, OldProductBean.class)
					  .setFirstResult(startRecordNo)
					  .setMaxResults(recordsPerPage)
					  .getResultList();
		
		for (OldProductBean bean : list) {
			map.put(bean.getId(), bean);
		}
		
		log.info("新增遊戲片之顯示遊戲片功能之Dao，存放商品資料之map=" + map);
		return map;
	}
	
	@Override
	public Map<Integer, OldProductBean> getOldNintendoPageGames(int NpageNo) {

		log.info("新增遊戲片之顯示遊戲片功能之Dao，讀取一頁商品資料之 pageNo=" + NpageNo);

		Map<Integer, OldProductBean> map = new LinkedHashMap<>();
		List<OldProductBean> list = new ArrayList<OldProductBean>();
		String hql = "FROM OldProductBean WHERE brand = 'Nintendo(任天堂)'";
		Session session = factory.getCurrentSession();

		int startRecordNo = (NpageNo - 1) * recordsPerPage;

		list = session.createQuery(hql, OldProductBean.class)
					  .setFirstResult(startRecordNo)
					  .setMaxResults(recordsPerPage)
					  .getResultList();
		
		for (OldProductBean bean : list) {
			map.put(bean.getId(), bean);
		}
		
		log.info("新增遊戲片之顯示遊戲片功能之Dao，存放商品資料之map=" + map);
		return map;
	}
	
	@Override
	public Map<Integer, NewProductBean> getNintendoPageGames(int NpageNo) {

		log.info("新增遊戲片之顯示遊戲片功能之Dao，讀取一頁商品資料之 pageNo=" + NpageNo);

		Map<Integer, NewProductBean> map = new LinkedHashMap<>();
		List<NewProductBean> list = new ArrayList<NewProductBean>();
		String hql = "FROM NewProductBean WHERE brand = 'Nintendo(任天堂)'";
		Session session = factory.getCurrentSession();

		int startRecordNo = (NpageNo - 1) * recordsPerPage;

		list = session.createQuery(hql, NewProductBean.class)
					  .setFirstResult(startRecordNo)
					  .setMaxResults(recordsPerPage)
					  .getResultList();
		
		for (NewProductBean bean : list) {
			map.put(bean.getId(), bean);
		}
		
		log.info("新增遊戲片之顯示遊戲片功能之Dao，存放商品資料之map=" + map);
		return map;
	}
	
	@Override
	public Map<Integer, OldProductBean> getOldSonyPageGames(int SpageNo) {

		log.info("新增遊戲片之顯示遊戲片功能之Dao，讀取一頁商品資料之 pageNo=" + SpageNo);

		Map<Integer, OldProductBean> map = new LinkedHashMap<>();
		List<OldProductBean> list = new ArrayList<OldProductBean>();
		String hql = "FROM OldProductBean WHERE brand = 'SONY(索尼)'";
		Session session = factory.getCurrentSession();

		int startRecordNo = (SpageNo - 1) * recordsPerPage;

		list = session.createQuery(hql, OldProductBean.class)
					  .setFirstResult(startRecordNo)
					  .setMaxResults(recordsPerPage)
					  .getResultList();
		
		for (OldProductBean bean : list) {
			map.put(bean.getId(), bean);
		}
		
		log.info("新增遊戲片之顯示遊戲片功能之Dao，存放商品資料之map=" + map);
		return map;
	}
	
	@Override
	public Map<Integer, NewProductBean> getSonyPageGames(int SpageNo) {

		log.info("新增遊戲片之顯示遊戲片功能之Dao，讀取一頁商品資料之 pageNo=" + SpageNo);

		Map<Integer, NewProductBean> map = new LinkedHashMap<>();
		List<NewProductBean> list = new ArrayList<NewProductBean>();
		String hql = "FROM NewProductBean WHERE brand = 'SONY(索尼)'";
		Session session = factory.getCurrentSession();

		int startRecordNo = (SpageNo - 1) * recordsPerPage;

		list = session.createQuery(hql, NewProductBean.class)
					  .setFirstResult(startRecordNo)
					  .setMaxResults(recordsPerPage)
					  .getResultList();
		
		for (NewProductBean bean : list) {
			map.put(bean.getId(), bean);
		}
		
		log.info("新增遊戲片之顯示遊戲片功能之Dao，存放商品資料之map=" + map);
		return map;
	}

	@Override
	public long getNRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM NewProductBean WHERE brand = 'Nintendo(任天堂)'";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql, Long.class)
				                 .getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		log.info("RecordCounts=" + count);
		return count;
	}
	
	@Override
	public long getOldNRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM OldProductBean WHERE brand = 'Nintendo(任天堂)'";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql, Long.class)
				                 .getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		log.info("RecordCounts=" + count);
		return count;
	}

	@Override
	public long getSRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM NewProductBean WHERE brand = 'SONY(索尼)'";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql, Long.class)
				                 .getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		log.info("RecordCounts=" + count);
		return count;
	}
	
	@Override
	public long getOldSRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM OldProductBean WHERE brand = 'SONY(索尼)'";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql, Long.class)
				                 .getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		log.info("RecordCounts=" + count);
		return count;
	}
	@Override
	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM NewProductBean";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql, Long.class)
				                 .getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		log.info("RecordCounts=" + count);
		return count;
	}
	
	@Override
	public long getOldRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM OldProductBean";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql, Long.class)
				                 .getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		log.info("RecordCounts=" + count);
		return count;
	}

	@Override
	public List<String> getCategory() {
		String hql = "SELECT DISTINCT category FROM NewProductBean";
		Session session = factory.getCurrentSession();
		List<String> list = null;
		list = session.createQuery(hql, String.class)
				      .getResultList();
		log.info("list=" + list);
		return list;
	}

	@Override
	public String getCategoryTag(String selected) {
		String ans = "";
		List<String> list = getCategory();
		ans += "<SELECT name='category'>";
		for (String cate : list) {
			if (cate.equals(selected)) {
				ans += "<option value='" + cate 
					   + "' selected>" + cate + "</option>";
			} else {
				ans += "<option value='" + cate + "'>" 
			           + cate + "</option>";
			}
		}
		ans += "</SELECT>";
		log.info("ans=" + ans);
		return ans;
	}

	// 修改一筆遊戲片資料
	@Override
	public void updateGame(NewProductBean bean, long sizeInBytes) {
		Session session = factory.getCurrentSession();	
		if (sizeInBytes == -1) { // 不修改圖片
			updateGame(bean, sizeInBytes);
			return;
		}
		session.saveOrUpdate(bean);
	}
	
	// 修改一筆遊戲片資料
		@Override
		public void updateOldGame(OldProductBean bean, long sizeInBytes) {
			Session session = factory.getCurrentSession();	
			if (sizeInBytes == -1) { // 不修改圖片
				updateOldGame(bean, sizeInBytes);
				return;
			}
			session.saveOrUpdate(bean);
		}

	// 修改一筆遊戲片資料，不改圖片
	public void updateGame(NewProductBean bean) {
		Session session = factory.getCurrentSession();
		NewProductBean b0 = null;
		b0 = session.get(NewProductBean.class, bean.getId());
		bean.setStock(b0.getStock());
		bean.setPrice(b0.getPrice());
		bean.setPicture(b0.getPicture());
		bean.setFileName(b0.getFileName());
		session.evict(b0);
		session.saveOrUpdate(bean);
		return;
	}
	
	// 修改一筆遊戲片資料，不改圖片
		public void updateOldGame(OldProductBean bean) {
			Session session = factory.getCurrentSession();
			OldProductBean b0 = null;
			b0 = session.get(OldProductBean.class, bean.getId());
			bean.setStock(b0.getStock());
			bean.setPrice(b0.getPrice());
			bean.setPicture(b0.getPicture());
			bean.setFileName(b0.getFileName());
			session.evict(b0);
			session.saveOrUpdate(bean);
			return;
		}

	// 依id來刪除單筆記錄
	@Override
	public void deleteById(int id) {
		log.info("刪除遊戲片功能之Dao, 遊戲片主鍵值：" + id);
		Session session = factory.getCurrentSession();
		NewProductBean bb = new NewProductBean();
		bb.setId(id);
		session.delete(bb);
	}
	
	// 依id來刪除單筆記錄
		@Override
		public void deleteOldById(int id) {
			log.info("刪除遊戲片功能之Dao, 遊戲片主鍵值：" + id);
			Session session = factory.getCurrentSession();
			OldProductBean bb = new OldProductBean();
			bb.setId(id);
			session.delete(bb);
		}

	// 新增一筆記錄---
	@Override
	public void save(NewProductBean bean) {
		Session session = factory.getCurrentSession();
		session.save(bean);
		log.info("維護遊戲片資料功能之Dao: 資料新增成功, NewProductBean=" + bean);
		
	}
	
	// 新增一筆記錄---
		@Override
		public void oldSave(OldProductBean bean) {
			Session session = factory.getCurrentSession();
			session.save(bean);
			log.info("維護遊戲片資料功能之Dao: 資料新增成功, NewProductBean=" + bean);
			
		}

	@Override
	public NewProductBean findById(int id) {
		NewProductBean bean = null;
		Session session = factory.getCurrentSession();
		bean = session.get(NewProductBean.class, id);
		log.info("更新遊戲片之前置作業之Dao, 遊戲片主鍵值：" + id + ", bean=" + bean);
		return bean;
	}
	
	@Override
	public OldProductBean findOldById(int id) {
		OldProductBean bean = null;
		Session session = factory.getCurrentSession();
		bean = session.get(OldProductBean.class, id);
		log.info("更新遊戲片之前置作業之Dao, 遊戲片主鍵值：" + id + ", bean=" + bean);
		return bean;
	}

	@Override
	public List<NewProductBean> getAllProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM NewProductBean";
		return session.createQuery(hql, NewProductBean.class).getResultList();
	}
	
	@Override
	public List<OldProductBean> getOldAllProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM OldProductBean";
		return session.createQuery(hql, OldProductBean.class).getResultList();
	}

	@Override
	public NewProductBean getProductById(int id) {
		Session session = factory.getCurrentSession();
		NewProductBean npb = session.get(NewProductBean.class, id);
//		if (npb == null) {
//			throw new ProductNotFoundException("產品編號：" + id + "找不到" + id);
//		}
		return npb;
	}  
	
	@Override
	public OldProductBean getOldProductById(int id) {
		Session session = factory.getCurrentSession();
		OldProductBean opb = session.get(OldProductBean.class, id);
//		if (npb == null) {
//			throw new ProductNotFoundException("產品編號：" + id + "找不到" + id);
//		}
		return opb;
	} 
	
	@Override
	public List<NewProductBean> getNintendoProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM NewProductBean WHERE brand = 'Nintendo(任天堂)'";
		return session.createQuery(hql, NewProductBean.class).getResultList();
	}  
	
	@Override
	public List<OldProductBean> getOldNintendoProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM OldProductBean WHERE brand = 'Nintendo(任天堂)'";
		return session.createQuery(hql, OldProductBean.class).getResultList();
	} 
	
	
	@Override
	public List<NewProductBean> getSonyProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM NewProductBean WHERE brand = 'SONY(索尼)'";
		return session.createQuery(hql, NewProductBean.class).getResultList();
	}  
	
	@Override
	public List<OldProductBean> getOldSonyProduct() {
		Session session = factory.getCurrentSession();
		String hql = "FROM OldProductBean WHERE brand = 'SONY(索尼)'";
		return session.createQuery(hql, OldProductBean.class).getResultList();
	}

	@Override
	 public Map<Integer, NewProductBean> findByNewProductName(String productName) {
	  
	  Session session = factory.getCurrentSession();
	  List<NewProductBean> List = new ArrayList<NewProductBean>();
	  String nativeString = "%" + productName + "%";
	  
	  String hql = "FROM NewProductBean n WHERE n.name LIKE :productName";
	  List = session.createQuery(hql, NewProductBean.class)
			  			 .setParameter("productName", nativeString)
			  			 .getResultList();
	  Map<Integer, NewProductBean> map = new LinkedHashMap<>();
	  for (NewProductBean bean : List) {
			map.put(bean.getId(), bean);
		}

		return map;  
	 }
	
	@Override
	 public Map<Integer, OldProductBean> findByOldProductName(String productName) {
	  
	  Session session = factory.getCurrentSession();
	  List<OldProductBean> List = new ArrayList<OldProductBean>();
	  String nativeString = "%" + productName + "%";
	  
	  String hql = "FROM OldProductBean o WHERE o.name LIKE :productName";
	  List = session.createQuery(hql, OldProductBean.class)
			  		.setParameter("productName", nativeString)
			  		.getResultList();
	  Map<Integer, OldProductBean> map = new LinkedHashMap<>();
	  for (OldProductBean bean : List) {
			map.put(bean.getId(), bean);
		}

		return map;
	 }
	
}