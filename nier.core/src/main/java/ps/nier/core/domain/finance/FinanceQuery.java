package ps.nier.core.domain.finance;

import ps.nier.core.domain.base.PageQuery;

public class FinanceQuery extends PageQuery{
    private static final long serialVersionUID = -9158191100678984885L;
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
