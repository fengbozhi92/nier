package ps.nier.core.domain.permission;

import ps.nier.core.domain.base.UnitEntity;

public class Permission extends UnitEntity{
    
    private static final long serialVersionUID = 1L;
    
    private String functionId;
    private Integer role;
    
    public String getFunctionId() {
        return functionId;
    }
    public void setFunctionId(String functionId) {
        this.functionId = functionId;
    }
    public Integer getRole() {
        return role;
    }
    public void setRole(Integer role) {
        this.role = role;
    }
}
