package ps.nier.service.financerecord;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.financerecord.FinanceRecord;

public interface FinanceRecordRepository extends JpaRepository<FinanceRecord, String>{
    Page<FinanceRecord> findAll(Specification<FinanceRecord> spec, Pageable page);
    
    int deleteByIdIn(String[] ids);

}
