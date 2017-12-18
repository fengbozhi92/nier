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
import ps.nier.core.dictionary.CodeTypeEnum;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.menu.Menu;
import ps.nier.core.domain.menu.MenuQuery;
import ps.nier.service.codegenerator.CodeGeneratorService;
import ps.nier.service.menu.MenuService;

@Controller
public class MenuController extends BaseController{
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(MenuController.class);
	@Autowired
	private MenuService menuService;
    @Autowired
    private CodeGeneratorService codeGeneratorService;
	
	@RequestMapping(value="/manager/menu/list.do")
	public String list(Model model){
		try {
			model.addAttribute("parentMenus", menuService.getTree());
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
	
    @RequestMapping(value="/manager/menu/add.do")
    public String add(Model model, HttpServletRequest req){
        String parentCode = req.getParameter("parentCode");
        try {
            if (StringUtils.isNotBlank(parentCode)) {
                model.addAttribute("parent", menuService.getByCode(parentCode));
            }
        } catch (Throwable t) {
            t.printStackTrace();
            logger.error("MenuController's add is error!", t);
        }
        return "manager/menu/add";
    }
    
    @RequestMapping(value="/manager/menu/edit.do")
    public String edit(Model model, HttpServletRequest req){
        String id = req.getParameter("id");
        if (id != null && id.length() == 36) {
            try {
                model.addAttribute("menu", menuService.get(id));
            } catch (Throwable t) {
                t.printStackTrace();
                logger.error("MenuController's edit is error!", t);
            }
            return "manager/menu/edit"; 
        }
        return "error";
    }
    
	@RequestMapping(value="/manager/menu/getSubmenus.do")
	public ResponseEntity<ResEntity> getSubmenus(@RequestBody MenuQuery query){
	    
		if (StringUtils.isNoneBlank(query.getParentCode())) {
			try {
				List<Menu> menus = menuService.listByParentCode(query.getParentCode());
				return renderData(menus);
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("MenuController's getSubmenus is error!", t);
			}
		}
		return renderError();
	}

	
    @RequestMapping(value="/manager/menu/getByCode.do")
    public ResponseEntity<ResEntity> getByCode(HttpServletRequest req){
        String code = req.getParameter("code");
        if (StringUtils.isNoneBlank(code)) {
            try {
                Menu menu = menuService.getByCode(code);
                if (menu != null) {
                    return renderData(menu);
                }
            } catch (Throwable t) {
                t.printStackTrace();
                logger.error("MenuController's getByCode is error!", t);
            }
        }
        return renderError();
    }
	
	@RequestMapping(value="/manager/menu/save.do")
	public ResponseEntity<ResEntity> save(Menu menu){
		try {
			menu.setId(UUIDUtils.getId36());
			menu.setCreateTime(new Date());
			menu.setCode(codeGeneratorService.getCode(CodeTypeEnum.Menu.getType(), menu.getParentCode()));
			if (menuService.save(menu)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("MenuController's save is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/menu/update.do")
	public ResponseEntity<ResEntity> update(Menu menu){
		try {
			if (menuService.update(menu)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("MenuController's update is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/menu/remove.do")
	public ResponseEntity<ResEntity> remove(HttpServletRequest req){
		String id = req.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			try {
				String[] ids = id.split(",");
				if (menuService.batchRemove(ids)) {
					return renderSuccess();
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("MenuController's remove is error!", t);
			}
		}
		return renderError();
	}
}
