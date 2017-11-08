package ps.nier.service.group.imp;

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
import org.springframework.transaction.annotation.Transactional;

import ps.nier.core.common.helper.QueryHelper;
import ps.nier.core.domain.group.Group;
import ps.nier.core.domain.group.GroupQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.group.GroupRepository;
import ps.nier.service.group.GroupService;
@Service
public class GroupServiceImp implements GroupService {
	@Autowired
	private GroupRepository groupRepository;
	@Autowired
	private FillService fillService;
	
	@Override
	public Page<Group> list(GroupQuery group) {
		Page<Group> list = groupRepository.findAll(new Specification<Group>(){
			@Override
			public Predicate toPredicate(Root<Group> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(group.getName())) {
					predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(group.getName())));
				}
				if (group.getStatus() != null) {
					predicate.add(cb.equal(root.get("status").as(Integer.class), group.getStatus()));
				}
				if (StringUtils.isNotBlank(group.getCategoryId())) {
					predicate.add(cb.equal(root.get("categoryId").as(String.class), group.getCategoryId()));
				}
				if (StringUtils.isNotBlank(group.getSubcategoryId())) {
					predicate.add(cb.equal(root.get("subcategoryId").as(String.class), group.getSubcategoryId()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, group);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(Group item : list.getContent()) {
				fillService.fillGroup(item);
			}
		}
		return list;
	}

	@Override
	public List<Group> listAll() {
		return groupRepository.findAll();
	}

	@Override
	public Group get(String id) {
		return groupRepository.findOne(id);
	}

	@Override
	public boolean save(Group group) {
		return groupRepository.save(group) != null;
	}

	@Override
	public boolean update(Group group) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@Transactional
	public boolean batchRemove(String[] ids) {
		return groupRepository.deleteByIdIn(ids) > 0;
	}

	@Override
	public boolean isExistedName(String name) {
		return groupRepository.findByName(name) != null;
	}

}
