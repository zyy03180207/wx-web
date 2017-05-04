package com.program.wx.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.program.wx.BaseController;
import com.program.wx.service.RemoteApiService;

import microservice.api.AjaxResult;

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
		AjaxResult result = new AjaxResult();
		String user = getPara(request, "username");
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
