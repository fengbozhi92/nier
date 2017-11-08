package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum PostThreadTypeEnum {
	Default(1, "普通"), 
	Hot(2, "热议"), 
	Essence(3, "精华");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private PostThreadTypeEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static PostThreadTypeEnum parse(int value){
		PostThreadTypeEnum result = null;
		switch (value) {
		case 1 : 
			result = PostThreadTypeEnum.Default;
			break;
		case 2 : 
			result = PostThreadTypeEnum.Hot;
			break;
		case 3 : 
			result = PostThreadTypeEnum.Essence;
			break;
		}
		return result;
	}
	
	public static List<PostThreadTypeEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
