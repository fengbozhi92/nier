package ps.nier.core.dictionary;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum UserRoleEnum {
	User(1, "ROLE_USER", "USER", "普通用户"), 
	SeniorUser(2, "ROLE_SENIOR_USER", "SENIOR_USER", "高级用户"), 
	Manager(4, "ROLE_MANAGER", "MANAGER", "管理员"), 
	Nier(8, "ROLE_NIER", "NIER", "Nier");
	
	private int value;
	private String role;
	private String roleType;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getRole() {
		return role;
	}
	public String getRoleType() {
		return roleType;
	}
	public String getLabel() {
		return label;
	}
	
	private UserRoleEnum(int value, String role, String roleType, String label) {
		this.value = value;
		this.role = role;
		this.roleType = roleType;
		this.label = label;
	}
	
	public static List<UserRoleEnum> parse(int value){
		List<UserRoleEnum> roles = new ArrayList<UserRoleEnum>(4);
		for (UserRoleEnum role : getEnumValues()) {
			if ((value & role.value) > 0) {
				roles.add(role);
			}
		}
		return roles;
	}
	
	public static List<UserRoleEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
