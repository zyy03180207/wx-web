package com.program.wx.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.program.wx.BaseController;
import com.program.wx.Global;
import com.program.wx.param.AjaxResult;
import com.program.wx.service.RemoteApiService;
import com.program.wx.util.StringUtil;

import microservice.api.ServiceApiHelper;
import microservice.api.ServiceResult;

@Controller
@RequestMapping("/")
public class IndexController extends BaseController {

	@Autowired
	RemoteApiService remoteApiService;

	@RequestMapping(value = "index",method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView andView = createMV("index");
		return andView;
	}

	@RequestMapping(value = "login",method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView andView = createMV("login");
		return andView;
	}

	@RequestMapping(value = "login",method = RequestMethod.POST)
	public void loginPost(HttpServletRequest request, HttpServletResponse response) {
		AjaxResult ajaxResult = new AjaxResult();
		String user = getPara(request, "username");
		String pass = getPara(request, "password");
		String vcode = getPara(request, "vcode");
		if(StringUtil.isEmpty(user)) {
			ajaxResult.setMesg("请输入用户名");
			this.write(response, ajaxResult);
			return;
		}
		if(StringUtil.isEmpty(pass)) {
			ajaxResult.setMesg("请输入密码");
			this.write(response, ajaxResult);
			return;
		}
		if(StringUtil.isEmpty(vcode)) {
			ajaxResult.setMesg("请输入验证码");
			this.write(response, ajaxResult);
			return;
		}
		String code = (String) this.getSession(request, V_CODE);
		if(!vcode.equalsIgnoreCase(code)) {
			ajaxResult.setMesg("验证码不正确");
			this.write(response, ajaxResult);
			return;
		}
		String md5Pass = md5(pass);
		JSONObject object = new JSONObject();
		object.put("username", user);
		object.put("password", md5Pass);
		object.put("vcode", vcode);
		String json = ServiceApiHelper.formatParam("tb_login", object.toJSONString(), Global.KEY);
		String resultStr = remoteApiService.getWXAip().execute(json);
		ServiceResult result = ServiceApiHelper.parseResult(resultStr);
		//判断登陆结果
		if(result.isSucc()) {
			JSONObject dataJson = JSONObject.parseObject(result.getData());
			JSONObject adminJson = dataJson.getJSONObject("adminUser");
			this.setSession(request, Global.USER_INFO, adminJson);
			ajaxResult.setMesg(result.getMesg());
			ajaxResult.setSucc(true);
			this.write(response, ajaxResult);
			return;
		} else {
			ajaxResult.setMesg(result.getMesg());
			this.write(response, ajaxResult);
			return;
		}
	}
	
	@RequestMapping(value = "randomCode")
	public void randomCode(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		String s = generateCode(6);
		BufferedImage image = generateImage(s);
		session.setAttribute(V_CODE, s);
		response.setContentType("image/jpeg");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		try {
			ServletOutputStream sos = response.getOutputStream();
			ImageIO.write((BufferedImage) image, "JPEG", sos);  
			sos.close(); 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ModelAndView createMV(String jsp) {
		ModelAndView mv = new ModelAndView(""+jsp);
		return mv;
	}
}
