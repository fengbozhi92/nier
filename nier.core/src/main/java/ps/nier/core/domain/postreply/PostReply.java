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
	private String postId;
	private String replyUserId;
	private String content;
	private Integer status;
	
	@Transient
	private String replyUserNickname;
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
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getReplyUserId() {
		return replyUserId;
	}
	public void setReplyUserId(String replyUserId) {
		this.replyUserId = replyUserId;
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
	public String getReplyUserNickname() {
		return replyUserNickname;
	}
	public void setReplyUserNickname(String replyUserNickname) {
		this.replyUserNickname = replyUserNickname;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
}
