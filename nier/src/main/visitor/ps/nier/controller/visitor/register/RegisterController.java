package ps.nier.controller.visitor.register;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.UserRoleEnum;
import ps.nier.core.domain.user.User;
import ps.nier.service.user.UserRepository;

@Controller
public class RegisterController {
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value="/register/to.do")
	public String to(User user){
		return "/visitor/register/register";
	}
	
	@RequestMapping(value="/register/checkUsername.do")
	@ResponseBody
	public Map<String, Boolean> checkUsername(String username){
		Map<String, Boolean> result = new HashMap<String, Boolean>(1);
		boolean flag = false;
		if (!userRepository.existsByUsername(username)) {
			flag = true;
		} else {
			flag = false;
		}
		result.put("valid", flag);
		return result;
	}
	
	@RequestMapping(value="/register/register.do")
	public String register(User user){
		if (StringUtils.isNotBlank(user.getUsername())
			&& StringUtils.isNotBlank(user.getPassword())) {
			user.setId(UUIDUtils.getId36());
			user.setRoles(UserRoleEnum.User.getRoles());
			userRepository.save(user);
			return "/visitor/register/success";					
		}
		return "/visitor/register/register";
	}
}
