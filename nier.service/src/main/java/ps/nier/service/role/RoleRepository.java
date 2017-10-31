package ps.nier.service.role;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.role.Role;

public interface RoleRepository extends JpaRepository<Role, String>{
	Page<Role> findAll(Specification<Role> spec, Pageable page);
}
