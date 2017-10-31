package ps.nier.core.common.helper;

/**
 *  作用:	sql包装
 *  作者:	冯博智
 *  时间:	2017/09/15
 *  版本:	1.0
 * */
public class QueryHelper {
	 
	public static String getPrefixImplict(String str) {
		if (str != null) {
			return String.format("%1$s%2$s%3$s", new Object[] {"%", str, ""});
		}
		return "%%";
	}
	
	public static String getSuffixImplict(String str) {
		if (str != null) {
			return String.format("%1$s%2$s%3$s", new Object[] {"", str, "%"});
		}
		return "%%";
	}
	
	public static String getFullImplict(String str) {
		if (str != null) {
			return String.format("%1$s%2$s%3$s", new Object[] {"%", str, "%"});
		}
		return "%%";
	}	
}
