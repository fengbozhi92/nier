package ps.nier.service.postthread;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import ps.nier.core.domain.postthread.PostThread;

public interface PostThreadRepository extends JpaRepository<PostThread, String>{
	
	Page<PostThread> findAll(Specification<PostThread> spec, Pageable page);
	
	@Modifying
	@Query(value="update PostThread set view_count = view_count+1 where id = ?1")
	int updateViewCountById(String id);
	@Modifying
	@Query(value="update PostThread set reply_count = reply_count+1 where id = ?1")
	int updateReplyCountById(String id);
	
}
