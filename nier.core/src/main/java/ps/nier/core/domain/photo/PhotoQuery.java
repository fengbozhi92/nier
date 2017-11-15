package ps.nier.core.domain.photo;

import ps.nier.core.domain.base.PageQuery;

public class PhotoQuery extends PageQuery{

	private static final long serialVersionUID = -2969912026035592033L;
	
	private String albumId;
	private String name;
	
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
	
}
