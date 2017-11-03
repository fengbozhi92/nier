package ps.nier.controller.visitor.home;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value="/")
	public String welcome(HttpServletRequest req){
		return "visitor/index";
	}
	
	@RequestMapping(value="/home/index.do")
	public String index(HttpServletRequest req){
		//Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return "visitor/home/index";
	}
}
