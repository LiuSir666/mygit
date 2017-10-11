package com.zhiyou100.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhiyou100.vo.ResponseVo;

// 过滤器（拦截器）可以实现 HandlerInterceptor 接口，实现三个方法
// 也可以继承自 HandlerInterceptorAdapter 选择三个中的几个实现
// HandlerInterceptorAdapter 实现了 HandlerInterceptor 接口
// 继承自 HandlerInterceptorAdapter 的子类可以有选择的重写父类方法
public class LoginFilter extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Object user = session.getAttribute("user");
		
		if (user == null) {
			
			// 打回去，进行登录
			
			// 创建需要返回给客户端的结果
			ResponseVo<String> vo = new ResponseVo<String>(-1000, "你需要进行登录", null);
			
			ObjectMapper om = new ObjectMapper();
			
			String json = om.writeValueAsString(vo);
			
			// 1. 设置返回的数据格式是 json
			// 2. 设置字符编码格式是 utf-8
			response.setContentType("application/json;charset=utf-8");
			
			response.getWriter().print(json);
			
			return false;
		}else {
		
			// 放行
			return true;
		}
	}
}




