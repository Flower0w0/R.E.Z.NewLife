package _06_orderProcess.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import _05_shoppingCart.model.OrderBean;
import _05_shoppingCart.service.OrderService;

	@Controller
	@RequestMapping("/_06_orderProcess")
	@SessionAttributes({ "LoginOK", "pageNo", "products_DPP", "totalPages", "Nintendoproduct", "Sonyproduct", "ShoppingCart",
		"oldpageNo", "oldproducts_DPP", "oldtotalPages", "Nintendoproducts_DPP", "Sonyproducts_DPP", "NpageNo", "SpageNo",
		"NtotalPages", "StotalPages", "oldNpageNo", "oldSpageNo", "oldNintendoproducts_DPP", "oldSonyproducts_DPP", "oldNtotalPages", "oldStotalPages"})
	public class OrderListController {

		private static Logger log = LoggerFactory.getLogger(OrderListController.class);
		
		OrderService orderService;
		
		@Autowired
		public OrderListController(OrderService orderService) {
			this.orderService = orderService;
		}

		@GetMapping("/orderList")
		protected String orderList(Model model) {
			MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
			if (memberBean == null) {
				return "redirect:/_02_login/memberLogin";
			}
			List<OrderBean> memberOrders = orderService.findByMember_Id(memberBean.getId());
			model.addAttribute("memberOrders", memberOrders);
			log.info("會員:" + memberBean.getId() + "的訂單: " + memberOrders);
			return "_01_register/memberOrder";
		}
		
		@GetMapping("/orderDetail")
		protected String orderDetail(Model model, 
				@RequestParam("id") Integer id 
				) {
			MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
			if (memberBean == null) {
				return "redirect:/_02_login/memberLogin";
			}
			OrderBean ob = orderService.findById(id);
			model.addAttribute("OrderBean", ob);
			log.info("訂單編號:" + id + "的內容: " + ob);
			return "_01_register/memberOrderDetial";
		}

}
