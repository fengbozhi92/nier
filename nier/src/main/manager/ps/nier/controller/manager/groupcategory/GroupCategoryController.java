package ps.nier.controller.manager.groupcategory;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ps.nier.core.common.utils.UUIDUtils;
import ps.nier.core.dictionary.ResCode;
import ps.nier.core.domain.base.ResEntity;
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
	public ResEntity ajaxList(@RequestBody GroupCategoryQuery query, Pageable page){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupCategoryController's list is error!", t);
		}
		return new ResEntity(ResCode.Success, groupCategoryService.list(query, page));
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
	
	@RequestMapping(value="/manager/groupcategory/edit.do")
	@ResponseBody
	public Map<String, Object> edit(HttpServletRequest req){
		Map<String, Object> model = new HashMap<String, Object>();
		String id = req.getParameter("id");
		if (id != null && id.length() == 36) {
			try {
				GroupCategory groupCategory = groupCategoryService.get(id);
				if (groupCategory != null) {
					
				}
				model.put("result", true);
				model.put("data", groupCategory);
				return model;
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("GroupCategoryController's list is error!", t);
			}
		}
		model.put("result", false);
		return model;
	}
}
