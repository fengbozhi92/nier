package ps.nier.service.role;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ps.nier.core.domain.role.Role;
import ps.nier.core.domain.role.RoleQuery;

public interface RoleService {
	Page<Role> list(RoleQuery role, Pageable page);
}
