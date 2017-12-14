package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum CodeTypeEnum {
	Menu(1, "菜单编码", "%03d"), 
	Other(2, "其他编码", "%03d");
	
	private Integer type;
	private String name;
	private String format;
	
	public Integer getType() {
		return type;
	}
	public String getName() {
		return name;
	}
	public String getFormat() {
	    return format;
	}

	private CodeTypeEnum(Integer type, String name, String format) {
		this.type = type;
		this.name = name;
		this.format = format;
	}
	
	public static CodeTypeEnum parse(int value){
		CodeTypeEnum result = null;
		switch (value) {
		case 1 : 
			result = CodeTypeEnum.Menu;
			break;
		case 2 : 
			result = CodeTypeEnum.Other;
			break;
		}
		return result;
	}
	
	public static List<CodeTypeEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
