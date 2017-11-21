package ps.nier.core.domain.blog;

import javax.persistence.Entity;

import ps.nier.core.domain.base.DefaultEntity;

@Entity
public class Blog extends DefaultEntity{
	
	private static final long serialVersionUID = -4264383872135689786L;
	
	private String title;   		//主标题
	private String subtitle;		//子标题
	private String email;			//消息通知邮箱
	private Integer theme;
	private int subscribedNum;
	private int articleNum;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getTheme() {
		return theme;
	}
	public void setTheme(Integer theme) {
		this.theme = theme;
	}
	public int getSubscribedNum() {
		return subscribedNum;
	}
	public void setSubscribedNum(int subscribedNum) {
		this.subscribedNum = subscribedNum;
	}
	public int getArticleNum() {
		return articleNum;
	}
	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}
	
}
