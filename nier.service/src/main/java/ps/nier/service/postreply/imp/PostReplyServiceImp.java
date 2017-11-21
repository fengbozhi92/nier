package ps.nier.service.postreply.imp;

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

import ps.nier.core.domain.postreply.PostReply;
import ps.nier.core.domain.postreply.PostReplyQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.postreply.PostReplyRepository;
import ps.nier.service.postreply.PostReplyService;
@Service
public class PostReplyServiceImp implements PostReplyService {
	@Autowired
	private PostReplyRepository postReplyRepository;
	@Autowired
	private FillService fillService;
	
	@Override
	public Page<PostReply> list(PostReplyQuery post) {
		Page<PostReply> list = postReplyRepository.findAll(new Specification<PostReply>(){
			@Override
			public Predicate toPredicate(Root<PostReply> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
//				if (StringUtils.isNotBlank(post.getContent())) {
//					predicate.add(cb.like(root.get("content").as(String.class), QueryHelper.getFullImplict(post.getContent())));
//				}
				if (StringUtils.isNotBlank(post.getTargetUserId())) {
					predicate.add(cb.equal(root.get("targetUserId").as(String.class), post.getTargetUserId()));
				}
				if (StringUtils.isNotBlank(post.getTargetId())) {
					predicate.add(cb.equal(root.get("targetId").as(String.class), post.getTargetId()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.asc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, post);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(PostReply item : list.getContent()) {
				fillService.fillPostReply(item);
			}
		}
		return list;
	}

	@Override
	public PostReply get(String id) {
		return postReplyRepository.findOne(id);
	}

	@Override
	public boolean save(PostReply post) {
		return postReplyRepository.save(post) != null;
	}

	@Override
	public boolean remove(String id) {
		postReplyRepository.delete(id);
		return true;
	}

	@Override
	public boolean isExistedByPostId(String postId) {
		return postReplyRepository.isExistedByPostId(postId) > 0;
	}

}
