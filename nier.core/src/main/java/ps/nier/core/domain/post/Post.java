package ps.nier.core.domain.post;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import ps.nier.core.domain.base.BaseEntity;
import ps.nier.core.domain.postreply.PostReply;
import ps.nier.core.domain.user.User;
@Entity
@Table(name="b_post")
public class Post extends BaseEntity{
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	private String groupId;
	private String threadId;
	private String userId;
	private Integer type;
	private String content;
	private int sequence		= 1;
	private int replyCount		= 0;
	private int likeCount		= 0;
	private int dislikeCount	= 0;
	private Integer status;
	
	@Transient
	private User user;
	@Transient
	private boolean existedReply;
	@Transient
	private List<PostReply> replys;

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getDislikeCount() {
		return dislikeCount;
	}

	public void setDislikeCount(int dislikeCount) {
		this.dislikeCount = dislikeCount;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isExistedReply() {
		return existedReply;
	}

	public void setExistedReply(boolean existedReply) {
		this.existedReply = existedReply;
	}

	public List<PostReply> getReplys() {
		return replys;
	}

	public void setReplys(List<PostReply> replys) {
		this.replys = replys;
	}
	
}
