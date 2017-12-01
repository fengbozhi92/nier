package ps.nier.core.domain.finance;

import javax.persistence.Entity;
import javax.persistence.Table;

import ps.nier.core.domain.base.DefaultEntity;
@Entity
@Table(name="b_finance")
public class Finance extends DefaultEntity{
    private static final long serialVersionUID = -1740384795988991688L;
    private String name;
    private double residue;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public double getResidue() {
        return residue;
    }
    public void setResidue(double residue) {
        this.residue = residue;
    }
}
