package ps.nier.core.domain.postthread;

import ps.nier.core.domain.base.PageQuery;

public class PostThreadQuery extends PageQuery{
	private static final long serialVersionUID = 6025999513242927900L;
	
	private String title;
	private String userId;
	private String groupId;
	private Integer type;
	private Integer status;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

}
