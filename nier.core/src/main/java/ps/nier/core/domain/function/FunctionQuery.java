package ps.nier.core.domain.function;

import ps.nier.core.domain.base.PageQuery;

public class FunctionQuery extends PageQuery{
    private static final long serialVersionUID = 1L;
    private String menuCode;
    public String getMenuCode() {
        return menuCode;
    }
    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }
}
