package ps.nier.core.domain.groupcategory;

import ps.nier.core.domain.base.PageQuery;

public class GroupCategoryQuery extends PageQuery{
	
	private static final long serialVersionUID = -1309349282868705951L;
	
	private String name;
	private Integer status;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
