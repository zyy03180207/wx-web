package com.program.wx.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.program.wx.Global;

import microservice.online.entity.TbAdminUser;
import microservice.online.entity.TbSecqurity;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String url = request.getRequestURI();
		HttpSession session = request.getSession();
		JSONObject userJson = (JSONObject) session.getAttribute(Global.USER_INFO);
//		List<TbSecqurity> tbSecqurities = (List<TbSecqurity>) session.getAttribute(Global.SECQURITIES);
		//是否登录验证,先判断是不是login请求，然后在判断是否登录过
		if(url.indexOf("login") >= 0) {
			return true;
		}
		if(userJson == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
