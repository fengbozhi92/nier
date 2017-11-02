package ps.nier.service.groupcategory.imp;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import ps.nier.core.common.helper.QueryHelper;
import ps.nier.core.domain.groupcategory.GroupCategory;
import ps.nier.core.domain.groupcategory.GroupCategoryQuery;
import ps.nier.service.groupcategory.GroupCategoryRepository;
import ps.nier.service.groupcategory.GroupCategoryService;
@Service
public class GroupCategoryServiceImp implements GroupCategoryService{
	@Autowired
	private GroupCategoryRepository groupCategoryRepository;
	@Override
	public Page<GroupCategory> list(GroupCategoryQuery groupCategory, Pageable page) {
		return groupCategoryRepository.findAll(new Specification<GroupCategory>(){
			@Override
			public Predicate toPredicate(Root<GroupCategory> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate nameLike = null;
				if (groupCategory != null && StringUtils.isNotBlank(groupCategory.getName())) {
					nameLike = cb.like(root.<String>get("name"), QueryHelper.getFullImplict(groupCategory.getName()));
				}
				if (nameLike != null) {
					query.where(nameLike);
				}
				return query.getRestriction();
			}
			
		}, page);
	}

	@Override
	public List<GroupCategory> listAll() {
		return groupCategoryRepository.findAll();
	}

	@Override
	public GroupCategory get(String id) {
		return groupCategoryRepository.findOne(id);
	}

	@Override
	public boolean save(GroupCategory groupCategory) {
		return groupCategoryRepository.save(groupCategory) != null;
	}

	@Override
	public boolean update(GroupCategory groupCategory) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean batchRemove(String[] ids) {
		return groupCategoryRepository.deleteByIdIn(ids) > 0;
	}

	@Override
	public boolean isExistedName(String name) {
		return groupCategoryRepository.findByName(name) != null;
	}

}
