package ps.nier.service.common.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import ps.nier.core.domain.group.Group;
import ps.nier.core.domain.groupcategory.GroupCategory;
import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.photo.Photo;
import ps.nier.core.domain.photoalbum.PhotoAlbum;
import ps.nier.core.domain.post.Post;
import ps.nier.core.domain.postreply.PostReply;
import ps.nier.core.domain.postreply.PostReplyQuery;
import ps.nier.core.domain.postthread.PostThread;
import ps.nier.core.domain.user.User;
import ps.nier.service.common.FillService;
import ps.nier.service.group.GroupService;
import ps.nier.service.groupcategory.GroupCategoryService;
import ps.nier.service.groupsubcategory.GroupSubcategoryService;
import ps.nier.service.menu.MenuService;
import ps.nier.service.postreply.PostReplyService;
import ps.nier.service.user.UserService;
@Component
public class FillServiceImp implements FillService{
	@Autowired
	private GroupService groupService;
	@Autowired
	private GroupCategoryService groupCategoryService;
	@Autowired
	private GroupSubcategoryService groupSubcategoryService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	@Autowired
	private PostReplyService postReplyService;
	
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
	public void fillPostThread(PostThread item) {
		if (item != null) {
			User user = userService.get(item.getCreateUser());
			Group group = groupService.get(item.getGroupId());
			if (user != null) {
				item.setUserNickname(user.getNickname());
			}
			if (group != null) {
				item.setGroupName(group.getName());
			}
		}		
	}
	
	@Override
	public void fillPost(Post item) {
		if (item != null) {
			item.setUser(userService.get(item.getCreateUser()));
			Page<PostReply> page = postReplyService.list(new PostReplyQuery(item.getId()));
			if (page != null && page.getContent() != null && !page.getContent().isEmpty()) {
				item.setReplys(page.getContent());
				item.setExistedReply(true);
			} else {
				item.setExistedReply(false);
			}
		}		
	}
	
	@Override
	public void fillPostReply(PostReply item) {
		if (item != null) {
			if (item.getTargetUserId() != null && item.getTargetUserId().length() == 36) {
				User replyUser = userService.get(item.getTargetUserId());
				if (replyUser != null) {
					item.setTargetUserNickname(replyUser.getNickname());
				}
			}
			User createUser = userService.get(item.getCreateUser());	
			if (createUser != null) {
				item.setUserNickname(createUser.getNickname());
			}
		}		
	}

	@Override
	public void fillPhotoAlbum(PhotoAlbum item) {
		if (item != null) {
			User user = userService.get(item.getCreateUser());
			if (user != null) {
				item.setCreateUserNickname(user.getNickname());
			}
		}
	}

	@Override
	public void fillPhoto(Photo item) {
		if (item != null) {
			User user = userService.get(item.getCreateUser());
			if (user != null) {
				item.setCreateUserNickname(user.getNickname());
			}
		}
	}
}
