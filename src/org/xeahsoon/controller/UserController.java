package org.xeahsoon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.xeahsoon.pojo.User;
import org.xeahsoon.service.UserService;

import com.alibaba.fastjson.JSONObject;

/**
 * 处理用户请求控制器
 * */
@Controller
public class UserController {
	
	/**
	 * 自动注入UserService
	 * */
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	/**
	 * 处理/login请求
	 * */
	@RequestMapping(value="/login")
	public ModelAndView login(
			 String loginname,String password,
			 ModelAndView mv,
			 HttpSession session){
		// 根据登录名和密码查找用户，判断用户登录
		User user = userService.login(loginname, password);
		if(user != null){
			if(user.getStatus() == 0) {
				//未通过审核，登陆失败
				mv.addObject("message", "用户未通过审核，请联系管理员!");
				mv.setViewName("loginForm");
			} else {
				// 登录成功，将user对象设置到HttpSession作用范围域
				session.setAttribute("user", user);
				// 转发到main请求
				mv.setView(new RedirectView("/clothes_sales/main"));
			}
		}else{
			// 登录失败，设置失败提示信息，并跳转到登录页面
			mv.addObject("message", "登录名或密码错误，请重新输入!");
			mv.setViewName("loginForm");
		}
		return mv;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "loginForm";
	}
	
	@RequestMapping(value="/register")
	public ModelAndView register(
			String regist_loginname, String regist_name, String regist_phone,
			String regist_password, ModelAndView mv) {
		
		int result = userService.registerNewUser(regist_loginname, regist_password, regist_name, regist_phone);
		if(result == 1) {
			mv.addObject("message", "注册成功，请联系管理员审核后再尝试登录!");
		} else {
			mv.addObject("message", "注册失败!");
		}
		mv.setViewName("loginForm");
		
		return mv;
	}

	@ResponseBody
	@RequestMapping("/checkLoginName/{loginname}")
	public int checkLoginName(@PathVariable String loginname) {
		int result =  userService.checkLoginNameIfExists(loginname);
		return result;
		
	}
	
	@RequestMapping("/user")
	public String sendToUser(Model model) {
		
		List<User> user_list = userService.getUserList();
		//剔除admin用户
		for(int i=0; i<user_list.size(); i++) {
			String loginname = user_list.get(i).getLoginname();
			if("admin".equals(loginname)) {
				user_list.remove(i);
				break;
			}
		}
		model.addAttribute("user_list", user_list);
		
		return "user";
	}

	//修改用户
	@ResponseBody
	@RequestMapping(value="/editUser")
	public int editUser(@RequestParam("params")String params) {
		
		JSONObject data = JSONObject.parseObject(params);
		
		String loginname = data.getString("loginname");
		String name = data.getString("name");
		String phone = data.getString("phone");
		String password = data.getString("password");
		
		int result = userService.updateUserInfo(loginname, name, phone, password);
		return result;
	}
	
	//审核用户
	@ResponseBody
	@RequestMapping(value="/checkUser")
	public int deleteUser(String loginname) {
		return userService.checkUser(loginname);
	}
	
	//重置密码
	@ResponseBody
	@RequestMapping(value="/resetUserPwd")
	public int resetUserPwd(String loginname) {
		return userService.resetUserPwd(loginname);
	}

}
