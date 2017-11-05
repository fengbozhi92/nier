package ps.nier.controller.base;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import ps.nier.core.dictionary.ResCodeEnum;
import ps.nier.core.domain.base.ResEntity;

public class BaseController {
	
	public ResponseEntity<ResEntity> renderError(){
		return new ResponseEntity<ResEntity>(new ResEntity(ResCodeEnum.Error), HttpStatus.BAD_REQUEST);
	}
	
	public ResponseEntity<ResEntity> renderError(String content){
		return new ResponseEntity<ResEntity>(new ResEntity(ResCodeEnum.Error, content), HttpStatus.BAD_REQUEST);
	}
	
	public ResponseEntity<ResEntity> renderSuccess(){
		return new ResponseEntity<ResEntity>(new ResEntity(ResCodeEnum.Success), HttpStatus.OK);
	}
	
	public ResponseEntity<ResEntity> renderData(Object obj){
		return new ResponseEntity<ResEntity>(new ResEntity(ResCodeEnum.Success, obj), HttpStatus.OK);
	}
}
