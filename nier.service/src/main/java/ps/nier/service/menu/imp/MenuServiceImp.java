package ps.nier.service.menu.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import ps.nier.core.common.helper.QueryHelper;
import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.menu.MenuQuery;
import ps.nier.service.menu.MenuRepository;
import ps.nier.service.menu.MenuService;
@Service
public class MenuServiceImp implements MenuService {
	@Autowired
	private MenuRepository menuRepository;
	
	@Override
	public Page<Menu> list(MenuQuery menu) {
		Page<Menu> list = menuRepository.findAll(new Specification<Menu>(){
			@Override
			public Predicate toPredicate(Root<Menu> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(menu.getName())) {
					predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(menu.getName())));
				}
				if (menu.getStatus() != null) {
					predicate.add(cb.equal(root.get("status").as(Integer.class), menu.getStatus()));
				}
				if (menu.getDepth() != null) {
					predicate.add(cb.equal(root.get("depth").as(Integer.class), menu.getDepth()));
				}
				if (StringUtils.isNotBlank(menu.getParentId())) {
					predicate.add(cb.equal(root.get("parentId").as(String.class), menu.getParentId()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, menu);
//		if (list.getContent() != null && !list.getContent().isEmpty()) {
//			for(GroupSubcategory item : list.getContent()) {
//				fillService.fillGroupSubcategory(item);
//			}
//		}
		return list;
	}

	@Override
	public List<Menu> listAll() {
		return menuRepository.findAll();
	}
	
	@Override
	public List<Menu> listByParentId(String parentId) {
		return menuRepository.findAllByParentId(parentId);
	}

	@Override
	public Menu get(String id) {
		return menuRepository.findOne(id);
	}

	@Override
	public boolean save(Menu menu) {
		return menuRepository.save(menu) != null;
	}

	@Override
	public boolean update(Menu menu) {
		Menu out = get(menu.getId());
		if (out != null) {
			if (StringUtils.isNotBlank(menu.getName())) {
				out.setName(menu.getName());
			}
			if (menu.getStatus() != null) {
				out.setStatus(menu.getStatus());
			}
			if (StringUtils.isNotBlank(menu.getParentId())) {
				out.setParentId(menu.getParentId());
			}
			if (menu.getDepth() != null) {
				out.setDepth(menu.getDepth());
			}
			out.setModifyTime(menu.getModifyTime());
			out.setModifyUser(menu.getModifyUser());
			out.setVersion(out.getVersion()+1);
			return menuRepository.save(out) != null;
		}
		return false;
	}

	@Override
	public boolean batchRemove(String[] ids) {
		return menuRepository.deleteByIdIn(ids) > 0;
	}

	@Override
	public boolean isExistedNameAndDepth(String name, Integer depth) {
		return menuRepository.findByNameAndDepth(name, depth) != null;
	}

}
