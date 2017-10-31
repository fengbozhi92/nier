package ps.nier.service.role.imp;

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
import ps.nier.core.domain.role.Role;
import ps.nier.core.domain.role.RoleQuery;
import ps.nier.service.role.RoleRepository;
import ps.nier.service.role.RoleService;
@Service
public class RoleServiceImp implements RoleService{
	@Autowired
	private RoleRepository roleRepository;
	@Override
	public Page<Role> list(RoleQuery role, Pageable page) {
		Page<Role> list = roleRepository.findAll(new Specification<Role>(){
			@Override
			public Predicate toPredicate(Root<Role> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate nameLike = null;
				if (role != null && StringUtils.isNotBlank(role.getName())) {
					nameLike = cb.like(root.<String>get("name"), QueryHelper.getFullImplict(role.getName()));
				}
				if (nameLike != null) {
					query.where(nameLike);
				}
				return query.getRestriction();
			}		
		}, page);
		return list;
	}

}
