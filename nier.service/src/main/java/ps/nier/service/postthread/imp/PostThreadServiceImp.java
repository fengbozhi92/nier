package ps.nier.service.postthread.imp;

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
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.PostTypeEnum;
import ps.nier.core.dictionary.StatusEnum;
import ps.nier.core.domain.post.Post;
import ps.nier.core.domain.postthread.PostThread;
import ps.nier.core.domain.postthread.PostThreadQuery;
import ps.nier.service.common.FillService;
import ps.nier.service.post.PostService;
import ps.nier.service.postthread.PostThreadRepository;
import ps.nier.service.postthread.PostThreadService;
@Service
public class PostThreadServiceImp implements PostThreadService {
	@Autowired
	private PostThreadRepository postThreadRepository;
	@Autowired
	private PostService postService;
	@Autowired
	private FillService fillService;
	
	@Override
	public Page<PostThread> list(PostThreadQuery postThread) {
		Page<PostThread> list = postThreadRepository.findAll(new Specification<PostThread>(){
			@Override
			public Predicate toPredicate(Root<PostThread> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicate = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(postThread.getTitle())) {
					predicate.add(cb.like(root.get("title").as(String.class), QueryHelper.getFullImplict(postThread.getTitle())));
				}
				if (postThread.getStatus() != null) {
					predicate.add(cb.equal(root.get("status").as(Integer.class), postThread.getStatus()));
				}
				if (postThread.getType() != null) {
					predicate.add(cb.equal(root.get("type").as(Integer.class), postThread.getType()));
				}
				if (StringUtils.isNotBlank(postThread.getGroupId())) {
					predicate.add(cb.equal(root.get("groupId").as(String.class), postThread.getGroupId()));
				}
				Predicate[] p = new Predicate[predicate.size()];
				query.where(predicate.toArray(p)).orderBy(cb.desc(root.get("createTime").as(Date.class)));
				return query.getRestriction();
			}
		}, postThread);
		if (list.getContent() != null && !list.getContent().isEmpty()) {
			for(PostThread item : list.getContent()) {
				fillService.fillPostThread(item);
			}
		}
		return list;
	}

	@Override
	public PostThread get(String id) {
		PostThread thread = postThreadRepository.findOne(id);
		fillService.fillPostThread(thread);
		return thread;
	}

	@Override
	@Transactional
	public void updateViewCount(String id) {
		postThreadRepository.updateViewCountById(id);
		
	}

	@Override
	@Transactional
	public void updateReplyCount(String id) {
		postThreadRepository.updateReplyCountById(id);
		
	}

	@Override
	@Transactional
	public boolean save(PostThread postThread) {
		if (postThreadRepository.save(postThread) != null) {
			Post post = new Post();
			post.setId(UUIDUtils.getId36());
			post.setGroupId(postThread.getGroupId());
			post.setThreadId(postThread.getId());
			post.setContent(postThread.getContent());
			post.setType(PostTypeEnum.Ground.getValue());
			post.setCreateUser(postThread.getCreateUser());
			post.setCreateTime(postThread.getCreateTime());
			post.setStatus(StatusEnum.Valid.getValue());
			postService.save(post);
			return true;
		}
		return false;
	}

	@Override
	public boolean remove(String id) {
		postThreadRepository.delete(id);
		return true;
	}

}
