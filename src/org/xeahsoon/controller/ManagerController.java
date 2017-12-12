package org.xeahsoon.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.xeahsoon.pojo.Manager;
import org.xeahsoon.pojo.User;
import org.xeahsoon.service.ManagerService;

@Controller
public class ManagerController {
	
	@Autowired
	@Qualifier("managerService")
	private ManagerService managerService;
	
	@RequestMapping(value="/manaLogin")
	 public ModelAndView login(
			 String loginname,String password,
			 ModelAndView mv,
			 HttpSession session){
		// 根据登录名和密码查找用户，判断用户登录
		Manager mana = managerService.login(loginname, password);
		if(mana != null){
			// 登录成功，将user对象设置到HttpSession作用范围域
			session.setAttribute("mana", mana);
			// 转发到main请求
			mv.setView(new RedirectView("/clothes_sales/main"));
		}else{
			// 登录失败，设置失败提示信息，并跳转到登录页面
			mv.addObject("message", "登录名或密码错误，请重新输入!");
			mv.setViewName("loginForm");
		}
		return mv;
	}
}
