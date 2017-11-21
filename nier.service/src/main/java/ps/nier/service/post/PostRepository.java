package ps.nier.service.post;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import ps.nier.core.domain.post.Post;

public interface PostRepository extends JpaRepository<Post, String>{
	
	Page<Post> findAll(Specification<Post> spec, Pageable page);
	
	
	@Modifying
	@Query(nativeQuery = true, value="update b_post set reply_num = reply_num+1 where id = ?1")
	int updateReplyNumById(String id);
	@Modifying
	@Query(nativeQuery = true, value="update b_post set like_num = like_num+1 where id = ?1")
	int updateLikeNumById(String id);
	@Modifying
	@Query(nativeQuery = true, value="update b_post set dislike_num = dislike_num+1 where id = ?1")
	int updateDislikeNumById(String id);
	
	@Query(nativeQuery = true, value="select sequence from b_post where type = 1 and thread_id = ?1 order by sequence desc limit 1")
	int getLastSequenceByThreadId(String threadId);
	
	@Query(nativeQuery = true, value="select user_id, create_time from b_post where thread_id = ?1 order by create_time desc limit 1")
	int getLastPostByThreadId(String threadId);
}
