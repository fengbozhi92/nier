package ps.nier.core.domain.function;

import javax.persistence.Entity;
import javax.persistence.Table;

import ps.nier.core.domain.base.DefaultEntity;
@Entity
@Table(name="s_function")
public class Function extends DefaultEntity{

    private static final long serialVersionUID = 1L;
    
    private String name;
    private String remark;
    private String url;
    private String menuCode;

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getMenuCode() {
        return menuCode;
    }
    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }
    
}
