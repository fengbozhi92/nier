package ps.nier.core.domain.photoalbum;

import ps.nier.core.domain.base.PageQuery;

public class PhotoAlbumQuery extends PageQuery{

	private static final long serialVersionUID = -7881330069953465900L;
	
	private String userId;
	private String title;
	private Integer status;
	
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

}
