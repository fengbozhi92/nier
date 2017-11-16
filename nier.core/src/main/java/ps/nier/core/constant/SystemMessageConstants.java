package ps.nier.core.constant;

public class SystemMessageConstants {
	
    public static final String DEFAULT_ERROR                  = "[%1$s]错误";
    
    public static final String getDefaultError(String name) {
        return String.format(DEFAULT_ERROR, name);
    }

}
