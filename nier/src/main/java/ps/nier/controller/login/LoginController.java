package ps.nier.controller.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.core.domain.user.User;

@Controller
public class LoginController {
	
	@RequestMapping(value="/login/login.do")
	public String login(User user, HttpServletRequest req){
	    
		return "visitor/login/login";
	}
}
