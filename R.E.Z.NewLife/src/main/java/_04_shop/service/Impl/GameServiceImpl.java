package _04_shop.service.Impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _04_shop.dao.GameDao;
import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;
import _04_shop.service.GameService;

@Service
public class GameServiceImpl implements GameService {

	private static Logger log = LoggerFactory.getLogger(GameServiceImpl.class);

	GameDao gameDao;

	@Autowired
	public GameServiceImpl(GameDao gameDao) {
		this.gameDao = gameDao;
	}

	@Transactional
	@Override
	public int getTotalPages() {
		log.info("GameServiceImpl#getTotalPages");
		int n = 0;
		n = gameDao.getTotalPages();
		return n;
	}

	@Transactional
	@Override
	public int getOldTotalPages() {
		log.info("GameServiceImpl#getTotalPages");
		int n = 0;
		n = gameDao.getOldTotalPages();
		return n;
	}

	@Transactional
	@Override
	public int getNTotalPages() {
		log.info("GameServiceImpl#getTotalPages");
		int n = 0;
		n = gameDao.getNTotalPages();
		return n;
	}

	@Transactional
	@Override
	public int getOldNTotalPages() {
		log.info("GameServiceImpl#getTotalPages");
		int n = 0;
		n = gameDao.getOldNTotalPages();
		return n;
	}

	@Transactional
	@Override
	public int getSTotalPages() {
		log.info("GameServiceImpl#getTotalPages");
		int n = 0;
		n = gameDao.getSTotalPages();
		return n;
	}

	@Transactional
	@Override
	public int getOldSTotalPages() {
		log.info("GameServiceImpl#getTotalPages");
		int n = 0;
		n = gameDao.getOldSTotalPages();
		return n;
	}

	@Transactional
	@Override
	public Map<Integer, NewProductBean> getPageGames(int pageNo) {
		log.info("維護遊戲片資料之顯示遊戲片功能之Service，讀取一頁商品資料之 pageNo=" + pageNo);
		Map<Integer, NewProductBean> map = null;
		map = gameDao.getPageGames(pageNo);
		return map;
	}

	@Transactional
	@Override
	public Map<Integer, OldProductBean> getOldPageGames(int pageNo) {
		log.info("維護遊戲片資料之顯示遊戲片功能之Service，讀取一頁商品資料之 pageNo=" + pageNo);
		Map<Integer, OldProductBean> map = null;
		map = gameDao.getOldPageGames(pageNo);
		return map;
	}

	@Transactional
	@Override
	public Map<Integer, NewProductBean> getNintendoPageGames(int pageNo) {
		log.info("維護遊戲片資料之顯示遊戲片功能之Service，讀取一頁商品資料之 pageNo=" + pageNo);
		Map<Integer, NewProductBean> map = null;
		map = gameDao.getNintendoPageGames(pageNo);
		return map;
	}

	@Transactional
	@Override
	public Map<Integer, OldProductBean> getOldNintendoPageGames(int pageNo) {
		log.info("維護遊戲片資料之顯示遊戲片功能之Service，讀取一頁商品資料之 pageNo=" + pageNo);
		Map<Integer, OldProductBean> map = null;
		map = gameDao.getOldNintendoPageGames(pageNo);
		return map;
	}

	@Transactional
	@Override
	public Map<Integer, NewProductBean> getSonyPageGames(int pageNo) {
		log.info("維護遊戲片資料之顯示遊戲片功能之Service，讀取一頁商品資料之 pageNo=" + pageNo);
		Map<Integer, NewProductBean> map = null;
		map = gameDao.getSonyPageGames(pageNo);
		return map;
	}

	@Transactional
	@Override
	public Map<Integer, OldProductBean> getOldSonyPageGames(int pageNo) {
		log.info("維護遊戲片資料之顯示遊戲片功能之Service，讀取一頁商品資料之 pageNo=" + pageNo);
		Map<Integer, OldProductBean> map = null;
		map = gameDao.getOldSonyPageGames(pageNo);
		return map;
	}

	@Transactional
	@Override
	public long getRecordCounts() {
		log.info("GameServiceImpl#getRecordCounts");
		long count = 0; // 必須使用 long 型態
		count = gameDao.getRecordCounts();
		return count;
	}

	@Transactional
	@Override
	public long getOldRecordCounts() {
		log.info("GameServiceImpl#getRecordCounts");
		long count = 0; // 必須使用 long 型態
		count = gameDao.getOldRecordCounts();
		return count;
	}

