package _00_init.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _00_init.repository.BaseRepository;
import _00_init.service.BaseService;

@Service
public class BaseServiceImpl implements BaseService {

	private static Logger log = LoggerFactory.getLogger(BaseServiceImpl.class);
	
	BaseRepository  baseDao;
	 
	@Autowired
	public BaseServiceImpl(BaseRepository baseDao) {
		this.baseDao = baseDao;
	}

	@Transactional
	@Override
	public void initData() {
		log.info("BaseServiceImpl#initData()開始執行");
		baseDao.rebuildTableAndIndex();
		baseDao.loadInitData();
	}
}
