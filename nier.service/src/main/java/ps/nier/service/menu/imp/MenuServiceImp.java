package ps.nier.service.menu.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ps.nier.core.common.helper.QueryHelper;
import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.menu.MenuQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.menu.MenuRepository;
import ps.nier.service.menu.MenuService;
@Service
public class MenuServiceImp implements MenuService {
	@Autowired
	private MenuRepository menuRepository;
	@Autowired
	private FillService fillService;
	
	@Override
	public Page<Menu> list(MenuQuery menu) {
		Page<Menu> list = menuRepository.findAll(new Specification<Menu>(){
			@Override
			public Predicate toPredicate(Root<Menu> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(menu.getName())) {
					predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(menu.getName())));
				}
				if (menu.getDeleted() != null) {
					predicate.add(cb.equal(root.get("deleted").as(Integer.class), menu.getDeleted()));
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
		List<Menu> menus = menuRepository.findAll();
		Map<String, List<Menu>> map = menus.stream().collect(Collectors.groupingBy(Menu::getParentId));
		List<Menu> tree =  buildingTree("", map);
		return tree;
	}
	
	@Override
	public List<Menu> listByParentId(String parentId) {
		List<Menu> menuList = menuRepository.findAllByParentId(parentId);
		if (menuList != null && !menuList.isEmpty()) {
			for (Menu item : menuList) {
				fillService.fillMenu(item);
			}
			return menuList;
		}
		return null;
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
	@Transactional
	public boolean update(Menu menu) {
		Menu out = get(menu.getId());
		if (out != null) {
			if (StringUtils.isNotBlank(menu.getName())) {
				out.setName(menu.getName());
			}
			if (menu.getDeleted() != null) {
				out.setDeleted(menu.getDeleted());
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
			return save(out);
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
	
	private List<Menu> buildingTree(String parentId, Map<String, List<Menu>> map){	
		return Optional.ofNullable(map.get(parentId)).orElseGet(()->new ArrayList<Menu>())
		.stream().filter(item->item.getParentId().equals(parentId))
		.map(x->{return new Menu(x.getId(), x.getName(), x.getUrl(), x.getParentId(), 
				x.getDepth(), buildingTree(x.getId(), map));}).collect(Collectors.toList());	
	}

}
