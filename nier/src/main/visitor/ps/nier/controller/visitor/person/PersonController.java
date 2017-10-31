package ps.nier.controller.visitor.person;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ps.nier.core.domain.user.UserDetail;
import ps.nier.service.user.UserService;

@Controller
public class PersonController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/person/setting.do")
	public String setting(String id, Model model){
		if (id != null && id.length() == 36) {
			UserDetail user = userService.getOne(id);
			if (user != null) {
				model.addAttribute("detail", user);
				return "/visitor/person/setting";
			} 
		}
		return "";
	}
	
	@RequestMapping("/person/save.do")
	@ResponseBody
	public Map<String, Object> save(String id, UserDetail user){
		Map<String, Object> model = new HashMap<String, Object>(2);
		model.put("detail", userService.updateDetail(user.getId(), user));
		return model;
	}
}
