package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum ArticleStateEnum {
	Draft(1, "草稿"), 
	Published(2, "已发表");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private ArticleStateEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static ArticleStateEnum parse(int value){
		ArticleStateEnum result = null;
		switch (value) {
		case 1 : 
			result = ArticleStateEnum.Draft;
			break;
		case 2 : 
			result = ArticleStateEnum.Published;
			break;
		}
		return result;
	}
	
	public static List<ArticleStateEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
