package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum AlbumTypeEnum {
	Myself(1, "仅自己可见"), 
	MyFriends(2, "好友可见"),
	Anyone(2, "所有人可见"),
	Question(2, "答对问题可见");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private AlbumTypeEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static AlbumTypeEnum parse(int value){
		AlbumTypeEnum result = null;
		switch (value) {
		case 1 : 
			result = AlbumTypeEnum.Myself;
			break;
		case 2 : 
			result = AlbumTypeEnum.MyFriends;
			break;
		case 3 : 
			result = AlbumTypeEnum.Anyone;
			break;
		case 4 : 
			result = AlbumTypeEnum.Question;
			break;
		}
		return result;
	}
	
	public static List<AlbumTypeEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
