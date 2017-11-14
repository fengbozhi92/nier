package ps.nier.service.photo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import ps.nier.core.domain.photo.Photo;

public interface PhotoRepository extends JpaRepository<Photo, String>{
	
	Page<Photo> findAll(Specification<Photo> spec, Pageable page);
	
	Photo findByName(String title);
	
	int deleteByIdIn(String[] ids);
}
