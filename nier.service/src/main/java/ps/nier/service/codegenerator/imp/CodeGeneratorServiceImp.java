package ps.nier.service.codegenerator.imp;

import java.util.concurrent.locks.ReentrantLock;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.CodeTypeEnum;
import ps.nier.core.domain.codegenerator.CodeGenerator;
import ps.nier.service.codegenerator.CodeGeneratorRepository;
import ps.nier.service.codegenerator.CodeGeneratorService;
@Service
public class CodeGeneratorServiceImp implements CodeGeneratorService {
    private final ReentrantLock muneLock = new ReentrantLock();
    
    @Autowired
    private CodeGeneratorRepository codeGeneratorRepository;
    
    @Override
    public String getCode(Integer type, String parentCode) {
        String code = null;
        muneLock.lock();
        try {
            String last = codeGeneratorRepository.getLast(type, parentCode);
            if (StringUtils.isNotEmpty(last)) {
                String next = String.format(CodeTypeEnum.parse(type).getFormat(), (Integer.valueOf(last) + 1));
                if (codeGeneratorRepository.updateLast(next, type, parentCode) == 1) {
                    code = parentCode + next;
                }
            } else {
                String next = String.format(CodeTypeEnum.parse(type).getFormat(), 1);
                CodeGenerator data = new CodeGenerator();
                data.setId(UUIDUtils.getId36());
                data.setType(type);
                data.setParentCode(parentCode);
                data.setLastCode(next);
                data.setVersion(1);
                if (codeGeneratorRepository.save(data) != null) {
                    code = parentCode + next;
                }
            }
        } catch (Throwable t) {
            t.printStackTrace();
            
        } finally {
            muneLock.unlock();
        }
        return code;
    }

}
