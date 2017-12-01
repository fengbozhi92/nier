package ps.nier.controller.manager.financerecord;

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
import ps.nier.core.domain.financerecord.FinanceRecord;
import ps.nier.core.domain.financerecord.FinanceRecordQuery;
import ps.nier.service.finance.FinanceService;
import ps.nier.service.financerecord.FinanceRecordService;

@Controller
public class FinanceRecordController extends BaseController{
	
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(FinanceRecordController.class);	
	@Autowired
	private FinanceService financeService;
	@Autowired
    private FinanceRecordService financeRecordService;
	
	@RequestMapping(value="/manager/financerecord/list.do")
	public String list(Model model, HttpServletRequest req){
	    String financeId = req.getParameter("financeId");
		model.addAttribute("deleted", DeletedEnum.getEnumValues());
		model.addAttribute("financeId", financeId);
		return "manager/financeRecord/list";
	}
	
	@RequestMapping(value="/manager/financerecord/ajaxList.do")
	public ResponseEntity<ResEntity> ajaxList(@RequestBody FinanceRecordQuery query){
		try {
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("FinanceRecordController's ajaxList is error!", t);
		}
		return renderData(financeRecordService.list(query));
	}
	
	@RequestMapping(value="/manager/financerecord/save.do")
	public ResponseEntity<ResEntity> save(FinanceRecord financeRecord){
		try {
		    financeRecord.setId(UUIDUtils.getId36());
		    financeRecord.setCreateTime(new Date());
			if (financeRecordService.save(financeRecord)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("FinanceRecordController's save is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/financerecord/edit.do")
	public ResponseEntity<ResEntity> edit(HttpServletRequest req){
		String id = req.getParameter("id");
		if (id != null && id.length() == 36) {
			try {
			    FinanceRecord financeRecord = financeRecordService.get(id);
				if (financeRecord != null) {
					return renderData(financeRecord);
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("FinanceRecordController's edit is error!", t);
			}
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/financerecord/update.do")
	public ResponseEntity<ResEntity> update(FinanceRecord financeRecord){
		try {
			if (financeRecordService.update(financeRecord)) {
				return renderSuccess();
			}
		} catch (Throwable t) {
			t.printStackTrace();
			logger.error("FinanceRecordController's update is error!", t);
		}
		return renderError();
	}
	
	@RequestMapping(value="/manager/financerecord/remove.do")
	public ResponseEntity<ResEntity> remove(HttpServletRequest req){
		String id = req.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			try {
				String[] ids = id.split(",");
				if (financeRecordService.batchRemove(ids)) {
					return renderSuccess();
				}
			} catch (Throwable t) {
				t.printStackTrace();
				logger.error("FinanceRecordController's remove is error!", t);
			}
		}
		return renderError();
	}
}
