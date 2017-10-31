package ps.nier.controller.logout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.service.user.UserRepository;

@Controller
public class LogOutController {
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value="/logout/logout.do")
	public void logout(){
		
	}
}
