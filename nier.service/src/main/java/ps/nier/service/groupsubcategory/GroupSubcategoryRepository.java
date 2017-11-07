package ps.nier.service.groupsubcategory;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.groupsubcategory.GroupSubcategory;

public interface GroupSubcategoryRepository extends JpaRepository<GroupSubcategory, String>{
	
	Page<GroupSubcategory> findAll(Specification<GroupSubcategory> spec, Pageable page);
	List<GroupSubcategory> findAllByGroupCategoryId(String categoryId);
	
	GroupSubcategory findByName(String name);
	
	int deleteByIdIn(String[] ids);
}