	@Transactional
	@Override
	public long getNRecordCounts() {
		log.info("GameServiceImpl#getRecordCounts");
		long count = 0; // 必須使用 long 型態
		count = gameDao.getNRecordCounts();
		return count;
	}

	@Transactional
	@Override
	public long getOldNRecordCounts() {
		log.info("GameServiceImpl#getRecordCounts");
		long count = 0; // 必須使用 long 型態
		count = gameDao.getOldNRecordCounts();
		return count;
	}

	@Transactional
	@Override
	public long getSRecordCounts() {
		log.info("GameServiceImpl#getRecordCounts");
		long count = 0; // 必須使用 long 型態
		count = gameDao.getSRecordCounts();
		return count;
	}

	@Transactional
	@Override
	public long getOldSRecordCounts() {
		log.info("GameServiceImpl#getRecordCounts");
		long count = 0; // 必須使用 long 型態
		count = gameDao.getOldSRecordCounts();
		return count;
	}

	@Transactional
	@Override
	public NewProductBean findById(int id) {
		log.info("更新遊戲片資料之前置作業之Service, 遊戲片主鍵值：" + id);
		NewProductBean bean = null;
		bean = gameDao.findById(id);
		return bean;
	}

	@Transactional
	@Override
	public OldProductBean findOldById(int id) {
		log.info("更新遊戲片資料之前置作業之Service, 遊戲片主鍵值：" + id);
		OldProductBean bean = null;
		bean = gameDao.findOldById(id);
		return bean;
	}

	@Transactional
	@Override
	public void updateGame(NewProductBean bean, long sizeInBytes) {
		log.info("更新遊戲片資料之Service, bean=" + bean + ", sizeInBytes=" + sizeInBytes);
		gameDao.updateGame(bean, sizeInBytes);
	}

	@Transactional
	@Override
	public void updateOldGame(OldProductBean bean, long sizeInBytes) {
		log.info("更新遊戲片資料之Service, bean=" + bean + ", sizeInBytes=" + sizeInBytes);
		gameDao.updateOldGame(bean, sizeInBytes);
	}

	@Transactional
	@Override
	public void deleteById(int id) {
		log.info("刪除遊戲片功能之Service, 遊戲片主鍵值：" + id);
		gameDao.deleteById(id);
	}

	@Transactional
	@Override
	public void deleteOldById(int id) {
		log.info("刪除遊戲片功能之Service, 遊戲片主鍵值：" + id);
		gameDao.deleteOldById(id);
	}

	@Transactional
	@Override
	public void save(NewProductBean bean) {
		gameDao.save(bean);
		log.info("新增遊戲片功能之Service: 資料新增成功, NewProductBean=" + bean);
	}

	@Transactional
	@Override
	public void oldSave(OldProductBean bean) {
		gameDao.oldSave(bean);
		log.info("新增遊戲片功能之Service: 資料新增成功, OldProductBean=" + bean);
	}

	@Transactional
	@Override
	public String getCategoryTag(String selected) {
		log.info("新增與更新遊戲片之前置作業之Service, 參數selected=" + selected + "*****");
		String ans = "";
		ans = gameDao.getCategoryTag(selected);
		return ans;
	}

	@Transactional
	@Override
	public List<String> findAllCategories() {
		return gameDao.getCategory();
	}

	@Transactional
	@Override
	public List<NewProductBean> getAllProducts() {
		return gameDao.getAllProducts();
	}

	@Transactional
	@Override
	public List<OldProductBean> getOldAllProducts() {
		return gameDao.getOldAllProducts();
	}

	@Transactional
	@Override
	public NewProductBean getProductById(int id) {
		return gameDao.getProductById(id);
	}

	@Transactional
	@Override
	public OldProductBean getOldProductById(int id) {
		return gameDao.getOldProductById(id);
	}

	@Transactional
	@Override
	public List<NewProductBean> getNintendoProduct() {
		return gameDao.getNintendoProduct();
	}

	@Transactional
	@Override
	public List<OldProductBean> getOldNintendoProduct() {
		return gameDao.getOldNintendoProduct();
	}

	@Transactional
	@Override
	public List<NewProductBean> getSonyProduct() {
		return gameDao.getSonyProduct();
	}

	@Transactional
	@Override
	public List<OldProductBean> getOldSonyProduct() {
		return gameDao.getOldSonyProduct();
	}

	@Transactional
	@Override
	public Map<Integer, NewProductBean> findByNewProductName(String productName) {
		return gameDao.findByNewProductName(productName);
	}
	
	@Transactional
	@Override
	public Map<Integer, OldProductBean> findByOldProductName(String productName) {
		return gameDao.findByOldProductName(productName);
	}
}
