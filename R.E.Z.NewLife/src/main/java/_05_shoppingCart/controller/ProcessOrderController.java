package _05_shoppingCart.controller;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _01_register.model.MemberBean;
// OrderConfirm.jsp 呼叫本程式。
import _05_shoppingCart.model.OrderBean;
import _05_shoppingCart.model.OrderItemBean;
import _05_shoppingCart.model.ShoppingCart;
import _05_shoppingCart.service.OrderService;

@Controller
@RequestMapping("/_05_shoppingCart")
@SessionAttributes({ "LoginOK", "ShoppingCart", "OrderErrorMessage"})
public class ProcessOrderController {
	private static Logger log = LoggerFactory.getLogger(ProcessOrderController.class);
	
	OrderService orderService;
	
	@Autowired
	public ProcessOrderController(OrderService orderService) {
		this.orderService = orderService;
	}

	@PostMapping("/ProcessOrder.do")
	protected String processOrder(Model model, 
			@RequestParam("deladdress") String deladdress,
			@RequestParam("finalDecision") String finalDecision,
			@RequestParam("person") String person,
			@RequestParam("phone") String phone,
			@RequestParam("payway") String payway,
			@RequestParam("desc") String desc,
			WebRequest webRequest, SessionStatus status, RedirectAttributes ra
	) {
		
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/memberLogin";
		}
		
		ShoppingCart sc = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			return "redirect:/_02_login/memberLogin";
		}
		// 如果使用者取消訂單
		if (finalDecision.equalsIgnoreCase("CANCEL")) {
			log.info("客戶最終決定取消訂單");
			return "forward:/_05_shoppingCart/abort";
		}   			
		// 取出會員代號
		Integer memberId = memberBean.getId();
		String memberName = memberBean.getName();
		Integer total = sc.getSubtotal();  	// 計算訂單總金額 
		Timestamp date = new Timestamp(System.currentTimeMillis());
		String state = "待出貨";
		String delway = "宅配";
		// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		OrderBean ob = new OrderBean(null, memberId, memberName, state, date, delway, deladdress,
				 person, phone, payway, total, desc, 0, null);
		
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		Map<Integer, OrderItemBean> content = sc.getContent();
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet();
		for(Integer i : set) {
			OrderItemBean oib = content.get(i);
			oib.setOrderBean(ob);
			items.add(oib);
		}
		
		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		ob.setOrderItemBeans(items);  
		System.out.println(ob);
		try {
			orderService.persistOrder(ob);
//			status.setComplete();
//			webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
			log.info("訂單已經成功寫入表格");
			model.addAttribute("MemberName_ThanksForOrdering", memberBean.getName()) ;
			Integer id = ob.getId();
			Integer subtotal = ob.getTotal();
			
			if ( payway.equals("信用卡")) {
				return "redirect:/_05_shoppingCart/pay/" + id + "/" + (subtotal).toString();
			}else {
				return "forward:" + "/_05_shoppingCart/ThanksForOrdering/" + id;
			}
		} catch(RuntimeException ex){
			String message = ex.getMessage();
			String shortMsg = "" ;
			System.out.println("message=" + message);
			shortMsg =  message.substring(message.indexOf(":") + 1);
			log.info("處理訂單時發生異常: " + shortMsg);
			model.addAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg  + "，請調正訂單內容" );
			return "redirect:/_05_shoppingCart/ShowCartContent";
		}		
	}
}