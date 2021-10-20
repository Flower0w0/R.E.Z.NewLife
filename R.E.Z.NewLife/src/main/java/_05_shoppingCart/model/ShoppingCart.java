package _05_shoppingCart.model;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
public class ShoppingCart {   
	
	private Map<Integer, OrderItemBean> cart = new LinkedHashMap< >();
	
	public ShoppingCart() {
	}
	
	public Map<Integer, OrderItemBean>  getContent() { // ${ShoppingCart.content}
		return cart;
	}
	public void addToCart(int id, OrderItemBean  oib) {
		if (oib.getCount() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(id) == null ) {
		    cart.put(id, oib);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			OrderItemBean oiBean = cart.get(id);
			// 加購的數量：bean.getCount()
			// 原有的數量：oBean.getCount()			
			oiBean.setCount(oib.getCount() + oiBean.getCount());
		}
	}

	public boolean modifyQty(int id, int newCount) {
		if ( cart.get(id) != null ) {
		   OrderItemBean  bean = cart.get(id);
		   bean.setCount(newCount);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int deleteGame(int id) {
		if ( cart.get(id) != null ) {
	       cart.remove(id);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
	public int getSubtotal(){
		int subTotal = 0 ;
		Set<Integer> set = cart.keySet();
		for(int n : set){
			OrderItemBean oib = cart.get(n);
			int price    = oib.getPrice();
			double discount = oib.getDiscount();
			int count      = oib.getCount();
			subTotal +=  price * discount * count;
		}
		subTotal += 100; //運費
		return subTotal;
	}
	
}
