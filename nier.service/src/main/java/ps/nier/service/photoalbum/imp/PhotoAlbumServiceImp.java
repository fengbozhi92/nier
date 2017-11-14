package ps.nier.service.photoalbum.imp;

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

import ps.nier.core.domain.photoalbum.PhotoAlbum;
import ps.nier.core.domain.photoalbum.PhotoAlbumQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.photoalbum.PhotoAlbumRepository;
import ps.nier.service.photoalbum.PhotoAlbumService;
@Service
public class PhotoAlbumServiceImp implements PhotoAlbumService {
	@Autowired
	private PhotoAlbumRepository photoAlbumRepository;
	@Autowired
	private FillService fillService;
	
	@Override
	public Page<PhotoAlbum> list(PhotoAlbumQuery photoAlbum) {
		Page<PhotoAlbum> list = photoAlbumRepository.findAll(new Specification<PhotoAlbum>(){
			@Override
			public Predicate toPredicate(Root<PhotoAlbum> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
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
		}, photoAlbum);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(PhotoAlbum item : list.getContent()) {
				
			}
		}
		return list;
	}

	@Override
	public List<PhotoAlbum> listAll() {
		return photoAlbumRepository.findAll();
	}

	@Override
	public PhotoAlbum get(String id) {
		return photoAlbumRepository.findOne(id);
	}

	@Override
	public boolean save(PhotoAlbum group) {
		return photoAlbumRepository.save(group) != null;
	}

	@Override
	public boolean update(PhotoAlbum group) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@Transactional
	public boolean batchRemove(String[] ids) {
		return photoAlbumRepository.deleteByIdIn(ids) > 0;
	}

	@Override
	public boolean isExistedTitle(String title) {
		return photoAlbumRepository.findByTitle(title) != null;
	}

}
