package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum AlbumEnum {
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
	
	private AlbumEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static AlbumEnum parse(int value){
		AlbumEnum result = null;
		switch (value) {
		case 1 : 
			result = AlbumEnum.Myself;
			break;
		case 2 : 
			result = AlbumEnum.MyFriends;
			break;
		case 3 : 
			result = AlbumEnum.Anyone;
			break;
		case 4 : 
			result = AlbumEnum.Question;
			break;
		}
		return result;
	}
	
	public static List<AlbumEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
