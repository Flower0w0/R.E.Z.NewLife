package _04_shop.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;
import _05_shoppingCart.model.OrderItemBean;
import _05_shoppingCart.model.ShoppingCart;

// 當使用者按下『加入購物車』時，瀏覽器會送出請求到本程式
@Controller
@RequestMapping("_04_shop")
@SessionAttributes({ "LoginOK", "pageNo", "products_DPP", "totalPages", "ShoppingCart", "oldpageNo", "oldproducts_DPP",
		"oldtotalPages", "Nintendoproducts_DPP", "Sonyproducts_DPP", "NpageNo", "SpageNo", "NtotalPages", "StotalPages",
		"oldNpageNo", "oldSpageNo", "oldNintendoproducts_DPP", "oldSonyproducts_DPP", "oldNtotalPages",
		"oldStotalPages", "Nintendoproduct", "Sonyproduct" })
public class BuyGameController {
	private static Logger log = LoggerFactory.getLogger(BuyGameController.class);

	@SuppressWarnings("unchecked")
	@PostMapping("/NewProducts.do")
	protected String buyGame(Model model, @RequestParam("id") Integer id, @RequestParam("count") Integer count)
			throws ServletException, IOException {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/memberLogin";
		}
		// 取出存放在session物件內的ShoppingCart物件
		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		// 如果找不到ShoppingCart物件
		if (cart == null) {
			log.info("新建ShoppingCart物件");
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			model.addAttribute("ShoppingCart", cart);
		}

//		Long time = System.currentTimeMillis();
//		Date leaseDate = new Date(time);
//		time += 7*60*60*1000;
		String type = "全新";
		Map<Integer, NewProductBean> gameMap = (Map<Integer, NewProductBean>) model.getAttribute("products_DPP");
		try {
			NewProductBean bean = gameMap.get(id);
			Integer buyPrice = (int)(bean.getPrice() * bean.getDiscount());
			Integer subtotal = buyPrice * count;

			// 將訂單資料(價格，數量，折扣與BookBean)封裝到OrderItemBean物件內
			OrderItemBean oib = new OrderItemBean(null, null, null, type, bean.getPrice(), bean.getDiscount(), count,
					buyPrice, subtotal, bean.getId(), bean.getName(), null, null);

			// 將OrderItem物件內加入ShoppingCart的物件內
			cart.addToCart(id, oib);
			log.info("執行ShoppingCart物件的addToCart(), oib=" + oib);
		} catch (Exception e) {
			try {
				Map<Integer, NewProductBean> gameNintendoMap = (Map<Integer, NewProductBean>) model
						.getAttribute("Nintendoproducts_DPP");
				NewProductBean nbean = gameNintendoMap.get(id);
				Integer nbuyPrice = (int)(nbean.getPrice() * nbean.getDiscount());
				Integer nsubtotal = nbuyPrice * count;
				OrderItemBean noib = new OrderItemBean(null, null, null, type, nbean.getPrice(), nbean.getDiscount(),
						count, nbuyPrice, nsubtotal, nbean.getId(), nbean.getName(), null, null);
				cart.addToCart(id, noib);
				log.info("執行ShoppingCart物件的addToCart(), noib=" + noib);
			} catch (Exception e2) {
				try {
					Map<Integer, NewProductBean> gameSonyMap = (Map<Integer, NewProductBean>) model
							.getAttribute("Sonyproducts_DPP");
					NewProductBean sbean = gameSonyMap.get(id);
					Integer sbuyPrice = (int)(sbean.getPrice() * sbean.getDiscount());
					Integer ssubtotal = sbuyPrice * count;
					OrderItemBean soib = new OrderItemBean(null, null, null, type, sbean.getPrice(),
							sbean.getDiscount(), count, sbuyPrice, ssubtotal, sbean.getId(), sbean.getName(), null,
							null);
					cart.addToCart(id, soib);
					log.info("執行ShoppingCart物件的addToCart(), soib=" + soib);
				} catch (Exception e3) {
					try {
						Map<Integer, NewProductBean> nmap = new LinkedHashMap<>();
						List<NewProductBean> list = (List<NewProductBean>)model.getAttribute("Nintendoproduct");
						for (NewProductBean bean : list) {
							nmap.put(bean.getId(), bean);
						}
						
						NewProductBean inbean = nmap.get(id);
						Integer inbuyPrice = (int)(inbean.getPrice() * inbean.getDiscount());
						Integer insubtotal = inbuyPrice * count;
						OrderItemBean inoib = new OrderItemBean(null, null, null, type, inbean.getPrice(),
								inbean.getDiscount(), count, inbuyPrice, insubtotal, inbean.getId(), inbean.getName(), null,
								null);
						cart.addToCart(id, inoib);
						log.info("執行ShoppingCart物件的addToCart(), inoib=" + inoib);
					} catch (Exception e4) {
						Map<Integer, NewProductBean> smap = new LinkedHashMap<>();
						List<NewProductBean> list = (List<NewProductBean>)model.getAttribute("Sonyproduct");
						for (NewProductBean bean : list) {
							smap.put(bean.getId(), bean);
						}
						
						NewProductBean isbean = smap.get(id);
						Integer isbuyPrice = (int)(isbean.getPrice() * isbean.getDiscount());
						Integer issubtotal = isbuyPrice * count;
						OrderItemBean isoib = new OrderItemBean(null, null, null, type, isbean.getPrice(),
								isbean.getDiscount(), count, isbuyPrice, issubtotal, isbean.getId(), isbean.getName(), null,
								null);
						cart.addToCart(id, isoib);
						log.info("執行ShoppingCart物件的addToCart(), isoib=" + isoib);
					}
				}

			}
		}
		return "redirect:/_04_shop/Newproduct?id=" + id;

	}

	@SuppressWarnings("unchecked")
	@PostMapping("/OldProducts.do")
	protected String buyOldGame(Model model, @RequestParam("id") Integer id, @RequestParam("count") Integer count)
			throws ServletException, IOException {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/memberLogin";
		}
		// 取出存放在session物件內的ShoppingCart物件
		ShoppingCart cart = (ShoppingCart) model.getAttribute("ShoppingCart");
		// 如果找不到ShoppingCart物件
		if (cart == null) {
			log.info("新建ShoppingCart物件");
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
			model.addAttribute("ShoppingCart", cart);
		}

