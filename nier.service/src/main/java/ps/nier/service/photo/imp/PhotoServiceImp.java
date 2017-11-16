package ps.nier.service.photo.imp;

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
import ps.nier.core.domain.photo.Photo;
import ps.nier.core.domain.photo.PhotoQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.photo.PhotoRepository;
import ps.nier.service.photo.PhotoService;
import ps.nier.service.photoalbum.PhotoAlbumService;
@Service
public class PhotoServiceImp implements PhotoService {
	@Autowired
	private PhotoAlbumService photoAlbumService;
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
				if (StringUtils.isNotBlank(photo.getName())) {
					predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(photo.getName())));
				}
				if (photo.getStatus() != null) {
					predicate.add(cb.equal(root.get("status").as(Integer.class), photo.getStatus()));
				}
				if (StringUtils.isNotBlank(photo.getAlbumId())) {
					predicate.add(cb.equal(root.get("albumId").as(String.class), photo.getAlbumId()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, photo);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(Photo item : list.getContent()) {
				fillService.fillPhoto(item);
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
	public boolean save(Photo photo) {
		return photoRepository.save(photo) != null;
	}

	@Override
	public boolean update(Photo photo) {
		Photo out = photoRepository.getOne(photo.getId());
		if (out != null) {
			if (photo.getAlbumId() != null && photo.getAlbumId().length() == 36) {
				out.setAlbumId(photo.getAlbumId());
			}
			if (StringUtils.isNotBlank(photo.getName())) {
				out.setName(photo.getName());
			}
			if (StringUtils.isNotBlank(photo.getDescription())) {
				out.setDescription(photo.getDescription());
			}
			if (photo.getSequence() > 0) {
				out.setSequence(photo.getSequence());
			}
			out.setModifyTime(photo.getCreateTime());
			out.setModifyUser(photo.getCreateUser());
			out.setVersion(out.getVersion() + 1);
			return save(out);
		}
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
