package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum PostTypeEnum {
	Default(1, "普通"), 
	Ground(2, "一楼"),
	DoubleDeck(3, "楼中楼");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private PostTypeEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static PostTypeEnum parse(int value){
		PostTypeEnum result = null;
		switch (value) {
		case 1 : 
			result = PostTypeEnum.Default;
			break;
		case 2 : 
			result = PostTypeEnum.Ground;
			break;
		case 3 : 
			result = PostTypeEnum.DoubleDeck;
			break;
		}
		return result;
	}
	
	public static List<PostTypeEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
