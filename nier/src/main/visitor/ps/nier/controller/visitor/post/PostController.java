package ps.nier.controller.visitor.post;

import java.util.Date;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.controller.base.BaseController;
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.DeletedEnum;
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
	public ResponseEntity<ResEntity> pub(Post post){
		try {
			post.setId(UUIDUtils.getId36());
			post.setCreateTime(new Date());
			post.setDeleted(DeletedEnum.NotDelete.getValue());
			post.setType(PostTypeEnum.Default.getValue());
			int sequence = postService.getLastSequenceByThreadId(post.getThreadId()) + 1;
			post.setSequence(sequence);
			if (postService.save(post)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PostController's pub is error!", t);
		}
		return renderError();
	}
	
}
