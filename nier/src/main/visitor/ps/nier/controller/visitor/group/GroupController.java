package ps.nier.controller.visitor.group;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ps.nier.controller.base.BaseController;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.group.Group;
import ps.nier.core.domain.group.GroupQuery;
import ps.nier.service.group.GroupService;
import ps.nier.service.groupcategory.GroupCategoryService;
import ps.nier.service.groupsubcategory.GroupSubcategoryService;

@Controller
public class GroupController extends BaseController{
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(GroupController.class);
	@Autowired
	private GroupSubcategoryService groupSubcategoryService;
	@Autowired
	private GroupCategoryService groupCategoryService;
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value="/group/index.do")
	public String index(Model model){
		try {
			model.addAttribute("categorys", groupCategoryService.listAll());
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupController's index is error!", t);
		}
		return "visitor/group/index";
	}

	@RequestMapping(value="/group/list.do")
	public String list(Model model, HttpServletRequest req){
		String name = req.getParameter("name");
		try {
			model.addAttribute("searchName", name);
			model.addAttribute("categorys", groupCategoryService.listAll());
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupController's list is error!", t);
		}
		return "visitor/group/list";
	}
	
	@RequestMapping(value="/group/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody GroupQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupController's ajaxList is error!", t);
		}
		return renderData(groupService.list(query));
	}
	
	@RequestMapping(value="/group/view.do")
	public String view(HttpServletRequest req, Model model){
		String id = req.getParameter("id");
		if (id != null && id.length() == 36) {
			try {
				Group group = groupService.get(id);
				if (group != null) {
					model.addAttribute("group", group);
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupController's view is error!", t);
			}
			return "visitor/group/view";
		}
		return "visitor/error";
	}
	
	@RequestMapping(value="/group/search.do")
	public ResponseEntity<ResEntity> search(GroupQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupController's ajaxList is error!", t);
		}
		return renderData(groupService.list(query));
	}
}
