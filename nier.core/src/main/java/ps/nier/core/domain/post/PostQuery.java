package ps.nier.core.domain.post;

import ps.nier.core.domain.base.PageQuery;

public class PostQuery extends PageQuery{
	private static final long serialVersionUID = 6025999513242927900L;
	
	private String name;
	private String searchValue;
	private String userId;
	private String groupId;
	private Integer status;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

}
