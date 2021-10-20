package _04_shop.service;

import java.util.List;
import java.util.Map;

import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;

public interface GameService {
	public List<NewProductBean> getAllProducts();
	
	// 依id來刪除單筆記錄
	void deleteById(int id);
	
	// 依id來查詢單筆記錄
	NewProductBean findById(int id);

	String getCategoryTag(String selected);
	// 依照頁碼來讀取一頁的商品資料
	Map<Integer, NewProductBean> getPageGames(int pageNo);
	// 讀取的商品總數量
	long getRecordCounts();
	// 讀取的商品總頁數
	int getTotalPages();
	
	// 新增一筆記錄
	void save(NewProductBean bean);

	// 更新商品資料
	void updateGame(NewProductBean bean, long sizeInBytes) ;

	// 取出所有的類型
	List<String> findAllCategories();

	public NewProductBean getProductById(int id);

	List<NewProductBean> getNintendoProduct();

	List<NewProductBean> getSonyProduct();

	Map<Integer, NewProductBean> getNintendoPageGames(int pageNo);

	Map<Integer, NewProductBean> getSonyPageGames(int pageNo);

	long getNRecordCounts();

	long getSRecordCounts();

	int getNTotalPages();

	int getSTotalPages();
	
	//舊遊戲所有產品
	
		// 依Id來刪除單筆記錄
			void deleteOldById(int id);

			// 依Id來查詢單筆記錄
			OldProductBean findOldById(int id);
			
			// 新增一筆記錄
			void oldSave(OldProductBean bean);
			
			List<OldProductBean> getOldAllProducts();

			public OldProductBean getOldProductById(int id);
		    
			//舊遊戲ns遊戲
			List<OldProductBean> getOldNintendoProduct();
			//舊遊戲ps遊戲
			List<OldProductBean> getOldSonyProduct();
			
			Map<Integer, OldProductBean> getOldPageGames(int pageNo);

			Map<Integer, OldProductBean> getOldNintendoPageGames(int pageNo);

			Map<Integer, OldProductBean> getOldSonyPageGames(int pageNo);
			
			void updateOldGame(OldProductBean bean, long sizeInBytes) ;
			
			int getOldTotalPages();

			int getOldNTotalPages();

			int getOldSTotalPages();

			long getOldNRecordCounts();

			long getOldSRecordCounts();
			
			long getOldRecordCounts();

			Map<Integer, NewProductBean> findByNewProductName(String productName);

			Map<Integer, OldProductBean> findByOldProductName(String productName);

}
