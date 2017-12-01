package ps.nier.core.domain.financerecord;

import ps.nier.core.domain.base.PageQuery;

public class FinanceRecordQuery extends PageQuery{
    private static final long serialVersionUID = -2239731299612085019L;
    private String financeId;
    private String text;
    
    public String getFinanceId() {
        return financeId;
    }
    public void setFinanceId(String financeId) {
        this.financeId = financeId;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
}
