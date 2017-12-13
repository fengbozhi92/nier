package ps.nier.service.permission;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.permission.Permission;
import ps.nier.core.domain.permission.PermissionQuery;

public interface PermissionService {
    Page<Permission> list(PermissionQuery permissionQuery);
    
    List<Permission> listAll();
    
    Permission get(String id);
    
    boolean save(Permission permission);
    
    boolean update(Permission permission);
    
    boolean batchRemove(String[] ids);
}
