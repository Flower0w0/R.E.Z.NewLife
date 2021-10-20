package _01_register.validator;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _01_register.model.MemberBean;

public class MemberBeanAcValidator implements Validator {
//	private static Logger log = LoggerFactory.getLogger(MemberBeanAcValidator.class);
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
//		MemberBean mb = (MemberBean) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", 	"", "密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", 	"", "地址欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", 		"", "電子郵件欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", 		"", "電話欄不能空白");
//		ValidationUtils.rejectIfEmpty(errors, "memberMultipartFile", "", "必須挑選圖片");
//		if (mb.getMemberId().length()<5) {
//			errors.rejectValue("memberId","", "帳號欄不能小於五個字元");
//		}
		
//		if (! mb.getPassword().equals(mb.getPassword1())) {
//			errors.rejectValue("password","", "密碼欄與確認密碼不一致");
//		}
//		log.info("mb.getMemberMultipartFile().getSize()=" + mb.getMemberMultipartFile().getSize());
//		if (mb.getMemberMultipartFile().getSize() == 0) {
//			errors.rejectValue("memberMultipartFile", "", "必須挑選圖片");
//		}
	}
	
	

}
