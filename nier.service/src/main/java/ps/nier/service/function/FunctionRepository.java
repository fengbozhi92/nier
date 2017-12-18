package ps.nier.service.function;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.function.Function;
import ps.nier.core.domain.menu.Menu;

public interface FunctionRepository extends JpaRepository<Function, String>{
    Page<Function> findAll(Specification<Function> spec, Pageable page);
    
    Menu findByUrl(String url);
    
    int deleteByIdIn(String[] ids);
}
