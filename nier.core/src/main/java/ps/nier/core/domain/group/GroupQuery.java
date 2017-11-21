package ps.nier.core.domain.group;

import ps.nier.core.domain.base.PageQuery;

public class GroupQuery extends PageQuery{
	private static final long serialVersionUID = -3894027469566184252L;
	
	private String name;
	private String categoryId;
	private String subcategoryId;
	private Integer deleted;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getSubcategoryId() {
		return subcategoryId;
	}
	public void setSubcategoryId(String subcategoryId) {
		this.subcategoryId = subcategoryId;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}
}
