package ps.nier.core.common.utils;

import java.util.Arrays;
import java.util.List;

/**
 * 中文转ASCII ASCII转中文
 */
public class ChineseAsciiParser {
    
    public static int char2Ascii(char c) {
        return (int) c;
    }
    
    public static char ascii2Char(int ascii) {
        return (char) ascii;
    }
    
    /**
     * 弘 => 24344
     */
    public static int[] string2Ascii(String str) {
        if (str == null || "".equals(str)) {
            return null;
        }
        char[] chars = str.toCharArray();
        int[] asciis = new int[chars.length];
        for (int i = 0; i < chars.length; i++) {
            asciis[i] = char2Ascii(chars[i]);
        }
        return asciis;
    }
    
    /**
     * 弘成科技 => 24344,25104,31185,25216
     */
    public static String string2AsciiString(String str) {
        int[] asciis = string2Ascii(str);
        if( asciis != null ) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < asciis.length; i++) {
                sb.append(",").append(asciis[i]);
            }
            return sb.substring(1).toString();
        }
        return null;
    }
    
    /**
     * 24344,25104,31185,25216 => 弘成科技
     */
    public static String ascii2String(String asciistr) {
        String[] asciistrs = asciistr.split(",");
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < asciistrs.length; i++) {
            sb.append((char) ascii2Char(Integer.parseInt(asciistrs[i])));
        }
        return sb.toString();
    }
    
    
    /**
     * 弘成科技 lx0000x => 24344,25104,31185,25216 108,120,48,48,48,48,120
     */
    public static String tags2Ascii(String tags) {
        if(tags != null && tags.length() > 0) {
            List<String> tagList = Arrays.asList(tags.split(" "));
            StringBuffer sb = new StringBuffer();
            for (String tag : tagList) {
                sb.append(" ").append(string2AsciiString(tag));
            }
            return sb.substring(1).toString();
        }
        return null;
    }
    
    /**
     * 24344,25104,31185,25216 108,120,48,48,48,48,120 => 弘成科技 lx0000x 
     */
    public static String ascii2Tags(String tagsAscii) {
        if(tagsAscii != null && tagsAscii.length() > 0) {
            List<String> tagList = Arrays.asList(tagsAscii.split(" "));
            StringBuffer sb = new StringBuffer();
            for (String tag : tagList) {
                sb.append(" ").append(ascii2String(tag));
            }
            return sb.substring(1).toString();
        }
        return null;
    }
    
    public static void main(String[] args) {
        String test = "冯博智";
        String tagsAscii = tags2Ascii(test);
        System.out.println(test);
        System.out.println(tagsAscii);
        System.out.println(ascii2Tags(tagsAscii));
    }
    
}