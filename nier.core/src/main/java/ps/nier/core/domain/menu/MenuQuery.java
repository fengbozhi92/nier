package ps.nier.core.domain.menu;

import ps.nier.core.domain.base.PageQuery;

public class MenuQuery extends PageQuery{
	
	private static final long serialVersionUID = -1620619438203151447L;
	
	private String name;
	private Integer deleted;
	private String parentCode;
	private Integer depth;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public Integer getDepth() {
		return depth;
	}
	public void setDepth(Integer depth) {
		this.depth = depth;
	}
}
