package ps.nier.controller.manager.finance;

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
import ps.nier.core.dictionary.DeletedEnum;
import ps.nier.core.domain.base.ResEntity;
import ps.nier.core.domain.finance.Finance;
import ps.nier.core.domain.finance.FinanceQuery;
import ps.nier.service.finance.FinanceService;

@Controller
public class FinanceController extends BaseController{
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(FinanceController.class);	
	@Autowired
	private FinanceService financeService;
	
	@RequestMapping(value="/manager/finance/list.do")
	public String list(Model model){
		model.addAttribute("deleted", DeletedEnum.getEnumValues());
		return "manager/finance/list";
	}
	
	@RequestMapping(value="/manager/finance/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody FinanceQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("FinanceController's ajaxList is error!", t);
		}
		return renderData(financeService.list(query));
	}
	
	@RequestMapping(value="/manager/finance/save.do")
	public ResponseEntity<ResEntity> save(Finance finance){
		try {
		    finance.setId(UUIDUtils.getId36());
		    finance.setCreateTime(new Date());
			if (financeService.save(finance)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("FinanceController's save is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/finance/edit.do")
	public ResponseEntity<ResEntity> edit(HttpServletRequest req){
		String id = req.getParameter("id");
		if (id != null && id.length() == 36) {
			try {
			    Finance finance = financeService.get(id);
				if (finance != null) {
					return renderData(finance);
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("FinanceController's edit is error!", t);
			}
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/finance/update.do")
	public ResponseEntity<ResEntity> update(Finance finance){
		try {
			if (financeService.update(finance)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("FinanceController's update is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/finance/remove.do")
	public ResponseEntity<ResEntity> remove(HttpServletRequest req){
		String id = req.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			try {
				String[] ids = id.split(",");
				if (financeService.batchRemove(ids)) {
					return renderSuccess();
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("FinanceController's remove is error!", t);
			}
		}
		return renderError();
	}
}
