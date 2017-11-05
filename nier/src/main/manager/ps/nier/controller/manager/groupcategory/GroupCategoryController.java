package ps.nier.controller.manager.groupcategory;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.controller.base.BaseController;
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.groupcategory.GroupCategory;
import ps.nier.core.domain.groupcategory.GroupCategoryQuery;
import ps.nier.service.groupcategory.GroupCategoryService;

@Controller
public class GroupCategoryController extends BaseController{
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(GroupCategoryController.class);	
	@Autowired
	private GroupCategoryService groupCategoryService;
	
	@RequestMapping(value="/manager/groupcategory/list.do")
	public String list(){
		return "manager/groupcategory/list";
	}
	
	@RequestMapping(value="/manager/groupcategory/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody GroupCategoryQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupCategoryController's ajaxList is error!", t);
		}
		return renderData(groupCategoryService.list(query));
	}
	
	@RequestMapping(value="/manager/groupcategory/save.do")
	public ResponseEntity<ResEntity> save(GroupCategory groupCategory){
		try {
			groupCategory.setId(UUIDUtils.getId36());
			groupCategory.setCreateTime(new Date());
			if (groupCategoryService.save(groupCategory)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupCategoryController's save is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupcategory/edit.do")
	public ResponseEntity<ResEntity> edit(HttpServletRequest req){
		String id = req.getParameter("id");
		if (id != null && id.length() == 36) {
			try {
				GroupCategory groupCategory = groupCategoryService.get(id);
				if (groupCategory != null) {
					return renderData(groupCategory);
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupCategoryController's edit is error!", t);
			}
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupcategory/update.do")
	public ResponseEntity<ResEntity> update(GroupCategory groupCategory){
		try {
			if (groupCategoryService.update(groupCategory)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupCategoryController's update is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupcategory/remove.do")
	public ResponseEntity<ResEntity> remove(HttpServletRequest req){
		String id = req.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			try {
				String[] ids = id.split(",");
				if (groupCategoryService.batchRemove(ids)) {
					return renderSuccess();
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupCategoryController's remove is error!", t);
			}
		}
		return renderError();
	}
}
