package ps.nier.core.domain.photo;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import ps.nier.core.domain.base.BaseEntity;
@Entity
@Table(name="b_photo")
public class Photo extends BaseEntity{
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	private String path;
	private String albumId;
	private String name;
	private String description;
	private int sequence;
	private Integer type;
	private Integer status;
	
	private int likeCount;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getAlbumId() {
		return albumId;
	}
	public void setAlbumId(String albumId) {
		this.albumId = albumId;
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
		
}
