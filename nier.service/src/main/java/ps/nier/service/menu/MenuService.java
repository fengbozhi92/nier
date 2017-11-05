package ps.nier.service.menu;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.menu.MenuQuery;

public interface MenuService {
	
	Page<Menu> list(MenuQuery menu);
	
	List<Menu> listAll();
	List<Menu> listByParentId(String parentId);
	
	Menu get(String id);
	
	boolean save(Menu menu);
	
	boolean update(Menu menu);
	
	boolean batchRemove(String[] ids);
	
	boolean isExistedNameAndDepth(String name, Integer depth);
}
