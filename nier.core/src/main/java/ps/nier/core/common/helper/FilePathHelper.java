package ps.nier.core.common.helper;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import ps.nier.core.domain.base.FilePathResult;

public class FilePathHelper {

	private static final SimpleDateFormat DEFAULT_DATE_SDF = new SimpleDateFormat("yyyyMMdd");
	
	public static final String ROOT_PATH 	= "E:\\nier\\file\\";
	public static final String ROOT_URL 	= "/file/";
	
	public static final String DEFAULT 		= "default";
	public static final String ALBUM 		= "album";
	
	public static final String IMAGE 		= "image";
	public static final String PHOTO 		= "photo";
	public static final String DOCUMENT 	= "document";
	public static final String MUSIC 		= "music";
	public static final String VIDEO 		= "video";
	public static final String VOICE 		= "voice";
	
	public static FilePathResult getImagePath(String imageName){
		FilePathResult result = new FilePathResult();
		result.setRootPath(ROOT_PATH);
		result.setType(IMAGE + File.separator + DEFAULT);
		result.setDate(DEFAULT_DATE_SDF.format(new Date()));
		result.setFileName(imageName);
		return result;
	}
	
    public static String getImageDefaultUrlPrefix() {
        return ROOT_URL + IMAGE + "/" + DEFAULT + "/";
    }
    
    public static FilePathResult getPhotoPath(String photoName){
		FilePathResult result = new FilePathResult();
		result.setRootPath(ROOT_PATH);
		result.setType(PHOTO + File.separator + DEFAULT);
		result.setDate(DEFAULT_DATE_SDF.format(new Date()));
		result.setFileName(photoName);
		return result;
	}
	
    public static String getPhotoDefaultUrlPrefix() {
        return ROOT_URL + PHOTO + "/" + DEFAULT + "/";
    }
}
