package _07_love.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _01_register.model.MemberBean;
import _04_shop.model.NewProductBean;
import _04_shop.model.OldProductBean;
import _07_love.model.LoveBean;
import _07_love.service.LoveService;

// 當使用者按下『加入我的最愛』時，瀏覽器會送出請求到本程式
@Controller
@RequestMapping("_07_love")
@SessionAttributes({ "LoginOK", "pageNo", "products_DPP", "totalPages", "ShoppingCart", "oldpageNo", "oldproducts_DPP",
		"oldtotalPages", "Nintendoproducts_DPP", "Sonyproducts_DPP", "NpageNo", "SpageNo", "NtotalPages", "StotalPages",
		"oldNpageNo", "oldSpageNo", "oldNintendoproducts_DPP", "oldSonyproducts_DPP", "oldNtotalPages", "Love",
		"oldStotalPages", "Nintendoproduct", "Sonyproduct" })
public class AddLoveController {
	private static Logger log = LoggerFactory.getLogger(AddLoveController.class);

	LoveService service;

	@Autowired
	public AddLoveController(LoveService service) {
		this.service = service;
	}

	@GetMapping("/loveContent")
	protected String loveDetail(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/memberLogin";
		}
		List<LoveBean> memberLoves = service.findByMember_Id(memberBean.getId());
		model.addAttribute("memberLoves", memberLoves);
		log.info("訂單編號:" + memberBean.getId() + "的內容: " + memberLoves);
		return "_01_register/memberLove";
	}

	@PostMapping("/dmodifyLove")
	public String delete(@RequestParam("id") Integer id) {
		service.delete(id);

		return "redirect:/_07_love/loveContent";
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/Love.do")
	protected String addLove(Model model, @RequestParam("id") Integer id, RedirectAttributes ra, HttpSession session)
			throws ServletException, IOException {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/memberLogin";
		}

		String type = "全新";
		Map<Integer, NewProductBean> gameMap = (Map<Integer, NewProductBean>) model.getAttribute("products_DPP");
		try {

			NewProductBean bean = gameMap.get(id);
			LoveBean lvb = new LoveBean(null, memberBean.getId(), bean.getId(), bean.getName(), bean.getPrice(), null,
					null, null, null, null, type);
			List<LoveBean> list = service.findByM_IdAndN_Id(memberBean.getId(), bean.getId());
			if (list == null || list.isEmpty()) {
				service.persistLove(lvb);
				log.info("已寫入表格");
			}
		} catch (Exception e) {
			try {
				Map<Integer, NewProductBean> gameNintendoMap = (Map<Integer, NewProductBean>) model
						.getAttribute("Nintendoproducts_DPP");

				NewProductBean nbean = gameNintendoMap.get(id);
				LoveBean lvb = new LoveBean(null, memberBean.getId(), nbean.getId(), nbean.getName(), nbean.getPrice(),
						null, null, null, null, null, type);
				List<LoveBean> list = service.findByM_IdAndN_Id(memberBean.getId(), nbean.getId());
				if (list == null || list.isEmpty()) {
					service.persistLove(lvb);
					log.info("已寫入表格");
				}
			} catch (Exception e2) {
				try {
					Map<Integer, NewProductBean> gameSonyMap = (Map<Integer, NewProductBean>) model
							.getAttribute("Sonyproducts_DPP");

					NewProductBean sbean = gameSonyMap.get(id);
					LoveBean lvb = new LoveBean(null, memberBean.getId(), sbean.getId(), sbean.getName(),
							sbean.getPrice(), null, null, null, null, null, type);
					List<LoveBean> list = service.findByM_IdAndN_Id(memberBean.getId(), sbean.getId());
					if (list == null || list.isEmpty()) {
						service.persistLove(lvb);
						log.info("已寫入表格");
					}
				} catch (Exception e3) {
					try {
						Map<Integer, NewProductBean> nmap = new LinkedHashMap<>();
						List<NewProductBean> list = (List<NewProductBean>) model.getAttribute("Nintendoproduct");
						for (NewProductBean bean : list) {
							nmap.put(bean.getId(), bean);
						}

						NewProductBean inbean = nmap.get(id);
						LoveBean lvb = new LoveBean(null, memberBean.getId(), inbean.getId(), inbean.getName(),
								inbean.getPrice(), null, null, null, null, null, type);
						List<LoveBean> list1 = service.findByM_IdAndN_Id(memberBean.getId(), inbean.getId());
						if (list1 == null || list1.isEmpty()) {
							service.persistLove(lvb);
							log.info("已寫入表格");
						}
					} catch (Exception e4) {
						Map<Integer, NewProductBean> smap = new LinkedHashMap<>();
						List<NewProductBean> list = (List<NewProductBean>) model.getAttribute("Sonyproduct");
						for (NewProductBean bean : list) {
							smap.put(bean.getId(), bean);
						}
						NewProductBean isbean = smap.get(id);
						LoveBean lvb = new LoveBean(null, memberBean.getId(), isbean.getId(), isbean.getName(),
								isbean.getPrice(), null, null, null, null, null, type);
						List<LoveBean> list1 = service.findByM_IdAndN_Id(memberBean.getId(), isbean.getId());
						if (list1 == null || list1.isEmpty()) {
							service.persistLove(lvb);
							log.info("已寫入表格");
						}

					}
				}

			}
		}
		return "redirect:/_04_shop/Newproduct?id=" + id;

	}

	@SuppressWarnings("unchecked")
	@PostMapping("/OldLove.do")
	protected String addOldLove(Model model, @RequestParam("id") Integer id) throws ServletException, IOException {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/memberLogin";
		}

		String type = "二手";
		Map<Integer, OldProductBean> gameMap = (Map<Integer, OldProductBean>) model.getAttribute("oldproducts_DPP");
		try {

			OldProductBean bean = gameMap.get(id);
			LoveBean lvb = new LoveBean(null, memberBean.getId(), null, null, null, bean.getId(), bean.getName(),
					bean.getPrice(), null, null, type);
			List<LoveBean> list = service.findByM_IdAndO_Id(memberBean.getId(), bean.getId());
			if (list == null || list.isEmpty()) {
				service.persistLove(lvb);
				log.info("已寫入表格");
			}

		} catch (Exception e) {
			try {
				Map<Integer, OldProductBean> gameNintendoMap = (Map<Integer, OldProductBean>) model
						.getAttribute("oldNintendoproducts_DPP");
				OldProductBean nbean = gameNintendoMap.get(id);
				LoveBean lvb = new LoveBean(null, memberBean.getId(), null, null, null, nbean.getId(), nbean.getName(),
						nbean.getPrice(), null, null, type);
				List<LoveBean> list = service.findByM_IdAndO_Id(memberBean.getId(), nbean.getId());
				if (list == null || list.isEmpty()) {
					service.persistLove(lvb);
					log.info("已寫入表格");
				}
			} catch (Exception e2) {
				try {
					Map<Integer, OldProductBean> gameSonyMap = (Map<Integer, OldProductBean>) model
							.getAttribute("oldSonyproducts_DPP");
					OldProductBean sbean = gameSonyMap.get(id);
					LoveBean lvb = new LoveBean(null, memberBean.getId(), null, null, null, sbean.getId(),
							sbean.getName(), sbean.getPrice(), null, null, type);
					List<LoveBean> list = service.findByM_IdAndO_Id(memberBean.getId(), sbean.getId());
					if (list == null || list.isEmpty()) {
						service.persistLove(lvb);
						log.info("已寫入表格");
					}
				} catch (Exception e3) {
					try {
						Map<Integer, NewProductBean> nmap = new LinkedHashMap<>();
						List<NewProductBean> list = (List<NewProductBean>) model.getAttribute("Nintendoproduct");
						for (NewProductBean bean : list) {
							nmap.put(bean.getId(), bean);
						}

						NewProductBean inbean = nmap.get(id);
						LoveBean lvb = new LoveBean(null, memberBean.getId(), inbean.getId(), inbean.getName(),
								inbean.getPrice(), null, null, null, null, null, type);
						List<LoveBean> list1 = service.findByM_IdAndN_Id(memberBean.getId(), inbean.getId());
						if (list1 == null || list1.isEmpty()) {
							service.persistLove(lvb);
							log.info("已寫入表格");
						}
					} catch (Exception e4) {
						Map<Integer, NewProductBean> smap = new LinkedHashMap<>();
						List<NewProductBean> list = (List<NewProductBean>) model.getAttribute("Sonyproduct");
						for (NewProductBean bean : list) {
							smap.put(bean.getId(), bean);
						}
						NewProductBean isbean = smap.get(id);
						LoveBean lvb = new LoveBean(null, memberBean.getId(), isbean.getId(), isbean.getName(),
								isbean.getPrice(), null, null, null, null, null, type);
						List<LoveBean> list1 = service.findByM_IdAndN_Id(memberBean.getId(), isbean.getId());
						if (list1 == null || list1.isEmpty()) {
							service.persistLove(lvb);
							log.info("已寫入表格");
						}

					}

				}

			}

		}
		return "redirect:/_04_shop/Oldproduct?id=" + id;
	}
}