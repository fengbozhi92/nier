package ps.nier.controller.visitor.photoalbum;

import java.util.Date;

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
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.StatusEnum;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.photoalbum.PhotoAlbum;
import ps.nier.core.domain.photoalbum.PhotoAlbumQuery;
import ps.nier.service.photoalbum.PhotoAlbumService;

@Controller
public class PhotoAlbumController extends BaseController{
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(PhotoAlbumController.class);
	@Autowired
	private PhotoAlbumService photoAlbumService;
	
	@RequestMapping(value="/photoalbum/list.do")
	public String list(HttpServletRequest req, Model model){
		String userId = req.getParameter("uid");
		if (userId != null && userId.length() == 36) {
			try {
				model.addAttribute("uid", userId);
				return "visitor/photoalbum/list";
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("PhotoAlbumController's list is error!", t);
			}
		}
		return "visitor/error";
	}
	
	@RequestMapping(value="/photoalbum/ajaxList.do",method=RequestMethod.POST)
	public ResponseEntity<ResEntity> ajaxList(PhotoAlbumQuery query){
		Page<PhotoAlbum> page = null;
		try {
			page = photoAlbumService.list(query);
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PhotoAlbumController's ajaxList is error!", t);
		}
		return renderData(page);
	}
	
	@RequestMapping(value="/photoalbum/save.do")
	public ResponseEntity<ResEntity> save(PhotoAlbum photoAlbum){
		try {
			photoAlbum.setId(UUIDUtils.getId36());
			photoAlbum.setCreateTime(new Date());
			photoAlbum.setStatus(StatusEnum.Valid.getValue());
			photoAlbum.setCount(1);
			photoAlbum.setSequence(1);
			if (photoAlbumService.save(photoAlbum)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PhotoAlbumController's save is error!", t);
		}
		return renderError();
	}
	
}
