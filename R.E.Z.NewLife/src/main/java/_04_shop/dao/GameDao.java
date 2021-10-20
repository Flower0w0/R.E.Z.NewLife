package _04_shop.dao;

import java.util.List;
import java.util.Map;

import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;

public interface GameDao {
	// 依Id來刪除單筆記錄
	void deleteById(int id);

	// 依Id來查詢單筆記錄
	NewProductBean findById(int id);
	
	List<String> getCategory();
	
	String getCategoryTag(String selected);
	
	Map<Integer, NewProductBean> getPageGames(int pageNo);

	long getRecordCounts();

	int getTotalPages();
	
	// 新增一筆記錄
	void save(NewProductBean bean);
	
	void updateGame(NewProductBean bean, long sizeInBytes) ;
	
    //新遊戲所有產品
	List<NewProductBean> getAllProducts();

	public NewProductBean getProductById(int id);
    
	//新遊戲ns遊戲
	List<NewProductBean> getNintendoProduct();
	//新遊戲ps遊戲
	List<NewProductBean> getSonyProduct();

	Map<Integer, NewProductBean> getNintendoPageGames(int pageNo);

	Map<Integer, NewProductBean> getSonyPageGames(int pageNo);

	int getNTotalPages();

	int getSTotalPages();

	long getNRecordCounts();

	long getSRecordCounts();
	
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