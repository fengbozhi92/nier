package ps.nier.controller.manager.menu;

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
import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.menu.MenuQuery;
import ps.nier.service.menu.MenuService;

@Controller
public class MenuController extends BaseController{
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(MenuController.class);
	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value="/manager/menu/list.do")
	public String list(Model model){
		try {
			model.addAttribute("parentMenus", menuService.listAll());
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("GroupSubcategoryController's list is error!", t);
		}
		return "manager/menu/list";
	}
	
	@RequestMapping(value="/manager/menu/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody MenuQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("MenuController's ajaxList is error!", t);
		}
		return renderData(menuService.list(query));
	}
	
	@RequestMapping(value="/manager/menu/getSubmenus.do")
	public ResponseEntity<ResEntity> getSubmenus(HttpServletRequest req){
		String parentId = req.getParameter("parentId");
		if (parentId != null && parentId.length() == 36) {
			try {
				List<Menu> menus = menuService.listByParentId(parentId);
				return renderData(menus);
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("MenuController's getSubmenus is error!", t);
			}
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/menu/save.do")
	public ResponseEntity<ResEntity> save(Menu menu){
		try {
			menu.setId(UUIDUtils.getId36());
			menu.setCreateTime(new Date());
			if (StringUtils.isBlank(menu.getParentId())) {
				menu.setDepth(new Integer(1));
			}
			if (menuService.save(menu)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("MenuController's save is error!", t);
		}
		return renderError();
	}
}
