package ps.nier.service.groupcategory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.groupcategory.GroupCategory;

public interface GroupCategoryRepository extends JpaRepository<GroupCategory, String>{
	
	Page<GroupCategory> findAll(Specification<GroupCategory> spec, Pageable page);
	
	GroupCategory findByName(String name);
	
	int deleteByIdIn(String[] ids);
}
