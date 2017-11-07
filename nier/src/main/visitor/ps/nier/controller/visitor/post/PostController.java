package ps.nier.controller.visitor.post;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.controller.base.BaseController;
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.PostTypeEnum;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.post.Post;
import ps.nier.core.domain.post.PostQuery;
import ps.nier.service.post.PostService;

@Controller
public class PostController extends BaseController{
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(PostController.class);
	@Autowired
	private PostService postService;
	
	@RequestMapping(value="/post/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody PostQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PostController's ajaxList is error!", t);
		}
		return renderData(postService.list(query));
	}
	
	@RequestMapping(value="/post/pub.do")
	public ResponseEntity<ResEntity> save(Post post){
		try {
			post.setId(UUIDUtils.getId36());
			post.setCreateTime(new Date());
			post.setStatus(new Integer(1));
			post.setPostType(PostTypeEnum.Default.getValue());
			if (postService.save(post)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PostController's pub is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/post/view.do")
	public String view(HttpServletRequest req){
		
		return "visitor/post/view";
	}
	
}
