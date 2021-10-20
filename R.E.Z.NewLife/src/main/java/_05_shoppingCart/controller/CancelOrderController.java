package _05_shoppingCart.controller;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/_05_shoppingCart")
@SessionAttributes({"ShoppingCart" , "Love"})
public class CancelOrderController {
	private static Logger log = LoggerFactory.getLogger(CancelOrderController.class);
	
	@GetMapping("/cancelOrder")
	protected String cancelOrder(Model model, HttpSession session,
			WebRequest webRequest, SessionStatus status, RedirectAttributes ra
			) {
		log.info("使用者取消訂單(OK)");
		status.setComplete();
		String cancelOrder = "您已經取消訂單，期待您再次光臨" ;
		ra.addFlashAttribute("cancelOrder", cancelOrder);
		return  "redirect:/_04_shop/NewProducts";
	}
}