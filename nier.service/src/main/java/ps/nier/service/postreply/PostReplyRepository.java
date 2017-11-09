package ps.nier.service.postreply;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import ps.nier.core.domain.postreply.PostReply;

public interface PostReplyRepository extends JpaRepository<PostReply, String>{
	
	Page<PostReply> findAll(Specification<PostReply> spec, Pageable page);
	
	@Query(nativeQuery = true, value="select count(*) from b_post_reply where post_id = ?1 limit 1")
	int isExistedByPostId(String postId);
}
