package ps.nier.controller.manager.groupcategory;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.domain.groupcategory.GroupCategory;
import ps.nier.core.domain.groupcategory.GroupCategoryQuery;
import ps.nier.service.groupcategory.GroupCategoryService;

@Controller
public class GroupCategoryController {
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(GroupCategoryController.class);	
	@Autowired
	private GroupCategoryService groupCategoryService;
	
	@RequestMapping(value="/manager/groupcategory/list.do")
	public String list(Model model, @ModelAttribute("query")GroupCategoryQuery query, Pageable page){
		try {
			model.addAttribute("list", groupCategoryService.list(query, page));
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupCategoryController's list is error!", t);
		}
		return "manager/groupcategory/groupCategoryList";
	}
	
	@RequestMapping(value="/manager/groupcategory/ajaxList.do")
	@ResponseBody
	public Map<String, Object> ajaxList(@ModelAttribute("query")GroupCategoryQuery query, Pageable page){
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			model.put("list", groupCategoryService.list(query, page));
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupCategoryController's list is error!", t);
		}
		return model;
	}
	
	@RequestMapping(value="/manager/groupcategory/save.do")
	@ResponseBody
	public Map<String, Object> save(GroupCategory groupCategory){
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			groupCategory.setId(UUIDUtils.getId36());
			groupCategory.setCreateTime(new Date());
			model.put("result", groupCategoryService.save(groupCategory));
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupCategoryController's list is error!", t);
		}
		return model;
	}
}
