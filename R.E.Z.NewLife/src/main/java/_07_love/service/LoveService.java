package _07_love.service;

import java.util.List;

import _07_love.model.LoveBean;

// 本介面處理訂單。一張訂單的所有資訊是存放在OrderBean內，而訂單明細是存放在  
// Set<OrderItemBean> items 屬性內。
// 
// 新增一筆訂單時，必須進行下列兩項檢查：
// (1)計算訂單總金額，以便計算會員的未付款金額(原未付款金額+本訂單總金額)，此金額不能超過某一上限。
// 如果超過此上限，系統將拒絕此訂單。
// (2)扣除訂單明細購買商品的庫存數量，如果商品的庫存不足，系統將拒絕此訂單。
// 
// 如果訂單明細沒有任何問題，則寫入此筆訂單。
// 此介面提供訂單查詢的功能，依照訂單編號來查詢單筆訂單
//
// 實作此介面的類別為 _04_ShoppingCart.model.service.impl.OrderServiceImpl
// 
public interface LoveService {
	


	LoveBean findById(int id);

	List<LoveBean> findByMember_Id(int member_Id);
		
	void persistLove(LoveBean lvb);

	List<LoveBean> findByM_IdAndN_Id(int member_Id, int newproduct_Id);
	
	void delete(int id);

	List<LoveBean> findByM_IdAndO_Id(int member_Id, int oldproduct_Id);
	
}
