package ps.nier.service.post.imp;

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

import ps.nier.core.common.helper.QueryHelper;
import ps.nier.core.domain.post.Post;
import ps.nier.core.domain.post.PostQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.post.PostRepository;
import ps.nier.service.post.PostService;
@Service
public class PostServiceImp implements PostService {
	@Autowired
	private PostRepository postRepository;
	@Autowired
	private FillService fillService;
	
	@Override
	public Page<Post> list(PostQuery post) {
		Page<Post> list = postRepository.findAll(new Specification<Post>(){
			@Override
			public Predicate toPredicate(Root<Post> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(post.getName())) {
					predicate.add(cb.like(root.get("name").as(String.class), QueryHelper.getFullImplict(post.getName())));
				}
				if (post.getStatus() != null) {
					predicate.add(cb.equal(root.get("status").as(Integer.class), post.getStatus()));
				}
				if (StringUtils.isNotBlank(post.getGroupId())) {
					predicate.add(cb.equal(root.get("groupId").as(String.class), post.getGroupId()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, post);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(Post item : list.getContent()) {
				fillService.fillPost(item);
			}
		}
		return list;
	}

	@Override
	public Post get(String id) {
		return postRepository.findOne(id);
	}

	@Override
	public boolean save(Post post) {
		return postRepository.save(post) != null;
	}

	@Override
	public boolean remove(String id) {
		postRepository.delete(id);
		return true;
	}

}
