package _05_shoppingCart.service.Impl;

import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _04_shop.dao.GameDao;
import _05_shoppingCart.dao.OrderDao;
import _05_shoppingCart.dao.OrderItemDao;
import _05_shoppingCart.model.OrderBean;
import _05_shoppingCart.model.OrderItemBean;
import _05_shoppingCart.model.ShoppingCart;
import _05_shoppingCart.service.OrderService;
import _05_shoppingCart.ude.ProductStockException;
@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	private static Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	private GameDao gameDao;
	private OrderItemDao orderItemDao;
	private OrderDao orderDao;


	@Autowired
	public OrderServiceImpl(GameDao gameDao, OrderItemDao orderItemDao, OrderDao orderDao) {
		this.gameDao = gameDao;
		this.orderItemDao = orderItemDao;
		this.orderDao = orderDao;

	}

	@Override
	// 這是一個交易
	public void persistOrder(OrderBean ob) {

			log.info("處理訂單之Service:交易開始");


			
			log.info("處理訂單之Service: 2. 準備再次檢查並調整每項商品的庫存量");
			// 檢查所有訂單明細所訂購之商品的庫存數量是否足夠
			checkStock(ob);		
			// 儲存訂單
			log.info("處理訂單之Service: 3. 準備儲存訂單");
			orderDao.save(ob);
	}

	@Override
	public void checkStock(OrderBean ob) {
		Set<OrderItemBean> items = ob.getOrderItemBeans();
		
		log.info("處理訂單之Service: 2. 準備再次檢查並調整每項商品的庫存量");
		for (OrderItemBean oib : items) {
			if(oib.getNewProductId() != null) {
				int stock = gameDao.findById(oib.getNewProductId()).getStock(); 
				log.info("處理訂單之Service: 2. 準備再次檢查並調整每項商品的庫存量, 商品編號: " + oib.getNewProductId());
				if (stock < oib.getCount()) {
					log.info("處理訂單之Service: 2. 準備再次檢查並調整每項商品的庫存量, 商品編號: " + oib.getNewProductId() + " 庫存不足");
					throw new ProductStockException(
							  " " + oib.getNewProductName() + " 庫存量為 " + stock + "筆");
				} else {
					log.info("處理訂單之Service: 2. 準備再次檢查並調整每項商品的庫存量, 商品編號: " + oib.getNewProductId() + " 庫存足夠");
					orderItemDao.updateProductStock(oib);
				}
			
			} else {
				int stock1 = gameDao.findById(oib.getOldProductId()).getStock();
				log.info("處理訂單之Service: 2. 準備再次檢查並調整每項商品的庫存量, 商品編號: " + oib.getOldProductId());
				if (stock1 < oib.getCount()) {
					log.info("處理訂單之Service: 2. 準備再次檢查並調整每項商品的庫存量, 商品編號: " + oib.getOldProductId() + " 庫存不足");
					throw new ProductStockException(
							 " " + oib.getOldProductName() + " 庫存量為 " + stock1 + "筆");
				} else {
					log.info("處理訂單之Service: 2. 準備再次檢查並調整每項商品的庫存量, 商品編號: " + oib.getOldProductId() + " 庫存足夠");
					orderItemDao.updateProductStock(oib);			
				}			
			}	
		}
	}
	
	@Override
	public void preCheckStock(ShoppingCart shoppingCart) {
		log.info("訂單前期檢查之Service, 開始"); 
		Set<Integer> set = shoppingCart.getContent().keySet();
		
//		Session session = factory.getCurrentSession();
//        Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
		for (Integer i : set) {
		    OrderItemBean oib = shoppingCart.getContent().get(i);
		    int stock = gameDao.findById(oib.getId()).getStock();
		    String name = gameDao.findById(oib.getNewProductId()).getName();
		    String oname = gameDao.findOldById(oib.getOldProductId()).getName();
		    if (stock < oib.getCount()) {
		     log.info("訂單前期檢查之Service preCheckStock(): 庫存數量不足, " +
		     name + ", 在庫量: " + stock+ ", 訂購量: " + oib.getCount() + 
		     oname + ", 在庫量: " + stock+ ", 訂購量: " + oib.getCount());
		     throw new ProductStockException("庫存數量不足: 商品: " +
		    		 name + ", 在庫量: " + stock+ ", 訂購量: " + oib.getCount() + 
		    		 oname + ", 在庫量: " + stock+ ", 訂購量: " + oib.getCount());
		    } 
		   }
		   log.info("訂單前期檢查之Service preCheckStock(): 未發現任何商品數量不足");
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null)  tx.rollback();
//            log.info("發生異常，交易回滾.....,原因: " + e.getMessage());
//            throw new RuntimeException(e);
//		}
	}

	@Override
	public OrderBean findById(int id) {
		log.info("依照orderNo編號讀取特定一筆訂單的所有資料之Service, id=" + id);
		OrderBean  bean = null;
//        Session session = factory.getCurrentSession();
//        Transaction tx = null;
//        try {
//            tx = session.beginTransaction();
            bean = orderDao.findById(id);
//            tx.commit();
//        } catch (Exception e) {
//            if (tx != null) tx.rollback();
//            throw new RuntimeException(e);
//        } 
		return bean;
	}

	@Override
	public List<OrderBean> findByMember_Id(int member_Id) {
		log.info("依照memberId編號讀取某位會員所有訂單之Service: memberId=" + member_Id);
//		Session session = factory.getCurrentSession();
		List<OrderBean> list = null;
//        Transaction tx = null;
//        try {
//            tx = session.beginTransaction();
            list = orderDao.findByMember_Id(member_Id);
//            tx.commit();
//        } catch (Exception e) {
//            if (tx != null) tx.rollback();
//            throw new RuntimeException(e);
//        } 
        return list;
		
	}
	
	@Override
	public List<OrderItemBean> findByOiId(int id) {
		List<OrderItemBean> list = null;
            list = orderItemDao.findByOiId(id); 
        return list;
	}

}
