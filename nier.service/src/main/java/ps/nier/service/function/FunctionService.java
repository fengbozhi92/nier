package ps.nier.service.function;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.function.Function;
import ps.nier.core.domain.function.FunctionQuery;

public interface FunctionService {
    
    Page<Function> list(FunctionQuery function);
    
    List<Function> listAll();
    
    Function get(String id);
    
    boolean save(Function function);
    
    boolean update(Function function);
    
    boolean batchRemove(String[] ids);
    
    boolean isExistedUrl(String url);
}
