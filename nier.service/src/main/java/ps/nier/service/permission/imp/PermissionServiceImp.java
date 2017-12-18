package ps.nier.service.permission.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import ps.nier.core.domain.permission.Permission;
import ps.nier.core.domain.permission.PermissionQuery;
import ps.nier.service.permission.PermissionRepository;
import ps.nier.service.permission.PermissionService;
@Service
public class PermissionServiceImp implements PermissionService {
    @Autowired
    private PermissionRepository permissionRepository;
    @Override
    public Page<Permission> list(PermissionQuery permission) {
        Page<Permission> list = permissionRepository.findAll(new Specification<Permission>(){
            @Override
            public Predicate toPredicate(Root<Permission> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<Predicate>();
                Predicate[] p = new Predicate[predicate.size()];
                query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
                return query.getRestriction();
            }
        }, permission);
        return list;
    }

    @Override
    public List<Permission> listAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Permission get(String id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean save(Permission permission) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean update(Permission permission) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean batchRemove(String[] ids) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public Map<Integer, List<Permission>> getAllMapping() {
        List<Permission> permissions = permissionRepository.findAll();
        if (permissions != null && !permissions.isEmpty()) {
            return permissions.stream().collect(Collectors.groupingBy(Permission::getRole));
        }
        return null;
    }

}
