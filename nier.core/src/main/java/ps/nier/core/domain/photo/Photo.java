package ps.nier.core.domain.photo;

import javax.persistence.Entity;
import javax.persistence.Table;

import ps.nier.core.domain.base.DefaultEntity;
@Entity
@Table(name="b_photo")
public class Photo extends DefaultEntity{
	
	private static final long serialVersionUID = 1L;

	private String path;
	private String albumId;
	private String name;
	private String description;
	private int sequence;
	private Integer type;
	private int likeNum;
	
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
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

}
