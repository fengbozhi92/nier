package ps.nier.core.domain.codegenerator;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="t_code_generator")
public class CodeGenerator implements Serializable{
    private static final long serialVersionUID = 1L;
    @Id
    private String id;
    private Integer type;
    private String parentCode;
    private String lastCode;
    private int version = 1;
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public String getParentCode() {
        return parentCode;
    }
    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }
    public String getLastCode() {
        return lastCode;
    }
    public void setLastCode(String lastCode) {
        this.lastCode = lastCode;
    }
    public int getVersion() {
        return version;
    }
    public void setVersion(int version) {
        this.version = version;
    }

}
