package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum BooleanEnum {
	True(1, "是"), 
	False(2, "否");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private BooleanEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static BooleanEnum parse(int value){
		BooleanEnum result = null;
		switch (value) {
		case 1 : 
			result = BooleanEnum.True;
			break;
		case 2 : 
			result = BooleanEnum.False;
			break;
		}
		return result;
	}
	
	public static List<BooleanEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
