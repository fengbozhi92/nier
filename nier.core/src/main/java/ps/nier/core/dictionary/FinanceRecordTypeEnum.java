package ps.nier.core.dictionary;

import java.util.Arrays;
import java.util.List;

public enum FinanceRecordTypeEnum {
	Income(1, "收入"), 
	Expend(2, "支出");
	
	private int value;
	private String label;
	
	public int getValue() {
		return value;
	}
	public String getLabel() {
		return label;
	}
	
	private FinanceRecordTypeEnum(int value, String label) {
		this.value = value;
		this.label = label;
	}
	
	public static FinanceRecordTypeEnum parse(int value){
		FinanceRecordTypeEnum result = null;
		switch (value) {
		case 1 : 
			result = FinanceRecordTypeEnum.Income;
			break;
		case 2 : 
			result = FinanceRecordTypeEnum.Expend;
			break;
		}
		return result;
	}
	
	public static List<FinanceRecordTypeEnum> getEnumValues() {
        return Arrays.asList(values());
    }
}
