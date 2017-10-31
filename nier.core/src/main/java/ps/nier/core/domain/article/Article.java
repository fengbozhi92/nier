//package ps.nier.core.domain.article;
//
//import java.util.Date;
//import java.util.List;
//
//import javax.persistence.Entity;
//import javax.persistence.Id;
//
//@Entity
//public class Article {
//	@Id
//	private String id;
//	private String blogId;
//	private String title;				//标题
//	private String content;				//内容
//	private String categoryId;			//分类ID
//	private List<String> tagList;		//标签
//	private int likeCount;				//推荐数量
//	private int dislikeCount;			//反对数量
//	private int viewCount;				//阅读数量
//	private int commentCount;			//评论数量
//	private Date publishTime;			//发布时间
//	private Integer status;				//状态
//	
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//	public String getBlogId() {
//		return blogId;
//	}
//	public void setBlogId(String blogId) {
//		this.blogId = blogId;
//	}
//	public String getTitle() {
//		return title;
//	}
//	public void setTitle(String title) {
//		this.title = title;
//	}
//	public String getContent() {
//		return content;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
//	public String getCategoryId() {
//		return categoryId;
//	}
//	public void setCategoryId(String categoryId) {
//		this.categoryId = categoryId;
//	}
//	public List<String> getTagList() {
//		return tagList;
//	}
//	public void setTagList(List<String> tagList) {
//		this.tagList = tagList;
//	}
//	public int getLikeCount() {
//		return likeCount;
//	}
//	public void setLikeCount(int likeCount) {
//		this.likeCount = likeCount;
//	}
//	public int getDislikeCount() {
//		return dislikeCount;
//	}
//	public void setDislikeCount(int dislikeCount) {
//		this.dislikeCount = dislikeCount;
//	}
//	public int getViewCount() {
//		return viewCount;
//	}
//	public void setViewCount(int viewCount) {
//		this.viewCount = viewCount;
//	}
//	public int getCommentCount() {
//		return commentCount;
//	}
//	public void setCommentCount(int commentCount) {
//		this.commentCount = commentCount;
//	}
//	public Date getPublishTime() {
//		return publishTime;
//	}
//	public void setPublishTime(Date publishTime) {
//		this.publishTime = publishTime;
//	}
//	public Integer getStatus() {
//		return status;
//	}
//	public void setStatus(Integer status) {
//		this.status = status;
//	}
//	
//}
