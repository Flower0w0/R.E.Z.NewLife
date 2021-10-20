package _05_shoppingCart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _05_shoppingCart.model.OrderBean;
import _05_shoppingCart.model.OrderItemBean;
import _05_shoppingCart.service.OrderService;

@Controller
@RequestMapping("/_05_shoppingCart")
// 由於要執行status.setComplete();來移除Session範圍的ShoppingCart物件，所以
// @SessionAttributes({ "ShoppingCart" }) 只能單讀編寫該物件的識別字串。
@SessionAttributes({ "ShoppingCart", "MemberName_ThanksForOrdering", "LoginOK"})
public class RemoveShoppingCartController {
	private static Logger log = LoggerFactory.getLogger(RemoveShoppingCartController.class);
	
	OrderService orderService;
	MemberService memberService;
	
	@Autowired
	public RemoveShoppingCartController(OrderService orderService, MemberService memberService) {
		this.orderService = orderService;
		this.memberService = memberService;
	}
	
//	@RequestMapping("/removeShoppingCart")
//	public String removeCart(Model model, WebRequest webRequest, 
//			SessionStatus status, RedirectAttributes ra) {
//		status.setComplete();
//		webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
//		log.info("已經移除購物車");
//		return "redirect:" + "/";
//	}
	
//	@RequestMapping("/ThanksForOrdering")
//	public String thanksForOrdering(Model model, WebRequest webRequest, 
//			SessionStatus status, RedirectAttributes ra) {
//		
//		ra.addFlashAttribute("MemberName_ThanksForOrdering", model.getAttribute("MemberName_ThanksForOrdering"));
//		log.info("謝謝訂購");
//		status.setComplete();
//		webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
//		log.info("已經移除購物車");
//		return "ThanksForOrdering";
//	}
	
	@RequestMapping(value = "/ThanksForOrdering/{id}", method = RequestMethod.POST)
	public String thanksForOrdering(Model model, 
			@PathVariable Integer id,
			WebRequest webRequest, 
			HttpSession session,
			SessionStatus status, RedirectAttributes ra) {
		
		
		OrderBean ob = orderService.findById(id);
		model.addAttribute("BuyOrder", ob);
		MemberBean mb = memberService.findById(ob.getMember_id());
		model.addAttribute("LoginOK", mb);
		List<OrderItemBean> list = orderService.findByOiId(id);
		model.addAttribute("BuyOrderitems", list);
		ra.addFlashAttribute("MemberName_ThanksForOrdering", model.getAttribute("MemberName_ThanksForOrdering"));
		log.info("謝謝訂購");
//		status.setComplete();
		webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
		log.info("已經移除購物車");
		return "ThanksForOrdering";
	}
}
