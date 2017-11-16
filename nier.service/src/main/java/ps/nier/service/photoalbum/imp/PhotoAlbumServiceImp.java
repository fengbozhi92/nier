package ps.nier.service.photoalbum.imp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ps.nier.core.common.helper.QueryHelper;
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
				if (StringUtils.isNotBlank(photoAlbum.getTitle())) {
					predicate.add(cb.like(root.get("title").as(String.class), QueryHelper.getFullImplict(photoAlbum.getTitle())));
				}
				if (photoAlbum.getStatus() != null) {
					predicate.add(cb.equal(root.get("status").as(Integer.class), photoAlbum.getStatus()));
				}
				if (StringUtils.isNotBlank(photoAlbum.getUserId())) {
					predicate.add(cb.equal(root.get("createUser").as(String.class), photoAlbum.getUserId()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, photoAlbum);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(PhotoAlbum item : list.getContent()) {
				fillService.fillPhotoAlbum(item);
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
	public boolean save(PhotoAlbum photoAlbum) {
		return photoAlbumRepository.save(photoAlbum) != null;
	}

	@Override
	public boolean update(PhotoAlbum photoAlbum) {
		PhotoAlbum out = photoAlbumRepository.getOne(photoAlbum.getId());
		if (out != null) {
			if (StringUtils.isNotBlank(photoAlbum.getTitle())) {
				out.setTitle(photoAlbum.getTitle());
			}
			if (StringUtils.isNotBlank(photoAlbum.getDescription())) {
				out.setDescription(photoAlbum.getDescription());
			}
			if (photoAlbum.getImagePath() != null && photoAlbum.getImagePath().length() > 49) {
				out.setImagePath(photoAlbum.getImagePath());
			}
			if (photoAlbum.getSequence() > 0) {
				out.setSequence(photoAlbum.getSequence());
			}
			out.setModifyTime(photoAlbum.getModifyTime());
			out.setModifyUser(photoAlbum.getModifyUser());
			out.setVersion(out.getVersion() + 1);
			return save(out);
		}
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
