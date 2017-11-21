package ps.nier.service.groupcategory.imp;

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
import ps.nier.core.domain.groupcategory.GroupCategory;
import ps.nier.core.domain.groupcategory.GroupCategoryQuery;
import ps.nier.service.groupcategory.GroupCategoryRepository;
import ps.nier.service.groupcategory.GroupCategoryService;
@Service
public class GroupCategoryServiceImp implements GroupCategoryService{
	@Autowired
	private GroupCategoryRepository groupCategoryRepository;
//	@Autowired
//	private FillService fillService;
	
	@Override
	public Page<GroupCategory> list(GroupCategoryQuery groupCategory) {
		return groupCategoryRepository.findAll(new Specification<GroupCategory>(){
			@Override
			public Predicate toPredicate(Root<GroupCategory> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(groupCategory.getName())) {
					predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(groupCategory.getName())));
				}
				if (groupCategory.getDeleted() != null) {
					predicate.add(cb.equal(root.get("deleted").as(Integer.class), groupCategory.getDeleted()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, groupCategory);
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
		GroupCategory out = get(groupCategory.getId());
		if (out != null) {
			if (StringUtils.isNotBlank(groupCategory.getName())) {
				out.setName(groupCategory.getName());
			}
			if (groupCategory.getDeleted() != null) {
				out.setDeleted(groupCategory.getDeleted());
			}
			out.setModifyTime(groupCategory.getModifyTime());
			out.setModifyUser(groupCategory.getModifyUser());
			out.setVersion(out.getVersion()+1);
			return groupCategoryRepository.save(out) != null;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean batchRemove(String[] ids) {
		return groupCategoryRepository.deleteByIdIn(ids) > 0;
	}

	@Override
	public boolean isExistedName(String name) {
		return groupCategoryRepository.findByName(name) != null;
	}

}
