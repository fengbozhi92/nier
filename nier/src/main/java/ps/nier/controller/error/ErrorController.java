package ps.nier.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController{
	@RequestMapping(value="/error/error.do")
	public String noPermission(){
		return "error/noPermission";
	}
}
