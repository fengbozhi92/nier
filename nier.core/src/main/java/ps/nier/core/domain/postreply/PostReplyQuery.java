package ps.nier.core.domain.postreply;

import ps.nier.core.domain.base.PageQuery;

public class PostReplyQuery extends PageQuery{
	private static final long serialVersionUID = -2768826948691929173L;
	
	private String replyUserId;
	private String postId;
	
	public String getReplyUserId() {
		return replyUserId;
	}

	public void setReplyUserId(String replyUserId) {
		this.replyUserId = replyUserId;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public PostReplyQuery(String postId) {
		super();
		this.postId = postId;
	}

	public PostReplyQuery() {
		super();
	}
	
}
