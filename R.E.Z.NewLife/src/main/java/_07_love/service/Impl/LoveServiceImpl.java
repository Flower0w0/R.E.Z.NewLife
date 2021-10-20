package _07_love.service.Impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _07_love.dao.LoveDao;
import _07_love.model.LoveBean;
import _07_love.service.LoveService;

@Service
@Transactional
public class LoveServiceImpl implements LoveService {

	private static Logger log = LoggerFactory.getLogger(LoveServiceImpl.class);

	private LoveDao loveDao;

	@Autowired
	public LoveServiceImpl(LoveDao loveDao) {

		this.loveDao = loveDao;
	}

	@Override
	// 這是一個交易
	public void persistLove(LoveBean lvb) {
		log.info("處理訂單之Service: 3. 準備儲存訂單");
		loveDao.save(lvb);

	}

	@Override
	public LoveBean findById(int id) {
		log.info("依照orderNo編號讀取特定一筆訂單的所有資料之Service, id=" + id);
		LoveBean bean = null;
		bean = loveDao.findById(id);
		return bean;
	}

	@Override
	public List<LoveBean> findByMember_Id(int member_Id) {
		log.info("依照memberId編號讀取某位會員所有訂單之Service: memberId=" + member_Id);
		List<LoveBean> list = null;
		list = loveDao.findByMember_Id(member_Id);
		return list;
	}

	@Override
	public List<LoveBean> findByM_IdAndN_Id(int member_Id, int newproduct_Id) {
		log.info("依照memberId編號讀取某位會員所有訂單之Service: memberId=" + member_Id);
		List<LoveBean> list = null;
		list = loveDao.findByM_IdAndN_Id(member_Id, newproduct_Id);
		return list;
	}
	
	@Override
	public List<LoveBean> findByM_IdAndO_Id(int member_Id, int oldproduct_Id) {
		log.info("依照memberId編號讀取某位會員所有訂單之Service: memberId=" + member_Id);
		List<LoveBean> list = null;
		list = loveDao.findByM_IdAndO_Id(member_Id, oldproduct_Id);
		return list;
	}
	
	@Override
	public void delete(int id) {
		loveDao.delete(id);
		
	}

}
