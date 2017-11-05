package ps.nier.service.groupsubcategory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.groupsubcategory.GroupSubcategory;

public interface GroupSubcategoryRepository extends JpaRepository<GroupSubcategory, String>{
	Page<GroupSubcategory> findAll(Specification<GroupSubcategory> spec, Pageable page);
	
	GroupSubcategory findByName(String name);
	
	int deleteByIdIn(String[] ids);
}
