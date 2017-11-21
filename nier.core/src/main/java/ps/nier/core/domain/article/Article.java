package ps.nier.core.domain.article;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import ps.nier.core.domain.base.DefaultEntity;

@Entity
@Table(name="b_article")
public class Article extends DefaultEntity{

	private static final long serialVersionUID = -1917609906601540043L;
	
	private String 	targetId;			//
	private String 	title;				//标题
	private String 	content;			//内容
	private int 	likeNum;			//推荐数量
	private int 	dislikeNum;			//反对数量
	private int 	viewNum;			//阅读数量
	private int 	commentNum;			//评论数量
	private Date 	publishTime;		//发布时间
	private Integer state;				//状态
	
	public String getTargetId() {
		return targetId;
	}
	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getViewNum() {
		return viewNum;
	}
	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}

}
