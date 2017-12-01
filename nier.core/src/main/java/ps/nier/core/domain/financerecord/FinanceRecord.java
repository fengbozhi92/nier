package ps.nier.core.domain.financerecord;

import javax.persistence.Entity;
import javax.persistence.Table;

import ps.nier.core.domain.base.UnitEntity;
@Entity
@Table(name="u_finance_record")
public class FinanceRecord extends UnitEntity{
    private static final long serialVersionUID = -6652771028582830095L;
    private String financeId;
    private Integer type;
    private double money;
    private String description;
    
    public String getFinanceId() {
        return financeId;
    }
    public void setFinanceId(String financeId) {
        this.financeId = financeId;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public double getMoney() {
        return money;
    }
    public void setMoney(double money) {
        this.money = money;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    
}
