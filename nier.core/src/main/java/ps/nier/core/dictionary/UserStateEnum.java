package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum UserStateEnum {
	Inactive(1, "未激活"), 
	Active(2, "活跃"),
	Frozen(3, "冻结");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private UserStateEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static UserStateEnum parse(int value){
		UserStateEnum result = null;
		switch (value) {
		case 1 : 
			result = UserStateEnum.Inactive;
			break;
		case 2 : 
			result = UserStateEnum.Active;
			break;
		case 3 : 
			result = UserStateEnum.Frozen;
			break;
		}
		return result;
	}
	
	public static List<UserStateEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
