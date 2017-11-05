package ps.nier.controller.manager.groupsubcategory;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.controller.base.BaseController;
import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.core.domain.groupsubcategory.GroupSubcategoryQuery;
import ps.nier.service.groupcategory.GroupCategoryService;
import ps.nier.service.groupsubcategory.GroupSubcategoryService;

@Controller
public class GroupSubcategoryController extends BaseController{
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(GroupSubcategoryController.class);	
	@Autowired
	private GroupSubcategoryService groupSubcategoryService;
	@Autowired
	private GroupCategoryService groupCategoryService;
	
	@RequestMapping(value="/manager/groupsubcategory/list.do")
	public String list(Model model){
		try {
			model.addAttribute("groupCategorys", groupCategoryService.listAll());
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupSubcategoryController's list is error!", t);
		}
		return "manager/groupsubcategory/list";
	}
	
	@RequestMapping(value="/manager/groupsubcategory/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody GroupSubcategoryQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupSubcategoryController's ajaxList is error!", t);
		}
		return renderData(groupSubcategoryService.list(query));
	}
	
	@RequestMapping(value="/manager/groupsubcategory/save.do")
	public ResponseEntity<ResEntity> save(GroupSubcategory groupSubcategory){
		try {
			groupSubcategory.setId(UUIDUtils.getId36());
			groupSubcategory.setCreateTime(new Date());
			if (groupSubcategoryService.save(groupSubcategory)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupSubcategoryController's save is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupsubcategory/edit.do")
	public ResponseEntity<ResEntity> edit(HttpServletRequest req){
		String id = req.getParameter("id");
		if (id != null && id.length() == 36) {
			try {
				GroupSubcategory groupSubcategory = groupSubcategoryService.get(id);
				if (groupSubcategory != null) {
					return renderData(groupSubcategory);
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupSubcategoryController's edit is error!", t);
			}
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupsubcategory/update.do")
	public ResponseEntity<ResEntity> update(GroupSubcategory groupSubcategory){
		try {
			if (groupSubcategoryService.update(groupSubcategory)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupSubcategoryController's update is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupsubcategory/remove.do")
	public ResponseEntity<ResEntity> remove(HttpServletRequest req){
		String id = req.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			try {
				String[] ids = id.split(",");
				if (groupSubcategoryService.batchRemove(ids)) {
					return renderSuccess();
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupSubcategoryController's remove is error!", t);
			}
		}
		return renderError();
	}
}
