package _01_register.controller;

import java.sql.Blob;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _00_init.util.GlobalService;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _01_register.validator.MemberBeanAcValidator;


@Controller
@RequestMapping("/_01_register")
@SessionAttributes({ "LoginOK","member","account"})
public class AccountController {

	private static Logger log = LoggerFactory.getLogger(RegisterController.class);
	
	MemberService memberService;
	
	ServletContext servletContext;
	
	String inputDataForm = "_01_register/memberAccount";
	
	@Autowired
	public AccountController(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}
	
	@RequestMapping("/memberAccount")
	public String getAccount(Model model, 
			@RequestParam(value = "memberId", required = false) String memberId
			){
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/memberLogin";
		}
		
		return "_01_register/memberAccount";
		
	}
	
	
	@ModelAttribute("memberBean")
	public MemberBean acModify(Model model
			) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		return memberService.findByMemberId(memberBean.getMemberId());
	}
	
	@GetMapping("/Account")
	public String sendingEmptyAcForm(Model model) {
//		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
////		memberBean.setName("??????" );
////		memberBean.setPassword("123");
////		memberBean.setPassword1("123");
////		memberBean.setMemberId("a0001");
////		memberBean.setAddress("?????????????????????????????????155???");
////		memberBean.setPhone("0928-123456");
////		memberBean.setEmail("a001@gmail.com");
////		memberBean.setNickName("????????????");
////		memberBean.setBirthday(Date.valueOf("1900-01-01"));
////		memberBean.setRank("member");
//		model.addAttribute("memberBean", memberBean);
//		System.out.println(memberBean.getName() + "----------------------------------------------------------");
		return inputDataForm;
	}
	
	
	@PostMapping("/Account")
	public String processAcFormData(
			@ModelAttribute("memberBean") MemberBean bean,
			BindingResult result, Model model,
			RedirectAttributes ra
		) {
		
		System.out.println( "???????????????!!!!!!!!" + bean + "------------------------------------------------------------------------");
		MemberBeanAcValidator validator = new MemberBeanAcValidator();
		validator.validate(bean, result);
		if (result.hasErrors()) {
//          ????????????????????????Spring MVC??????????????????			
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println("????????????" + error);
//			}
			return inputDataForm;
		}
		if (bean.getMemberMultipartFile() != null) {
			MultipartFile picture = bean.getMemberMultipartFile();
			String originalFilename = picture.getOriginalFilename();
			
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				bean.setFileName(originalFilename);
			}
			// ??????Blob??????????????? Hibernate ???????????????
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					bean.setMemberImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("????????????????????????: " + e.getMessage());
				}
			}
		}
		
		if(!(bean.getPassword().equals(((MemberBean)model.getAttribute("LoginOK")).getPassword()))) {
			bean.setPassword(GlobalService.getMD5Endocing(
					GlobalService.encryptString(bean.getPassword())));
		}
		
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setRegisterTime(registerTime);
			
		try {
			
			memberService.update(bean);
			log.info("??????MemberBean?????????" + bean);
			ra.addFlashAttribute("SUCCESS", "??????: " + bean.getName() +  "??????????????????");
		} 
		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("memberId", "", "????????????????????????????????????..." + ex.getMessage());
			return inputDataForm;
		}
		return "redirect:/_01_register/Account";
	}
	
}


