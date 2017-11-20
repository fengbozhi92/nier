package ps.nier.core.domain.postreply;

import ps.nier.core.domain.base.PageQuery;

public class PostReplyQuery extends PageQuery{
	private static final long serialVersionUID = -2768826948691929173L;
	
	private String targetUserId;
	private String targetId;

	public String getTargetUserId() {
		return targetUserId;
	}

	public void setTargetUserId(String targetUserId) {
		this.targetUserId = targetUserId;
	}

	public String getTargetId() {
		return targetId;
	}

	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}

	public PostReplyQuery(String targetId) {
		super();
		this.targetId = targetId;
	}

	public PostReplyQuery() {
		super();
	}

}
