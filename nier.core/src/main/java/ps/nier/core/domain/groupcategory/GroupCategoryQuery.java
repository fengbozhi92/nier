package ps.nier.core.domain.groupcategory;

import ps.nier.core.domain.base.PageQuery;

public class GroupCategoryQuery extends PageQuery{
	
	private static final long serialVersionUID = -1309349282868705951L;
	
	private String name;
	private Integer deleted;
	
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

}
