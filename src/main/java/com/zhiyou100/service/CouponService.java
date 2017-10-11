package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.Coupon;
import com.zhiyou100.service.exception.CouponIsEmptyException;
import com.zhiyou100.service.exception.CouponIsRecivedException;

public interface CouponService {

	/**
	 * 获取全部的优惠券列表
	 * @return
	 */
	List<Coupon> listCoupon();
	
	/**
	 * 领取优惠券
	 * @return
	 */
	boolean receiveCoupon(Long userId, Long couponId) throws CouponIsEmptyException, CouponIsRecivedException;
}






