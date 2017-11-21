package ps.nier.service.post;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.post.Post;
import ps.nier.core.domain.post.PostQuery;

public interface PostService {
	
	Page<Post> list(PostQuery post);
	
	Post get(String id);
	int getLastSequenceByThreadId(String id);
	
	void updateReplyNum(String id);
	void updateLikeNum(String id);
	void updateDislikeNum(String id);
	
	boolean save(Post post);
	
	boolean remove(String id);
	
}
