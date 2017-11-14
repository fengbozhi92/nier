package ps.nier.service.photo;

import java.util.List;

import org.springframework.data.domain.Page;

import ps.nier.core.domain.photo.Photo;
import ps.nier.core.domain.photo.PhotoQuery;

public interface PhotoService {
	
	Page<Photo> list(PhotoQuery photo);
	
	List<Photo> listAll();
	
	Photo get(String id);
	
	boolean save(Photo photo);
	
	boolean update(Photo photo);
	
	boolean batchRemove(String[] ids);
	
	boolean isExistedName(String name);
}
