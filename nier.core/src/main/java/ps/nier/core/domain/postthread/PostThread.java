package ps.nier.core.domain.postthread;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import ps.nier.core.domain.base.DefaultEntity;
@Entity
@Table(name="b_post_thread")
public class PostThread extends DefaultEntity{
	
	private static final long serialVersionUID = 1L;

	private String groupId;
	private String title;
	private int viewNum;
	private int replyNum;
	private Integer type;
	@Transient
	private String content;
	@Transient
	private String userNickname;
	@Transient
	private String groupName;
	
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getViewNum() {
		return viewNum;
	}
	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
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
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
}
