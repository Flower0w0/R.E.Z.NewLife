package _07_love.model;

import java.util.LinkedHashMap;
import java.util.Map;
public class Love {   
	
	private Map<Integer, LoveBean> love = new LinkedHashMap< >();
	
	public Love() {
	}
	
	public Map<Integer, LoveBean>  getLoveContent() { // ${Love.loveContent}
		return love;
	}
	public void addToLove(int id, LoveBean  lvb) {
//		if (oib.getCount() <= 0 ) {
//			return;
//		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( love.get(id) == null ) {
			love.put(id, lvb);
		} 
//			else {
//	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
//			LoveBean lvBean = love.get(id);
//			// 加購的數量：bean.getCount()
//			// 原有的數量：oBean.getCount()			
//			lvBean.setCount(oib.getCount() + lvBean.getCount());
//		}
	}
	
	// 刪除某項商品
	public int deleteLove(int id) {
		if ( love.get(id) != null ) {
			love.remove(id);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getLoveItemNumber(){   // Love.loveItemNumber
		return love.size();
	}
	
}
