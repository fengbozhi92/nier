package ps.nier.service.groupsubcategory.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import ps.nier.core.common.helper.QueryHelper;
import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.core.domain.groupsubcategory.GroupSubcategoryQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.groupsubcategory.GroupSubcategoryRepository;
import ps.nier.service.groupsubcategory.GroupSubcategoryService;
@Service
public class GroupSubcategoryServiceImp implements GroupSubcategoryService {
	@Autowired
	private GroupSubcategoryRepository groupSubcategoryRepository;
	@Autowired
	private FillService fillService;
	
	@Override
	public Page<GroupSubcategory> list(GroupSubcategoryQuery groupSubcategory) {
		Page<GroupSubcategory> list = groupSubcategoryRepository.findAll(new Specification<GroupSubcategory>(){
			@Override
			public Predicate toPredicate(Root<GroupSubcategory> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(groupSubcategory.getName())) {
					predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(groupSubcategory.getName())));
				}
				if (groupSubcategory.getStatus() != null) {
					predicate.add(cb.equal(root.get("status").as(Integer.class), groupSubcategory.getStatus()));
				}
				if (StringUtils.isNotBlank(groupSubcategory.getGroupCategoryId())) {
					predicate.add(cb.equal(root.get("groupCategoryId").as(String.class), groupSubcategory.getGroupCategoryId()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, groupSubcategory);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(GroupSubcategory item : list.getContent()) {
				fillService.fillGroupSubcategory(item);
			}
		}
		return list;
	}

	@Override
	public List<GroupSubcategory> listAll() {
		return groupSubcategoryRepository.findAll();
	}
	
	@Override
	public List<GroupSubcategory> listByCategoryId(String categoryId) {
		return groupSubcategoryRepository.findAllByGroupCategoryId(categoryId);
	}
	
	@Override
	public GroupSubcategory get(String id) {
		return groupSubcategoryRepository.getOne(id);
	}

	@Override
	public boolean save(GroupSubcategory groupSubcategory) {
		return groupSubcategoryRepository.save(groupSubcategory) != null;
	}

	@Override
	public boolean update(GroupSubcategory groupSubcategory) {
		GroupSubcategory out = get(groupSubcategory.getId());
		if (out != null) {
			if (StringUtils.isNotBlank(groupSubcategory.getName())) {
				out.setName(groupSubcategory.getName());
			}
			if (groupSubcategory.getStatus() != null) {
				out.setStatus(groupSubcategory.getStatus());
			}
			if (StringUtils.isNotBlank(groupSubcategory.getGroupCategoryId())) {
				out.setGroupCategoryId(groupSubcategory.getGroupCategoryId());
			}
			out.setModifyTime(groupSubcategory.getModifyTime());
			out.setModifyUser(groupSubcategory.getModifyUser());
			out.setVersion(out.getVersion()+1);
			return groupSubcategoryRepository.save(out) != null;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean batchRemove(String[] ids) {
		return groupSubcategoryRepository.deleteByIdIn(ids) > 0;
	}

	@Override
	public boolean isExistedName(String name) {
		return groupSubcategoryRepository.findByName(name) != null;
	}

}
