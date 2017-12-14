package ps.nier.service.codegenerator;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import ps.nier.core.domain.codegenerator.CodeGenerator;

public interface CodeGeneratorRepository extends JpaRepository<CodeGenerator, String>{
    
    @Query(nativeQuery=true,value="select last_code from t_code_generator where type=?1 and parent_code=?2")
    String getLast(Integer type, String parentCode);
    
    @Modifying
    @Transactional
    @Query(nativeQuery=true,value="update t_code_generator set last_code=?1, version=version+1 where type=?2 and parent_code=?3")
    int updateLast(String code, Integer type, String parentCode);
}
