package ps.nier.core.domain.groupmember;

import ps.nier.core.domain.base.DefaultEntity;

public class GroupMember extends DefaultEntity{
	
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private Integer level = 1;
	private Integer roleType;
	private int exp = 0;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getRoleType() {
		return roleType;
	}
	public void setRoleType(Integer roleType) {
		this.roleType = roleType;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	
}
