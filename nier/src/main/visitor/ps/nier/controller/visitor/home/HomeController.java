package ps.nier.controller.visitor.home;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.service.codegenerator.CodeGeneratorService;

@Controller
public class HomeController {
	@Autowired
	private CodeGeneratorService codeGeneratorService;
	@RequestMapping(value="/")
	public String welcome(HttpServletRequest req){
	    return "visitor/index";
	}
	
	@RequestMapping(value="/home/index.do")
	public String index(HttpServletRequest req){
		//Object context = SecurityContextHolder.getContext();
		return "visitor/home/index";
	}
	
	@RequestMapping(value="/home/a.do")
	public String a(HttpServletRequest req){
		//Object context = SecurityContextHolder.getContext();
		return "visitor/home/aaaa";
	}
}
