package ps.nier.core.domain.photoalbum;

import javax.persistence.Entity;
import javax.persistence.Table;

import ps.nier.core.domain.base.DefaultEntity;
@Entity
@Table(name="b_photo_album")
public class PhotoAlbum extends DefaultEntity{
	
	private static final long serialVersionUID = 1L;

	private String title;
	private String description;
	private String imagePath;
	private int sequence;
	private int photoNum;
	private Integer type;
	
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
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}

}
