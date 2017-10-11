package com.zhiyou100.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.User;
import com.zhiyou100.service.UserService;
import com.zhiyou100.vo.ResponseVo;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping(path="/user/login", method=RequestMethod.POST)
	public @ResponseBody ResponseVo<User> login(@RequestBody User user, HttpSession session) {
		
		boolean result = service.login(user);
		
		if (result) {
			
			session.setAttribute("user", user);

			return new ResponseVo<User>(0, "", user);
		}else {
			
			return new ResponseVo<User>(-1001, "登录失败", null);
		}
	}
	
	@RequestMapping("/register")
	public void register(User user) {
		
		service.register(user);
	}
	
	// 验证用户名是否存在，这个请求采用的 restful 风格，
	// 参数 username 直接拼在了 url 的路径上，要想获取这个 username 必须按照如下方式
	// 1. @RequestMapping 中使用 {} 包裹需要提取的数据
	// 2. 使用 @PathVariable 注解把需要提取的数据和方法参数进行映射
	@RequestMapping(path="/user/{username}/valid", method=RequestMethod.GET)
	public @ResponseBody boolean validUsername(@PathVariable("username") String username) {
		
		// @ResponseBody 写在返回值前边是比较常见的方式
		
		// false 用户名不存在
		// true 用户名存在
		return service.validUsername(username);
	}
}





