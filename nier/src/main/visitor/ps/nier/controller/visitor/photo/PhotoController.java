package ps.nier.controller.visitor.photo;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ps.nier.controller.base.BaseController;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.photo.Photo;
import ps.nier.core.domain.photo.PhotoQuery;
import ps.nier.service.photo.PhotoService;
@Controller
public class PhotoController extends BaseController{
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(PhotoController.class);

	@Autowired
	private PhotoService photoService;
	
	@RequestMapping(value="/photo/list1.do")
	public String list1(HttpServletRequest req, Model model){
		return "visitor/photo/list1";
	}
	
	@RequestMapping(value="/photo/list2.do")
	public String list2(HttpServletRequest req, Model model){
		return "visitor/photo/list2";
	}
	
	@RequestMapping(value="/photo/list.do")
	public String list(HttpServletRequest req, Model model){
		String albumId = req.getParameter("aId");
		if (albumId != null && albumId.length() == 36) {
			try {
				model.addAttribute("aid", albumId);
				return "visitor/photo/list";
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("PhotoController's list is error!", t);
			}
		}
		return "visitor/error";
	}
	
	@RequestMapping(value="/photo/ajaxList.do",method=RequestMethod.POST)
	public ResponseEntity<ResEntity> ajaxList(PhotoQuery query){
		Page<Photo> page = null;
		try {
			page = photoService.list(query);
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PhotoController's ajaxList is error!", t);
		}
		return renderData(page);
	}
	
	@RequestMapping(value="/photo/update.do")
	public ResponseEntity<ResEntity> update(Photo photo){
		try {
			if (photoService.save(photo)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PhotoController's update is error!", t);
		}
		return renderError();
	}
}
