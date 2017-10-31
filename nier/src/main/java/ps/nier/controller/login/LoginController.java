package ps.nier.controller.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.core.domain.user.User;
import ps.nier.service.user.UserRepository;

@Controller
public class LoginController {
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value="/login/login.do")
	public String login(User user, HttpServletRequest req){
//		SecurityContextImpl securityContextImpl = (SecurityContextImpl) req.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
//		System.out.println(securityContextImpl.getAuthentication().getName());
		AuthenticationException exception = (AuthenticationException)req.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
		if ( exception!= null) {
			System.out.println("<<<<<<<<<<<<<<<<<<<<<<<"+exception.getMessage());
		}
		
		return "visitor/login/login";
	}
}
