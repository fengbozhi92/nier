package ps.nier.core.common.utils;

import java.util.UUID;

public final class UUIDUtils {
	
	public static String getId36(){
		return UUID.randomUUID().toString();
	}
	
	public static String getId32(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
