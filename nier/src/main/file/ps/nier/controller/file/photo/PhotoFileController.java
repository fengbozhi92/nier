package ps.nier.controller.file.photo;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import ps.nier.core.common.helper.FilePathHelper;
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.StatusEnum;
import ps.nier.core.domain.base.FilePathResult;
import ps.nier.core.domain.base.UploadResEntity;
import ps.nier.core.domain.photo.Photo;
import ps.nier.service.photo.PhotoService;

@RestController
public class PhotoFileController {
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(PhotoFileController.class);
	
	@Autowired
	private PhotoService photoService;
	
	@RequestMapping(value="/file/photo/upload.do")
	public UploadResEntity upload(@RequestParam("photoFile") MultipartFile file, HttpServletRequest req){
		if (!file.isEmpty()) {      
        	try {
				String original = file.getOriginalFilename();
				String extName = original.substring(original.lastIndexOf(".") + 1, original.length());
				String fileKey = UUIDUtils.getId36();
				String fileName = fileKey + "." + extName;
				FilePathResult result = FilePathHelper.getPhotoPath(fileName);
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
				String path = FilePathHelper.getPhotoDefaultUrlPrefix() + result.getDate() + "/" + result.getFileName();
				String albumId = req.getParameter("aId");
				String createUser = req.getParameter("cUser");
				Photo photo = new Photo();
				photo.setId(UUIDUtils.getId36());
				photo.setAlbumId(albumId);
				photo.setCreateUser(createUser);
				photo.setCreateTime(new Date());
				photo.setPath(path);
				photo.setName("无题");
				photo.setType(new Integer(1));
				photo.setLikeCount(0);
				photo.setSequence(0);
				photo.setStatus(StatusEnum.Valid.getValue());
				photoService.save(photo);
				return new UploadResEntity(0, new Object[]{path});
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("PhotoController's upload is error !");
			} 
		}
		return new UploadResEntity(-1, null);        	
	}
	
}


