package ps.nier.service.menu;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.menu.Menu;

public interface MenuRepository extends JpaRepository<Menu, String>{
	Page<Menu> findAll(Specification<Menu> spec, Pageable page);
	List<Menu> findByParentCode(String parentCode);
	
	Menu findByCode(String code);
	Menu findByNameAndDepth(String name, Integer depth);
	
	int deleteByIdIn(String[] ids);
}
