package _02_login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _00_init.util.GlobalService;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _02_login.model.LoginBean;
import _02_login.validator.LoginBeanValidator;

@Controller
@RequestMapping("/_02_login")
@SessionAttributes({"LoginOK"}) 
public class LoginController {
	
	private static Logger log = LoggerFactory.getLogger(LoginController.class);
	
	String loginForm = "_02_login\\memberLogin";
	String loginOut = "_02_login\\logout";
	
	MemberService memberService;
	
	@Autowired
	public LoginController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping("/memberLogin")
	public String login00(HttpServletRequest request, Model model, 
		@CookieValue(value="user", required = false) String user,
		@CookieValue(value="password", required = false) String password, 
		@CookieValue(value="rm", required = false) Boolean rm 
			) {
		if (user == null)
			user = "";
		if (password == null) {
			password = "";
		} else {
			password = GlobalService.decryptString(GlobalService.KEY, password);
		}
		
		if (rm != null) {
			rm = Boolean.valueOf(rm);
		} else {
			rm = false;
		}
			
		LoginBean bean = new LoginBean(user, password, rm);
		model.addAttribute(bean);	
		log.info("??????????????????, userId=" + user);
		return loginForm;
	}
	
	@PostMapping("/memberLogin")
	public String checkAccount(
			@ModelAttribute("loginBean") LoginBean bean,
			BindingResult result, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		
		LoginBeanValidator validator = new LoginBeanValidator();
		validator.validate(bean, result);
		if (result.hasErrors()) {
			return loginForm;
		}
		String password =bean.getPassword();
		MemberBean mb = null;
		try {
			// ?????? loginService????????? checkIDPassword()?????????userid???password????????????
			mb = memberService.findByMemberIdAndPassword(bean.getUserId(),  
					GlobalService.getMD5Endocing(GlobalService.encryptString(password)));
			
			if (mb != null) {
				// OK, ????????????, ???mb????????????Session???????????????????????????"LoginOK"
				model.addAttribute("LoginOK", mb);
				log.info("???????????????MemberBean=" + mb);
				HttpSession session = request.getSession();
				session.setAttribute("LoginOK", mb);
			} else {
				// NG, ????????????, userid?????????????????????????????????????????????????????? errorMsgMap ??????
				result.rejectValue("invalidCredentials", "", "?????????????????????????????????");
				log.info("???????????????userid=" + bean.getUserId() + ", ??????=" + password);
				return loginForm;
			}
		} catch (RuntimeException ex) {
			result.rejectValue("invalidCredentials", "", ex.getMessage());
			ex.printStackTrace();
			return loginForm;
		}
		HttpSession session = request.getSession();
		processCookies(bean, request, response);
		String nextPath = (String)session.getAttribute("requestURI");
		if (nextPath == null) {
			nextPath = request.getContextPath();
		}
		return "redirect: " + nextPath;
	}

	
	private void processCookies(LoginBean bean, HttpServletRequest request, HttpServletResponse response) {
		
		
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		String userId = bean.getUserId();
		String password = bean.getPassword();
		
        
//        if (bean.isRememberMe()) {
//        	String name = "user";
//        	String value = userId;
//        	String cookie = String.format("%s=%s; max-age=604800; Path=/R.E.Z.NewLife; SameSite=none;", name, value);
//        	response.addHeader("Set-Cookie", cookie);
//
//			String encodePassword = GlobalService.encryptString(password);
//			String name1 = "password";
//        	String value1 = encodePassword;
//        	String cookie1 = String.format("%s=%s; max-age=604800; Path=/R.E.Z.NewLife; SameSite=none;", name1, value1);
//        	response.addHeader("Set-Cookie", cookie1);
//
//        	String name2 = "rm";
//        	String value2 = "true";
//        	String cookie2 = String.format("%s=%s; max-age=604800; Path=/R.E.Z.NewLife; SameSite=none;", name2, value2);
//        	response.addHeader("Set-Cookie", cookie2);
//
//		} else { // ?????????????????? RememberMe ??????
//			String name = "user";
//        	String value = userId;
//        	String cookie = String.format("%s=%s; max-age=0; Path=/R.E.Z.NewLife; SameSite=none;", name, value);
//        	response.addHeader("Set-Cookie", cookie);
//
//
//			String encodePassword = GlobalService.encryptString(password);
//			String name1 = "password";
//        	String value1 = encodePassword;
//        	String cookie1 = String.format("%s=%s; max-age=0; Path=/R.E.Z.NewLife; SameSite=none;", name1, value1);
//        	response.addHeader("Set-Cookie", cookie1);
//
//        	String name2 = "rm";
//        	String value2 = "true";
//        	String cookie2 = String.format("%s=%s; max-age=0; Path=/R.E.Z.NewLife; SameSite=none;", name2, value2);
//        	response.addHeader("Set-Cookie", cookie2);
//		}
//		response.addCookie(cookieUser);
//		response.addCookie(cookiePassword);
//		response.addCookie(cookieRememberMe);
        
        
        
		
		// rm????????????????????????RememberMe??????????????????????????????RememberMe?????????rm????????????null
		if (bean.isRememberMe()) {
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(7 * 24 * 60 * 60);       // Cookie????????????: ??????
			cookieUser.setPath(request.getContextPath());

			String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else { // ?????????????????? RememberMe ??????
			cookieUser = new Cookie("user", userId);
			cookieUser.setMaxAge(0); // MaxAge==0 ??????????????????????????????Cookie
			cookieUser.setPath(request.getContextPath());

			String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
		
	}
	
	
	@PostMapping("/test")
	@ResponseBody
	public String test(Model model,String test) {
		test = test + test;
		return test;
		
	}
	
}
