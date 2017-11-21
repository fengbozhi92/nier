package ps.nier.core.domain.user;

import ps.nier.core.domain.base.PageQuery;

public class UserQuery extends PageQuery{

	private static final long serialVersionUID = 5167390040457439330L;

	private String username;
	private String nickname;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
