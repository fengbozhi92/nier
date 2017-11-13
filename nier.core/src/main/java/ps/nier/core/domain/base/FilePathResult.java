package ps.nier.core.domain.base;

import java.io.File;

public class FilePathResult {
	private String rootPath;
	private String type;
	private String date;
	private String fileName;
	
	public String getRootPath() {
		return rootPath;
	}
	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
    public String getFolder() {
        return type + File.separator + date;
    }
    
    public String getPath() {
        return type + File.separator + date + File.separator + fileName;
    }
    
    public String getFullFolder() {
        return rootPath + type + File.separator + date;
    }
    
    public String getFullPath() {
        return rootPath + type + File.separator + date + File.separator + fileName;
    }
    
    public String getRelativeUrl() {
        return date + "/" + fileName;
    }
}
