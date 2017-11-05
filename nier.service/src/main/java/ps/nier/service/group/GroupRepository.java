package ps.nier.service.group;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.group.Group;

public interface GroupRepository extends JpaRepository<Group, String>{
	
	Page<Group> findAll(Specification<Group> spec, Pageable page);
	
	Group findByName(String name);
	
	int deleteByIdIn(String[] ids);
}
