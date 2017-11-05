package ps.nier.service.group;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.group.Group;
import ps.nier.core.domain.group.GroupQuery;

public interface GroupService {
	
	Page<Group> list(GroupQuery group);
	
	List<Group> listAll();
	
	Group get(String id);
	
	boolean save(Group group);
	
	boolean update(Group group);
	
	boolean batchRemove(String[] ids);
	
	boolean isExistedName(String name);
}
