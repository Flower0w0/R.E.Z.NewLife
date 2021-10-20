package _01_register.controller;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _00_init.util.GlobalService;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _01_register.validator.MemberBeanValidator;

@Controller
@RequestMapping("/_01_register")
public class RegisterController {
	
	private static Logger log = LoggerFactory.getLogger(RegisterController.class);
	
	String rootDirectory = "d:\\images";
	String inputDataForm = "_01_register/memberRegister";

	MemberService memberService;
	ServletContext servletContext;

	@Autowired
	public RegisterController(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}
	@GetMapping("/memberRegister")
	public String sendingEmptyForm(Model model) {
		MemberBean memberBean = new MemberBean();
		memberBean.setName("貓貓");
		memberBean.setPassword("catcat123");
		memberBean.setPassword1("catcat123");
		memberBean.setMemberId("catcat");
		memberBean.setAddress("台北市貓貓區貓貓街二段1號");
		memberBean.setPhone("0928-123456");
		memberBean.setEmail("wendylinforwork@gmail.com");
		memberBean.setNickName("貓系玩家");
		memberBean.setBirthday(Date.valueOf("1996-04-29"));
		memberBean.setRank("member");
		model.addAttribute("memberBean", memberBean);
		return inputDataForm;
	}
	
	
	@PostMapping("/memberRegister")
	public String processFormData(
			@ModelAttribute("memberBean") MemberBean bean,
			BindingResult result, Model model,
			RedirectAttributes ra
		) {
		MemberBeanValidator validator = new MemberBeanValidator();
		validator.validate(bean, result);
		if (result.hasErrors()) {
//          下列敘述可以理解Spring MVC如何處理錯誤			
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println("有錯誤：" + error);
//			}
			return inputDataForm;
		}
		
		MultipartFile picture = bean.getMemberMultipartFile();
		String originalFilename = picture.getOriginalFilename();
		
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			bean.setFileName(originalFilename);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setMemberImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setRegisterTime(registerTime);
		
		// 檢查 memberId是否重複
		if (memberService.existsById(bean.getMemberId())) {
			result.rejectValue("memberId", "", "帳號已存在，請重新輸入");
			return inputDataForm;
		}
		
		bean.setPassword(GlobalService.getMD5Endocing(
				GlobalService.encryptString(bean.getPassword())));
		try {
			memberService.save(bean);
			log.info("寫入MemberBean物件：" + bean);
			ra.addFlashAttribute("SUCCESS", "會員: " + bean.getName() +  "資料新增成功");
		} 
		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("memberId", "", "發生異常，請通知系統人員..." + ex.getMessage());
			return inputDataForm;
		}
		// 將上傳的檔案移到指定的資料夾, 目前註解此功能
//		String ext = "";
//		if (originalFilename.lastIndexOf(".") > -1) {
//			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		}
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists())
//				imageFolder.mkdirs();
//			File file = new File(imageFolder, "MemberImage_" + bean.getMemberId() + ext);
//			picture.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
		return "redirect:/";
	}
		
//		@ModelAttribute
//		public MemberBean prepareMemberBean(HttpServletRequest req) {
//			MemberBean memberBean = new MemberBean();
//			memberBean.setTotalAmt(0.0);
//			memberBean.setUnpaid_amount(0.0);
//			memberBean.setUserType("M");
//			return memberBean;
//		}
	
	@RequestMapping("/sendEmail")
	public String forgetpw(@RequestParam("email") String email, Model model) {
		boolean flag = memberService.sendEmail(email);
		if (flag) {
			model.addAttribute("forgetpwMSG", "請至信箱查收忘記密碼認證信");
		} else {
			model.addAttribute("forgetpwMSG", "此信箱尚未註冊，請註冊會員或重新輸入");
		}
		
		return "_01_register/forget";
	}
	
	 @GetMapping("/forget")
	    public String forget(Model model) {
	 return "_01_register/forget";
	 }
	
	@RequestMapping("/updatepwd")
	public String updatepwd(@RequestParam("password") String password,
							@RequestParam("password1") String password1,
							@RequestParam("token") String token,
							Model model) {
		
		if (password.equals(password1) && password != null && password1 != null) {
			if (memberService.updatepwd(password, token)) {
				model.addAttribute("updatepwdMSG", "更新密碼完成，請重新登入");
				return "redirect:/_02_login/memberLogin";
		    }
		} else {
			return "redirect:/_01_register/getpwdagain?token=" + token;
		}
		return "_01_register/resetPassword";
	}
	
	@RequestMapping("/getpwdagain")
	public String getpwdagain(Model model) {
		model.addAttribute("updatepwdMSG", "密碼不一致，請重新輸入");
		return "_01_register/resetPassword";
	}
	
	@RequestMapping("/getpwd")
	public String getpwd() {
		return "_01_register/resetPassword";
	}
	
	
	@GetMapping("/memberAccount")
        public String memberAccount(Model model) {
		return "/_01_register/memberAccount";
	}
	
	@GetMapping("/memberBuy")
    public String memberBuy(Model model) {
	return "/_01_register/memberBuy";
	}
	
	@GetMapping("/memberChange")
    public String memberChange(Model model) {
	return "/_01_register/memberChange";
	}
	
	@GetMapping("/memberLogin")
    public String memberLogin(Model model) {
	return "/_01_register/memberLogin";
	}
	
	@GetMapping("/memberLove")
    public String memberLove(Model model) {
	return "/_01_register/memberLove";
	}
	
	@GetMapping("/memberMail")
    public String memberMail(Model model) {
	return "/_01_register/memberMail";
	}
	
//	@GetMapping("/memberOrder")
//    public String memberOrder(Model model) {
//	return "/_01_register/memberOrder";
//	}

	@GetMapping("/memberRaiders")
    public String memberRaiders(Model model) {
	return "/_01_register/memberRaiders";
	}
	
//	@GetMapping("/memberRegister")
//    public String memberRegister(Model model) {
//	return "/_01_register/memberRegister";
//	}
	
	@GetMapping("/aboutus")
    public String aboutus(Model model) {
	return "aboutus";
	}
	
}
