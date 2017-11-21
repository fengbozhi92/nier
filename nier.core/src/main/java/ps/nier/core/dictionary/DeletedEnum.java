package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum DeletedEnum {
	Deleted(1, "已删除"), 
	NotDelete(2, "未删除");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private DeletedEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static DeletedEnum parse(int value){
		DeletedEnum result = null;
		switch (value) {
		case 1 : 
			result = DeletedEnum.Deleted;
			break;
		case 2 : 
			result = DeletedEnum.NotDelete;
			break;
		}
		return result;
	}
	
	public static List<DeletedEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
