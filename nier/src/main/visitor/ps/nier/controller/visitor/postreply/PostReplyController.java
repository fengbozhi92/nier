package ps.nier.controller.visitor.postreply;

import java.util.Date;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.controller.base.BaseController;
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.StatusEnum;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.post.Post;
import ps.nier.core.domain.postreply.PostReply;
import ps.nier.core.domain.postreply.PostReplyQuery;
import ps.nier.service.post.PostService;
import ps.nier.service.postreply.PostReplyService;

@Controller
public class PostReplyController extends BaseController{
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(PostReplyController.class);
	@Autowired
	private PostService postService;
	@Autowired
	private PostReplyService postReplyService;
	
	@RequestMapping(value="/postreply/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody PostReplyQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("PostReplyController's ajaxList is error!", t);
		}
		return renderData(postReplyService.list(query));
	}
	
	@RequestMapping(value="/postreply/pub.do")
	public ResponseEntity<ResEntity> pub(PostReply postReply){
		String targetId = postReply.getTargetId();
		if (targetId != null && targetId.length() == 36) {
			try {
				Post post = postService.get(targetId);
				if (post != null) {
					postReply.setGroupId(post.getGroupId());
					postReply.setThreadId(post.getThreadId());
					postReply.setId(UUIDUtils.getId36());
					postReply.setCreateTime(new Date());
					postReply.setStatus(StatusEnum.Valid.getValue());
					if (postReplyService.save(postReply)) {
						return renderSuccess();
					}
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("PostReplyController's pub is error!", t);
			}
		}
		return renderError();
	}
	
}
