package ps.nier.core.domain.photo;

import ps.nier.core.domain.base.BaseEntity;

public class Photo extends BaseEntity{
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String photoAlbumId;
	private String name;
	private String description;
	private int sequence;
	private String type;
	private String path;
	private int likeCount;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhotoAlbumId() {
		return photoAlbumId;
	}
	public void setPhotoAlbumId(String photoAlbumId) {
		this.photoAlbumId = photoAlbumId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
		
}
