package ps.nier.service.common.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ps.nier.core.domain.group.Group;
import ps.nier.core.domain.groupcategory.GroupCategory;
import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.post.Post;
import ps.nier.core.domain.user.User;
import ps.nier.service.common.FillService;
import ps.nier.service.groupcategory.GroupCategoryService;
import ps.nier.service.groupsubcategory.GroupSubcategoryService;
import ps.nier.service.menu.MenuService;
import ps.nier.service.user.UserService;
@Component
public class FillServiceImp implements FillService{
	@Autowired
	private GroupCategoryService groupCategoryService;
	@Autowired
	private GroupSubcategoryService groupSubcategoryService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	
	@Override
	public void fillGroupSubcategory(GroupSubcategory item) {
		if (item != null) {
			GroupCategory groupCategory = groupCategoryService.get(item.getGroupCategoryId());
			if (groupCategory != null) {
				item.setGroupCategoryName(groupCategory.getName());
			}
		}
		
	}
	@Override
	public void fillMenu(Menu item) {
		if (item != null) {
			Menu menu = menuService.get(item.getParentId());
			if (menu != null) {
				item.setParentName(menu.getName());
			}
		}
		
	}
	@Override
	public void fillGroup(Group item) {
		if (item != null) {
			GroupCategory groupCategory = groupCategoryService.get(item.getCategoryId());
			if (groupCategory != null) {
				item.setCategoryName(groupCategory.getName());
				GroupSubcategory groupSubcategory = groupSubcategoryService.get(item.getSubcategoryId());
				if (groupSubcategory != null) {
					item.setSubcategoryName(groupSubcategory.getName());
				}
			}
		}
	}
	@Override
	public void fillPost(Post item) {
		if (item != null) {
			User user = userService.get(item.getUserId());
			if (user != null) {
				item.setUserNickname(user.getNickname());
			}
		}		
	}

}
