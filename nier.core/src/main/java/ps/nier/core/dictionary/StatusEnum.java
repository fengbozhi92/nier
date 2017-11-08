package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum StatusEnum {
	Valid(1, "启用"), 
	Invalid(2, "禁用");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private StatusEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static StatusEnum parse(int value){
		StatusEnum result = null;
		switch (value) {
		case 1 : 
			result = StatusEnum.Valid;
			break;
		case 2 : 
			result = StatusEnum.Invalid;
			break;
		}
		return result;
	}
	
	public static List<StatusEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
