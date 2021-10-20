package _03_raiders.controller;

import javax.servlet.ServletContext;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/_03_raiders")
public class RaidersController {
	
//	private static Logger log = LoggerFactory.getLogger(RaidersController.class);

	ServletContext servletContext;

	@Autowired
	public RaidersController(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	@GetMapping("/raiders")
    public String raiders(Model model) {
	return "/_03_raiders/raiders";
	}
	
	@GetMapping("/raidersContent")
    public String raidersContent(Model model) {
	return "/_03_raiders/raidersContent";
	}
	
	@GetMapping("/wish")
    public String wish(Model model) {
	return "/_03_raiders/wish";
	}
	
	@GetMapping("/wishContent")
    public String wishContent(Model model) {
	return "/_03_raiders/wishContent";
	}
	 @GetMapping("/news")
	    public String news(Model model) {
	 return "/_03_raiders/news";
	 }

}
