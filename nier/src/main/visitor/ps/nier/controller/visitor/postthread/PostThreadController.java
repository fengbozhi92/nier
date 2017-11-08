package ps.nier.controller.visitor.postthread;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.controller.base.BaseController;
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.PostThreadTypeEnum;
import ps.nier.core.dictionary.StatusEnum;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.postthread.PostThread;
import ps.nier.core.domain.postthread.PostThreadQuery;
import ps.nier.service.postthread.PostThreadService;

@Controller
public class PostThreadController extends BaseController{
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(PostThreadController.class);
	@Autowired
	private PostThreadService postThreadService;
	
	@RequestMapping(value="/postthread/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody PostThreadQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PostThreadController's ajaxList is error!", t);
		}
		return renderData(postThreadService.list(query));
	}
	
	@RequestMapping(value="/postthread/pub.do")
	public ResponseEntity<ResEntity> save(PostThread postThread){
		try {
			postThread.setId(UUIDUtils.getId36());
			postThread.setCreateTime(new Date());
			postThread.setStatus(StatusEnum.Valid.getValue());
			postThread.setType(PostThreadTypeEnum.Default.getValue());
			if (postThreadService.save(postThread)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PostThreadController's pub is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/postthread/view.do")
	public String view(HttpServletRequest req, Model model){
		String id =req.getParameter("id");
		if (id != null && id.length() == 36) {
			try {
				PostThread postThread = postThreadService.get(id);
				if (postThread != null) {
					postThreadService.updateViewCount(id);
					model.addAttribute("thread", postThread);
					return "visitor/postthread/view";
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("PostThreadController's view is error!", t);
			}
		}
		return "visitor/error";
	}
	
}
