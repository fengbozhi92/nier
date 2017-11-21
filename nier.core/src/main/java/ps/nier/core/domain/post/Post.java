package ps.nier.core.domain.post;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import ps.nier.core.domain.base.DefaultEntity;
import ps.nier.core.domain.postreply.PostReply;
import ps.nier.core.domain.user.User;
@Entity
@Table(name="b_post")
public class Post extends DefaultEntity{
	
	private static final long serialVersionUID = 1L;

	private String groupId;
	private String threadId;
	private Integer type;
	private String content;
	private int sequence		= 1;
	private int replyNum		= 0;
	private int likeNum		= 0;
	private int dislikeNum	= 0;
	@Transient
	private User user;
	@Transient
	private boolean existedReply;
	@Transient
	private List<PostReply> replys;

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
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public int getDislikeNum() {
		return dislikeNum;
	}
	public void setDislikeNum(int dislikeNum) {
		this.dislikeNum = dislikeNum;
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
