package ps.nier.core.domain.postreply;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import ps.nier.core.domain.base.BaseEntity;
@Entity
@Table(name="b_post_reply")
@JsonIgnoreProperties({"handler", "hibernateLazyInitializer"})
public class PostReply extends BaseEntity{
	private static final long serialVersionUID = 1050856493576526103L;
	@Id
	private String id;
	private String groupId;
	private String threadId;
	private String targetId;
	private String targetUserId;
	private String content;
	private Integer status;
	
	@Transient
	private String targetUserNickname;
	@Transient
	private String userNickname;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getTargetId() {
		return targetId;
	}
	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}
	public String getTargetUserId() {
		return targetUserId;
	}
	public void setTargetUserId(String targetUserId) {
		this.targetUserId = targetUserId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTargetUserNickname() {
		return targetUserNickname;
	}
	public void setTargetUserNickname(String targetUserNickname) {
		this.targetUserNickname = targetUserNickname;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
}