//		Long time = System.currentTimeMillis();
//		Date leaseDate = new Date(time);
//		time += 7*60*60*1000;

		String type = "二手";
		Map<Integer, OldProductBean> gameMap = (Map<Integer, OldProductBean>) model.getAttribute("oldproducts_DPP");
		try {
			OldProductBean bean = gameMap.get(id);
			Integer buyPrice = (int)(bean.getPrice() * bean.getDiscount());
			Integer subtotal = buyPrice * count;

			// 將訂單資料(價格，數量，折扣與BookBean)封裝到OrderItemBean物件內
			OrderItemBean oib = new OrderItemBean(null, null, null, type, bean.getPrice(), bean.getDiscount(), count,
					buyPrice, subtotal, null, null, bean.getId(), bean.getName());

			// 將OrderItem物件內加入ShoppingCart的物件內
			cart.addToCart(id, oib);
			log.info("執行ShoppingCart物件的addToCart(), oib=" + oib);
		} catch (Exception e) {
			try {
				Map<Integer, OldProductBean> gameNintendoMap = (Map<Integer, OldProductBean>) model
						.getAttribute("oldNintendoproducts_DPP");
				OldProductBean nbean = gameNintendoMap.get(id);
				Integer nbuyPrice = (int)(nbean.getPrice() * nbean.getDiscount());
				Integer nsubtotal = nbuyPrice * count;
				OrderItemBean noib = new OrderItemBean(null, null, null, type, nbean.getPrice(), nbean.getDiscount(),
						count, nbuyPrice, nsubtotal, null, null, nbean.getId(), nbean.getName());
				cart.addToCart(id, noib);
				log.info("執行ShoppingCart物件的addToCart(), noib=" + noib);
			} catch (Exception e2) {
				try {
					Map<Integer, OldProductBean> gameSonyMap = (Map<Integer, OldProductBean>) model
							.getAttribute("oldSonyproducts_DPP");
					OldProductBean sbean = gameSonyMap.get(id);
					Integer sbuyPrice = (int)(sbean.getPrice() * sbean.getDiscount());
					Integer ssubtotal = sbuyPrice * count;
					OrderItemBean soib = new OrderItemBean(null, null, null, type, sbean.getPrice(), sbean.getDiscount(),
							count, sbuyPrice, ssubtotal, null, null, sbean.getId(), sbean.getName());
					cart.addToCart(id, soib);
					log.info("執行ShoppingCart物件的addToCart(), soib=" + soib);
				} catch (Exception e3) {
					try {
						String type1 = "全新";
						Map<Integer, NewProductBean> nmap = new LinkedHashMap<>();
						List<NewProductBean> list = (List<NewProductBean>)model.getAttribute("Nintendoproduct");
						for (NewProductBean bean : list) {
							nmap.put(bean.getId(), bean);
						}
						NewProductBean inbean = nmap.get(id);
						Integer inbuyPrice = (int)(inbean.getPrice() * inbean.getDiscount());
						Integer insubtotal = inbuyPrice * count;
						OrderItemBean inoib = new OrderItemBean(null, null, null, type1, inbean.getPrice(),
								inbean.getDiscount(), count, inbuyPrice, insubtotal, inbean.getId(), inbean.getName(), null,
								null);
						cart.addToCart(id, inoib);
						log.info("執行ShoppingCart物件的addToCart(), inoib=" + inoib);
					} catch (Exception e4) {
						String type2 = "全新";
						Map<Integer, NewProductBean> smap = new LinkedHashMap<>();
						List<NewProductBean> list = (List<NewProductBean>)model.getAttribute("Sonyproduct");
						for (NewProductBean bean : list) {
							smap.put(bean.getId(), bean);
						}
						
						NewProductBean isbean = smap.get(id);
						Integer isbuyPrice = (int)(isbean.getPrice() * isbean.getDiscount());
						Integer issubtotal = isbuyPrice * count;
						OrderItemBean isoib = new OrderItemBean(null, null, null, type2, isbean.getPrice(),
								isbean.getDiscount(), count, isbuyPrice, issubtotal, isbean.getId(), isbean.getName(), null,
								null);
						cart.addToCart(id, isoib);
						log.info("執行ShoppingCart物件的addToCart(), isoib=" + isoib);
					}
				}
				
			}
			
		}
		return "redirect:/_04_shop/Oldproduct?id=" + id;
	}

}