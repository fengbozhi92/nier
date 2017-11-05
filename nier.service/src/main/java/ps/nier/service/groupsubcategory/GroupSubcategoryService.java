package ps.nier.service.groupsubcategory;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.core.domain.groupsubcategory.GroupSubcategoryQuery;

public interface GroupSubcategoryService {
	
	Page<GroupSubcategory> list(GroupSubcategoryQuery groupSubcategory);
	
	List<GroupSubcategory> listAll();
	
	GroupSubcategory get(String id);
	
	boolean save(GroupSubcategory groupSubcategory);
	
	boolean update(GroupSubcategory groupSubcategory);
	
	boolean batchRemove(String[] ids);
	
	boolean isExistedName(String name);
}
