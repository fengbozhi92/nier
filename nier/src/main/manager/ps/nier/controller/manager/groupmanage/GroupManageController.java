package ps.nier.controller.manager.groupmanage;

import java.util.Date;
import java.util.List;

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
import ps.nier.core.domain.group.Group;
import ps.nier.core.domain.group.GroupQuery;
import ps.nier.core.domain.groupsubcategory.GroupSubcategory;
import ps.nier.service.group.GroupService;
import ps.nier.service.groupcategory.GroupCategoryService;
import ps.nier.service.groupsubcategory.GroupSubcategoryService;
@Controller
public class GroupManageController extends BaseController{
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(GroupManageController.class);
	@Autowired
	private GroupSubcategoryService groupSubcategoryService;
	@Autowired
	private GroupCategoryService groupCategoryService;
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value="/manager/groupmanage/list.do")
	public String list(Model model){
		try {
			model.addAttribute("categorys", groupCategoryService.listAll());
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupManageController's list is error!", t);
		}
		return "manager/groupmanage/list";
	}

	@RequestMapping(value="/manager/groupmanage/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody GroupQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupManageController's ajaxList is error!", t);
		}
		return renderData(groupService.list(query));
	}
	
	@RequestMapping(value="/manager/groupmanage/getSubcategorys.do")
	public ResponseEntity<ResEntity> getSubcategorys(HttpServletRequest req){
		String categoryId = req.getParameter("categoryId");
		if (categoryId != null && categoryId.length() == 36) {
			try {
				List<GroupSubcategory> groupSubcategorys = groupSubcategoryService.listByCategoryId(categoryId);
				return renderData(groupSubcategorys);
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupManageController's getSucategorys is error!", t);
			}
		}
		return renderError();
	}
		
	@RequestMapping(value="/manager/groupmanage/save.do")
	public ResponseEntity<ResEntity> save(Group group){
		try {
			group.setId(UUIDUtils.getId36());
			group.setCreateTime(new Date());
			if (groupService.save(group)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupManageController's save is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupmanage/edit.do")
	public ResponseEntity<ResEntity> edit(HttpServletRequest req){
		String id = req.getParameter("id");
		if (id != null && id.length() == 36) {
			try {
				Group group = groupService.get(id);
				if (group != null) {
					return renderData(group);
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupManageController's edit is error!", t);
			}
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupmanage/update.do")
	public ResponseEntity<ResEntity> update(Group group){
		try {
			if (groupService.update(group)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupManageController's update is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/groupmanage/remove.do")
	public ResponseEntity<ResEntity> remove(HttpServletRequest req){
		String id = req.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			try {
				String[] ids = id.split(",");
				if (groupService.batchRemove(ids)) {
					return renderSuccess();
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupManageController's remove is error!", t);
			}
		}
		return renderError();
	}
}
