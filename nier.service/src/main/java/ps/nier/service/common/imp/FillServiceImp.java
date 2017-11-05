package ps.nier.service.common.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ps.nier.core.domain.groupcategory.GroupCategory;
import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.service.common.FillService;
import ps.nier.service.groupcategory.GroupCategoryService;
@Component
public class FillServiceImp implements FillService{
	@Autowired
	private GroupCategoryService groupCategoryService;
	@Override
	public void fillGroupSubcategory(GroupSubcategory item) {
		if (item != null) {
			GroupCategory groupCategory = groupCategoryService.get(item.getGroupCategoryId());
			if (groupCategory != null) {
				item.setGroupCategoryName(groupCategory.getName());
			}
		}
		
	}

}
