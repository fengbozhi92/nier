package ps.nier.service.user;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.user.User;

public interface UserRepository extends JpaRepository<User, String> {
	
	User findByUsername(String username);
	
	Page<User> findAll(Specification<User> spec, Pageable page);
	
	boolean existsByUsername(String username);
	boolean existsByNickname(String nickname);
	boolean existsByEmail(String email);
}
