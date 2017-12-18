package ps.nier.core.dictionary;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public enum UserRoleEnum {
    Anonymity(1, "ROLE_ANON", "ANON", "匿名用户"),
	User(2, "ROLE_USER", "USER", "普通用户"), 
	SeniorUser(4, "ROLE_SENIOR_USER", "SENIOR_USER", "高级用户"), 
	Manager(128, "ROLE_MANAGER", "MANAGER", "管理员"), 
	Nier(256, "ROLE_NIER", "NIER", "Nier");
	
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
		List<UserRoleEnum> roles = new ArrayList<UserRoleEnum>();
		for (UserRoleEnum role : getEnumValues()) {
			if ((value & role.getValue()) > 0) {
				roles.add(role);
			}
		}
		return roles;
	}
	
	public int getRoles() {
	    int result = value;
	    for (UserRoleEnum role : getEnumValues()) {
            if (role.getValue() < value) {
               result += role.getValue();
            }
        }
	    return result;
	}
	
	public static List<UserRoleEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
