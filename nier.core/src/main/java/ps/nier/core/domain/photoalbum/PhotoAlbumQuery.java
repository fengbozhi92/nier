package ps.nier.core.domain.photoalbum;

import ps.nier.core.domain.base.PageQuery;

public class PhotoAlbumQuery extends PageQuery{

	private static final long serialVersionUID = -7881330069953465900L;
	
	private String userId;
	private String title;
	private Integer deleted;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}

}
