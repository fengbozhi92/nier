package ps.nier.service.postthread;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.postthread.PostThread;
import ps.nier.core.domain.postthread.PostThreadQuery;

public interface PostThreadService {
	
	Page<PostThread> list(PostThreadQuery post);
	
	PostThread get(String id);
	
	void updateViewCount(String id);
	void updateReplyCount(String id);
	
	boolean save(PostThread postThread);
	
	boolean remove(String id);
	
}
