package ps.nier.service.postthread;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.postthread.PostThread;
import ps.nier.core.domain.postthread.PostThreadQuery;

public interface PostThreadService {
	
	Page<PostThread> list(PostThreadQuery post);
	
	PostThread get(String id);
	
	void updateViewNum(String id);
	void updateReplyNum(String id);
	
	boolean save(PostThread postThread);
	
	boolean remove(String id);
	
}
