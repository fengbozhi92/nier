package ps.nier.service.function.imp;

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
import ps.nier.core.domain.function.Function;
import ps.nier.core.domain.function.FunctionQuery;
import ps.nier.service.function.FunctionRepository;
import ps.nier.service.function.FunctionService;
@Service
public class FunctionServiceImp implements FunctionService{
    @Autowired
    private FunctionRepository functionRepository;
    
    @Override
    public Page<Function> list(FunctionQuery function) {
        Page<Function> list = functionRepository.findAll(new Specification<Function>(){
            @Override
            public Predicate toPredicate(Root<Function> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<Predicate>();
                predicate.add(cb.equal(root.get("menuCode").as(String.class), QueryHelper.getFullImplict(function.getMenuCode())));
                
                Predicate[] p = new Predicate[predicate.size()];
                query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
                return query.getRestriction();
            }
        }, function);
        return list;
    }

    @Override
    public List<Function> listAll() {
        return functionRepository.findAll();
    }

    @Override
    public Function get(String id) {
        return functionRepository.findOne(id);
    }

    @Override
    public boolean save(Function function) {
        return functionRepository.save(function) != null;
    }

    @Override
    @Transactional
    public boolean update(Function function) {
        Function out = functionRepository.findOne(function.getId());
        if (out != null) {
            if (StringUtils.isNotBlank(function.getRemark())) {
                out.setRemark(function.getRemark());
            }
            if (StringUtils.isNotBlank(function.getName())) {
                out.setName(function.getName());
            }
            return functionRepository.saveAndFlush(out) != null;
        }
        return false;
    }

    @Override
    public boolean batchRemove(String[] ids) {
        return functionRepository.deleteByIdIn(ids)>0;
    }

    @Override
    public boolean isExistedUrl(String url) {
        return functionRepository.findByUrl(url) != null;
    }

}