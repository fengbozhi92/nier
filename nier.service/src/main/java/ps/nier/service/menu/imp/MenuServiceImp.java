package ps.nier.service.menu.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.constant.BusinessConstants;
import ps.nier.core.domain.function.Function;
import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.menu.MenuQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.function.FunctionService;
import ps.nier.service.menu.MenuRepository;
import ps.nier.service.menu.MenuService;
@Service
public class MenuServiceImp implements MenuService {
	@Autowired
	private MenuRepository menuRepository;
	@Autowired
	private FunctionService functionService;
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
				if (StringUtils.isNotBlank(menu.getParentCode())) {
					predicate.add(cb.equal(root.get("parentCode").as(String.class), menu.getParentCode()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, menu);
		return list;
	}

	@Override
	public List<Menu> listAll() {
	    return menuRepository.findAll();
	}
	
	@Override
	public List<Menu> listByParentCode(String parentCode) {
		List<Menu> menuList = menuRepository.findByParentCode(parentCode);
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
	    Menu menu = menuRepository.findOne(id);
	    fillService.fillMenu(menu);
		return menu;
	}
	
    @Override
    public Menu getByCode(String code) {
        return menuRepository.findByCode(code);
    }

	@Override
	@Transactional
	public boolean save(Menu menu) {
		if (menuRepository.save(menu) != null) {
		    Function func = new Function();
		    func.setId(UUIDUtils.getId36());
		    func.setName(BusinessConstants.FUNCTION_DEFAULT_NAME);
		    func.setMenuCode(menu.getCode());
		    func.setUrl(menu.getUrl());
		    func.setCreateTime(menu.getCreateTime());
		    func.setCreateUser(menu.getCreateUser());
		    return functionService.save(func);
		}
		return false;
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
			if (StringUtils.isNotBlank(menu.getParentCode())) {
				out.setParentCode(menu.getParentCode());
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
	@Transactional
	public boolean batchRemove(String[] ids) {
		return menuRepository.deleteByIdIn(ids) > 0;
	}

	@Override
	public boolean isExistedNameAndDepth(String name, Integer depth) {
		return menuRepository.findByNameAndDepth(name, depth) != null;
	}

    @Override
    public List<Menu> getTree() {
        List<Menu> menus = menuRepository.findAll();
        List<Menu> result = null;
        if (menus != null && !menus.isEmpty()) {
            Map<String, Menu> mapping = new HashMap<String, Menu>();
            result = new ArrayList<Menu>();
            for (Menu m : menus) {
                if (m.getDepth() == 1) {
                    mapping.put(m.getCode(), m);
                    result.add(m);
                } else {
                    if (m.getDepth() == 2) {
                        mapping.put(m.getCode(), m);
                    }
                    Menu parent = mapping.get(m.getParentCode());
                    if (parent != null) {
                        parent.addChild(m);
                    }
                }
            }
        }
        return result;
    }
}
