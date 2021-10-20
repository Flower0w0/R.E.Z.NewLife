package _05_shoppingCart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _01_register.model.MemberBean;
import _05_shoppingCart.model.OrderBean;
import _05_shoppingCart.model.ShoppingCart;
import _05_shoppingCart.service.OrderService;
import example.ExampleAllInOne;

@Controller
@RequestMapping("/_05_shoppingCart")
@SessionAttributes({ "LoginOK", "ShoppingCart"})
public class ShoppingCartController {

	private static Logger log = LoggerFactory.getLogger(ShoppingCartController.class);

	private final static String SHOW_CART_CONTENT = "_05_shoppingCart/ShowCartContent";

	OrderService orderService;

	@Autowired
	public ShoppingCartController(OrderService orderService) {
		this.orderService = orderService;
	}

	@GetMapping("/ShowCartContent")
	protected String ShowCartContent(Model model, SessionStatus status) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
//			status.setComplete();
			return "redirect:/_02_login/memberLogin";
		}
		return "_05_shoppingCart/ShowCartContent";
	}

	@GetMapping("/checkout")
	protected String checkout(Model model, SessionStatus status) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
//			status.setComplete();
			return "redirect:/_02_login/memberLogin";
		}
		log.info("訂單確認");
		return "_05_shoppingCart/OrderConfirm";
	}

	@PostMapping("/UpdateItem.do")
	protected String UpdateItem(@RequestParam("cmd") String cmd, @RequestParam("id") Integer id,
			@RequestParam(value = "newCount", required = false) Integer newCount, Model model, RedirectAttributes ra,
			SessionStatus status) {
		ShoppingCart sc = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (sc == null) {
//			status.setComplete();
			return "redirect:/_02_login/memberLogin";
		}
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
//			status.setComplete();
			return "redirect:/_02_login/memberLogin";
		}
		log.info("cmd=" + cmd);
		if (cmd.equalsIgnoreCase("DEL")) {
			sc.deleteGame(id); // 刪除購物車內的某項商品
			return SHOW_CART_CONTENT;
		} else if (cmd.equalsIgnoreCase("MOD")) {
			sc.modifyQty(id, newCount); // 修改某項商品的數項
			return SHOW_CART_CONTENT;
		} else {
			return SHOW_CART_CONTENT;
		}
	}

	@RequestMapping(value = "/pay/{id}/{subtotal}", method = RequestMethod.GET)
	public String pay(Model model, @PathVariable Integer id, @PathVariable String subtotal) { //接收所需的參數
		OrderBean ob = orderService.findById(id);
//		System.out.println(model.getAttribute("LoginOK"));//還有東西
		//綠界套件的類別
		ExampleAllInOne.initial(); //一定要呼叫initial()			
		String paymentValue = ExampleAllInOne.genAioCheckOutALL(id, subtotal);//呼叫方法並代入參數
		ob.setPayPayment(paymentValue);//用PayPayment去裝Html Form
		model.addAttribute("showECpay", ob);
		return "_05_shoppingCart/payPayment";
	
	}

}
