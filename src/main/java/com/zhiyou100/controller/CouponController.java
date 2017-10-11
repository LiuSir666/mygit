package com.zhiyou100.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.Coupon;
import com.zhiyou100.model.User;
import com.zhiyou100.service.CouponService;
import com.zhiyou100.service.exception.CouponIsEmptyException;
import com.zhiyou100.service.exception.CouponIsRecivedException;
import com.zhiyou100.vo.ResponseVo;

@Controller
public class CouponController {

	@Autowired
	private CouponService service;

	// restful 风格中，get 表示获取数据
	@RequestMapping(path="/coupons", method=RequestMethod.GET)
	@ResponseBody // 自动把返回的数据转换为 json 格式的字符串
	public List<Coupon> list() {

		// 自动把集合转换为对应的 json 字符串发送到客户端
		return service.listCoupon();
	}

	@RequestMapping(path="/coupons/receive", method=RequestMethod.POST)
	// @RequestParam 获取普通方式请求的参数 xx=yy&uu=iii&oo=pp
	// @PathVariable 获取 url 路径中参数的 /xxx/{yyy}
	// POST，PUT，DELETE 参数都在请求体中
	// @RequestBody 把请求体中的 json 数据转换为 java 对象 "xxx":yyy
	// @ResponseBody 设置返回给客户端的数据是 json 格式
	public @ResponseBody ResponseVo<Coupon> receive(@RequestBody HashMap<String, Long> param, HttpSession session) {

		User user = (User) session.getAttribute("user");

		try{
			
			service.receiveCoupon(user.getId(), param.get("couponId"));
			
			// 成功领取
			return new ResponseVo<Coupon>(0, "领取成功", null);
		}catch (CouponIsEmptyException e) {
			
			// 领完了
			return new ResponseVo<Coupon>(-1, "优惠券已被领完", null);
		}catch (CouponIsRecivedException e) {
			
			// 已经领过了
			return new ResponseVo<Coupon>(-2, "你已经领过了", null);
		}
	}	
}
