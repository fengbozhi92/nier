package ps.nier.service.financerecord;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.financerecord.FinanceRecord;
import ps.nier.core.domain.financerecord.FinanceRecordQuery;

public interface FinanceRecordService {
    Page<FinanceRecord> list(FinanceRecordQuery financeRecord);
    
    List<FinanceRecord> listAll();
    
    FinanceRecord get(String id);
    
    boolean save(FinanceRecord financeRecord);
    
    boolean update(FinanceRecord financeRecord);
    
    boolean batchRemove(String[] ids);
}
