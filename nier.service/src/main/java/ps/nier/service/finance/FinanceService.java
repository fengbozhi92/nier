package ps.nier.service.finance;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.finance.Finance;
import ps.nier.core.domain.finance.FinanceQuery;

public interface FinanceService {
    Page<Finance> list(FinanceQuery finance);
    
    List<Finance> listAll();
    
    Finance get(String id);
    
    boolean save(Finance finance);
    
    boolean update(Finance finance);
    boolean updateResidue(double finance, String id, Integer type);
    
    boolean batchRemove(String[] ids);
    
    boolean isExistedName(String name);
}
