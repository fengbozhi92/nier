package ps.nier.controller.visitor.group;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {
	
	@RequestMapping(value="/group/index.do")
	public String index(){
		return "visitor/group/index";
	}
	
	@RequestMapping(value="/group/add.do")
	public String add(){
		return "visitor/group/add";
	}
}
