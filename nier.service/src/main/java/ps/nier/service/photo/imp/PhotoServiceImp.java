package ps.nier.service.photo.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ps.nier.core.domain.photo.Photo;
import ps.nier.core.domain.photo.PhotoQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.photo.PhotoRepository;
import ps.nier.service.photo.PhotoService;
import ps.nier.service.photoalbum.PhotoAlbumRepository;
@Service
public class PhotoServiceImp implements PhotoService {
	@Autowired
	private PhotoAlbumRepository photoAlbumRepository;
	@Autowired
	private PhotoRepository photoRepository;
	@Autowired
	private FillService fillService;
	
	@Override
	public Page<Photo> list(PhotoQuery photo) {
		Page<Photo> list = photoRepository.findAll(new Specification<Photo>(){
			@Override
			public Predicate toPredicate(Root<Photo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
//				if (StringUtils.isNotBlank(group.getName())) {
//					predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(group.getName())));
//				}
//				if (group.getStatus() != null) {
//					predicate.add(cb.equal(root.get("status").as(Integer.class), group.getStatus()));
//				}
//				if (StringUtils.isNotBlank(group.getCategoryId())) {
//					predicate.add(cb.equal(root.get("categoryId").as(String.class), group.getCategoryId()));
//				}
//				if (StringUtils.isNotBlank(group.getSubcategoryId())) {
//					predicate.add(cb.equal(root.get("subcategoryId").as(String.class), group.getSubcategoryId()));
//				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, photo);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(Photo item : list.getContent()) {
				
			}
		}
		return list;
	}

	@Override
	public List<Photo> listAll() {
		return photoRepository.findAll();
	}

	@Override
	public Photo get(String id) {
		return photoRepository.findOne(id);
	}

	@Override
	public boolean save(Photo group) {
		return photoRepository.save(group) != null;
	}

	@Override
	public boolean update(Photo group) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@Transactional
	public boolean batchRemove(String[] ids) {
		return photoRepository.deleteByIdIn(ids) > 0;
	}

	@Override
	public boolean isExistedName(String name) {
		return photoRepository.findByName(name) != null;
	}

}
