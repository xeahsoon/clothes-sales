package org.xeahsoon.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.xeahsoon.pojo.User;

public class AuthorizedInterceptor implements HandlerInterceptor{
	
	private static final String[] IGNORE_URL = {"/loginForm", "/login", "registForm", "/regist", "/404.html"};

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		System.err.println(">>>> 进拦截器... " + request.getRequestURI() + " >>>>");
		
		/*default not login*/
		boolean flag = false;
		
		String servletPath = request.getServletPath();
		for(String s : IGNORE_URL) {
			if(servletPath.contains(s)) {
				flag = true;
				break;
			}
		}
		
		/*拦截请求*/
		if(!flag) {
			/*获取session中的用户*/
			User user = (User) request.getSession().getAttribute("user");
			
			if(user == null) {
				request.setAttribute("message", "请先登录再访问网站！");
				request.getRequestDispatcher("loginForm").forward(request, response);
				
				return flag;
			} else {
				flag = true;
			}
		}
		return flag;
	}
}
