package ps.nier.controller.upload;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UploadController {
	@RequestMapping(value="/upload/image.do")
	public String image(HttpServletRequest req){
		String img = req.getParameter("img");
		System.out.println(img.length());
		return "{\"status\":1}";
	}
}
