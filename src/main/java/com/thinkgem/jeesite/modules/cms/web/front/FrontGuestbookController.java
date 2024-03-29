/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.JsonUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Guestbook;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;
import com.thinkgem.jeesite.modules.cms.service.GuestbookService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;

/**
 * 留言板Controller
 * @author ThinkGem
 * @version 2013-3-15
 */
@Controller
@RequestMapping(value = "${frontPath}/guestbook")
public class FrontGuestbookController extends BaseController{
	
	@Autowired
	private GuestbookService guestbookService;
	@Autowired
	private CategoryService categoryService;

	/**
	 * 留言板
	 */
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String guestbook(@RequestParam(required=false, defaultValue="1") Integer pageNo,
			@RequestParam(required=false, defaultValue="-1") Integer pageSize, Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		
		Page<Guestbook> page = new Page<Guestbook>(pageNo, pageSize);
		Guestbook guestbook = new Guestbook();
		guestbook.setDelFlag(Guestbook.DEL_FLAG_NORMAL);
		page = guestbookService.findPage(page, guestbook);
		model.addAttribute("page", page);
		return "modules/cms/front/themes/"+site.getTheme()+"/frontGuestbook";
	}
	
	/**
	 * 留言板-保存留言信息
	 */
	@ResponseBody
	@RequestMapping(value = "", method=RequestMethod.POST)
	public String guestbookSave(Guestbook guestbook, String validateCode, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		if (StringUtils.isNotBlank(validateCode)){
			if (ValidateCodeServlet.validate(request, validateCode)){
				guestbook.setIp(request.getRemoteAddr());
				guestbook.setCreateDate(new Date());
				if(categoryService.get("27").getIsAudit().equals(Global.YES))
				{
					guestbook.setDelFlag(Guestbook.DEL_FLAG_AUDIT);
				}
				else
				{
					guestbook.setDelFlag(Guestbook.DEL_FLAG_NORMAL);
				}
				guestbookService.save(guestbook);
				addMessage(redirectAttributes, "提交成功，谢谢！");
			}else{
				addMessage(redirectAttributes, "验证码不正确。");
				return JsonUtils.getResult(false, "验证码不正确。");
			}
		}else{
			addMessage(redirectAttributes, "验证码不能为空。");
			return JsonUtils.getResult(false, "验证码不能为空。");
		}
		return JsonUtils.getResult(true, "提交成功，谢谢！");
	}
	
}
