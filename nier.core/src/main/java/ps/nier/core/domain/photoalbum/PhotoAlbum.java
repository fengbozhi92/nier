package ps.nier.core.domain.photoalbum;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import ps.nier.core.domain.base.BaseEntity;
@Entity
@Table(name="b_photo_album")
public class PhotoAlbum extends BaseEntity{
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	private String title;
	private String description;
	private String imagePath;
	private int sequence;
	private int count;
	private Integer type;
	private Integer status;
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}
