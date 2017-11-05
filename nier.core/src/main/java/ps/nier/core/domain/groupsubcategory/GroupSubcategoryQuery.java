package ps.nier.core.domain.groupsubcategory;

import ps.nier.core.domain.base.PageQuery;

public class GroupSubcategoryQuery extends PageQuery{

	private static final long serialVersionUID = -2092118767787174788L;
	
	private String name;
	private Integer status;
	private String groupCategoryId;
	
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
	public String getGroupCategoryId() {
		return groupCategoryId;
	}
	public void setGroupCategoryId(String groupCategoryId) {
		this.groupCategoryId = groupCategoryId;
	}
	
}
