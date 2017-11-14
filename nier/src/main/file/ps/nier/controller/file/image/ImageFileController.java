package ps.nier.controller.file.image;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.slf4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import ps.nier.core.common.helper.FilePathHelper;
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.domain.base.FilePathResult;
import ps.nier.core.domain.base.UploadResEntity;

@RestController
public class ImageFileController {
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ImageFileController.class);
	
	@RequestMapping(value="/file/image/upload.do")
	public UploadResEntity upload(@RequestParam("imageFile") MultipartFile file){
		if (!file.isEmpty()) {      
        	try {
				String original = file.getOriginalFilename();
				String extName = original.substring(original.lastIndexOf(".") + 1, original.length());
				String fileKey = UUIDUtils.getId36();
				String fileName = fileKey + "." + extName;
				FilePathResult result = FilePathHelper.getImagePath(fileName);
				File dir = new File(result.getFullFolder());
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File f = new File(result.getFullPath());
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream out = new BufferedOutputStream(fos);       
				out.write(file.getBytes());      
				out.flush();      
				out.close();
				return new UploadResEntity(0, new Object[]{FilePathHelper.getImageDefaultUrlPrefix() + result.getDate() + "/" + result.getFileName()});
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("ImageController's upload is error !");
			} 
		}
        return new UploadResEntity(-1, null);         	
	}
	
}


