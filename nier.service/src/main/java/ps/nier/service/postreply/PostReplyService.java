package ps.nier.service.postreply;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.postreply.PostReply;
import ps.nier.core.domain.postreply.PostReplyQuery;

public interface PostReplyService {
	
	Page<PostReply> list(PostReplyQuery postReply);
	
	PostReply get(String id);
	
	boolean save(PostReply post);
	
	boolean remove(String id);
	
	boolean isExistedByPostId(String postId);
}
