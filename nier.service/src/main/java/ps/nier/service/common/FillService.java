package ps.nier.service.common;

import ps.nier.core.domain.group.Group;
import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.post.Post;
import ps.nier.core.domain.postreply.PostReply;
import ps.nier.core.domain.postthread.PostThread;

public interface FillService {
	void fillGroupSubcategory(GroupSubcategory item);
	void fillMenu(Menu item);
	void fillGroup(Group item);
	void fillPostThread(PostThread item);
	void fillPost(Post item);
	void fillPostReply(PostReply item);
}
