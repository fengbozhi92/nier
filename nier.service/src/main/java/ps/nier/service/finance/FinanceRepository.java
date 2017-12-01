package ps.nier.service.finance;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import ps.nier.core.domain.finance.Finance;

public interface FinanceRepository extends JpaRepository<Finance, String>{
    Page<Finance> findAll(Specification<Finance> spec, Pageable page);
    
    Finance findByName(String name);
    
    int deleteByIdIn(String[] ids);
    
    @Modifying
    @Query(nativeQuery = true, value="update b_finance set residue= residue+?1 where id=?2")
    int residueIncome(double finance, String id);
    
    @Modifying
    @Query(nativeQuery = true, value="update b_finance set residue= residue-?1 where id=?2")
    int residueExpend(double finance, String id);
}
