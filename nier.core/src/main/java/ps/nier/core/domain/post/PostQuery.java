package ps.nier.core.domain.post;

import ps.nier.core.domain.base.PageQuery;

public class PostQuery extends PageQuery{
	
	private static final long serialVersionUID = 6025999513242927900L;
	
	private String content;
	private String userId;
	private String groupId;
	private String threadId;
	private Integer deleted;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getThreadId() {
		return threadId;
	}
	public void setThreadId(String threadId) {
		this.threadId = threadId;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

}
