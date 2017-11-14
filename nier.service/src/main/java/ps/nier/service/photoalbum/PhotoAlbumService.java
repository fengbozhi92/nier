package ps.nier.service.photoalbum;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.photoalbum.PhotoAlbum;
import ps.nier.core.domain.photoalbum.PhotoAlbumQuery;

public interface PhotoAlbumService {
	
	Page<PhotoAlbum> list(PhotoAlbumQuery photoAlbum);
	
	List<PhotoAlbum> listAll();
	
	PhotoAlbum get(String id);
	
	boolean save(PhotoAlbum photoAlbum);
	
	boolean update(PhotoAlbum photoAlbum);
	
	boolean batchRemove(String[] ids);
	
	boolean isExistedTitle(String title);
}
