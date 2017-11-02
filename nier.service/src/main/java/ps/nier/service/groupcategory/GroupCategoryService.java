package ps.nier.service.groupcategory;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import ps.nier.core.domain.groupcategory.GroupCategory;
import ps.nier.core.domain.groupcategory.GroupCategoryQuery;

public interface GroupCategoryService {
	
	Page<GroupCategory> list(GroupCategoryQuery groupCategory, Pageable page);
	
	List<GroupCategory> listAll();
	
	GroupCategory get(String id);
	
	boolean save(GroupCategory groupCategory);
	
	boolean update(GroupCategory groupCategory);
	
	boolean batchRemove(String[] ids);
	
	boolean isExistedName(String name);
}
