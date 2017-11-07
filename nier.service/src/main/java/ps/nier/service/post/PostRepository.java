//package ps.nier.service.post;
//
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
//import org.springframework.data.jpa.domain.Specification;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
//import org.springframework.data.jpa.repository.Query;
//
//import ps.nier.core.domain.post.Post;
//
//public interface PostRepository extends JpaRepository<Post, String>{
//	
//	Page<Post> findAll(Specification<Post> spec, Pageable page);
//	
//	@Modifying
//	@Query(value="update Post set view_count = view_count+1 where id = ?1")
//	int updateViewCountById(String id);
//	@Modifying
//	@Query(value="update Post set reply_count = reply_count+1 where id = ?1")
//	int updateReplyCountById(String id);
//	
//}
