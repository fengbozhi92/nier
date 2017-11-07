package ps.nier.service.post;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.post.Post;

public interface PostRepository extends JpaRepository<Post, String>{
	Page<Post> findAll(Specification<Post> spec, Pageable page);
	
}
