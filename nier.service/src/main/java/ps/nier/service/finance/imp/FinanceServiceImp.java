package ps.nier.service.finance.imp;

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
import ps.nier.core.dictionary.FinanceRecordTypeEnum;
import ps.nier.core.domain.finance.Finance;
import ps.nier.core.domain.finance.FinanceQuery;
import ps.nier.service.finance.FinanceRepository;
import ps.nier.service.finance.FinanceService;
@Service
public class FinanceServiceImp implements FinanceService {
    @Autowired
    private FinanceRepository financeRepository;
    @Override
    public Page<Finance> list(FinanceQuery finance) {
        return financeRepository.findAll(new Specification<Finance>(){
            @Override
            public Predicate toPredicate(Root<Finance> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<Predicate>();
                if (StringUtils.isNotBlank(finance.getName())) {
                    predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(finance.getName())));
                }
                Predicate[] p = new Predicate[predicate.size()];
                query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
                return query.getRestriction();
            }
        }, finance);
    }

    @Override
    public List<Finance> listAll() {
        return financeRepository.findAll();
    }

    @Override
    public Finance get(String id) {
        return financeRepository.getOne(id);
    }

    @Override
    public boolean save(Finance finance) {
        return financeRepository.save(finance) != null;
    }

    @Override
    public boolean update(Finance finance) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    @Transactional
    public boolean batchRemove(String[] ids) {
        return financeRepository.deleteByIdIn(ids) > 0;
    }

    @Override
    public boolean isExistedName(String name) {
        return financeRepository.findByName(name) != null;
    }

    @Override
    public boolean updateResidue(double money, String id, Integer type) {
        if (type == FinanceRecordTypeEnum.Income.getValue()) {
            return financeRepository.residueIncome(money, id) > 0;
        } else if (type == FinanceRecordTypeEnum.Expend.getValue()) {
            return financeRepository.residueExpend(money, id) > 0;
        }
        return false;
    }

}
