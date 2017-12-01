package ps.nier.service.financerecord.imp;

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
import ps.nier.core.domain.financerecord.FinanceRecord;
import ps.nier.core.domain.financerecord.FinanceRecordQuery;
import ps.nier.service.financerecord.FinanceRecordRepository;
import ps.nier.service.financerecord.FinanceRecordService;
@Service
public class FinanceRecordServiceImp implements FinanceRecordService {
    @Autowired
    private FinanceRecordRepository financeRecordRepository;
    @Override
    public Page<FinanceRecord> list(FinanceRecordQuery financeRecord) {
        return financeRecordRepository.findAll(new Specification<FinanceRecord>(){
            @Override
            public Predicate toPredicate(Root<FinanceRecord> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<Predicate>();
                if (StringUtils.isNotBlank(financeRecord.getText())) {
                    predicate.add(cb.like(root.get("description").as(String.class), QueryHelper.getFullImplict(financeRecord.getText())));
                }
                if (StringUtils.isNotBlank(financeRecord.getFinanceId())) {
                    predicate.add(cb.equal(root.get("financeId").as(String.class), financeRecord.getFinanceId()));
                }
                Predicate[] p = new Predicate[predicate.size()];
                query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
                return query.getRestriction();
            }
        }, financeRecord);
    }

    @Override
    public List<FinanceRecord> listAll() {
        return financeRecordRepository.findAll();
    }

    @Override
    public FinanceRecord get(String id) {
        return financeRecordRepository.findOne(id);
    }

    @Override
    public boolean save(FinanceRecord financeRecord) {
        return financeRecordRepository.save(financeRecord) != null;
    }

    @Override
    public boolean update(FinanceRecord financeRecord) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    @Transactional
    public boolean batchRemove(String[] ids) {
        return financeRecordRepository.deleteByIdIn(ids) > 0;
    }
}
