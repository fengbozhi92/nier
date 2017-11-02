package ps.nier.service.groupsubcategory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.core.domain.groupsubcategory.GroupSubcategoryQuery;

public interface GroupSubcategoryService {
	
	Page<GroupSubcategory> list(GroupSubcategoryQuery groupSubcategory, Pageable page);
}
