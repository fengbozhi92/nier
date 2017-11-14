package ps.nier.service.photoalbum;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.photoalbum.PhotoAlbum;

public interface PhotoAlbumRepository extends JpaRepository<PhotoAlbum, String>{
	
	Page<PhotoAlbum> findAll(Specification<PhotoAlbum> spec, Pageable page);
	
	PhotoAlbum findByTitle(String title);
	
	int deleteByIdIn(String[] ids);
}
