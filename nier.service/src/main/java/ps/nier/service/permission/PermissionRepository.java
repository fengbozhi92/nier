package ps.nier.service.permission;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.permission.Permission;

public interface PermissionRepository extends JpaRepository<Permission, String>{
    Page<Permission> findAll(Specification<Permission> spec, Pageable page);
}
