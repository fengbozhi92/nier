package ps.nier.core.domain.permission;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import ps.nier.core.domain.base.UnitEntity;
import ps.nier.core.domain.function.Function;
@Entity
@Table(name="s_permission")
public class Permission extends UnitEntity{
    
    private static final long serialVersionUID = 1L;
    
    private String functionId;
    private Integer role;
    
    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="id",table="s_function")
    private Function function;
    
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
    public Function getFunction() {
        return function;
    }
    public void setFunction(Function function) {
        this.function = function;
    }
}
