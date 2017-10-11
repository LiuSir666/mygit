package com.zhiyou100.dao;

import java.util.Date;
import java.util.List;

import com.zhiyou100.model.Coupon;


public interface CouponDao {

	/**
	 * 优惠券列表
	 * @return
	 */
	List<Coupon> listCoupon();
	
	/**
	 * 用户领取优惠券后，更新优惠券数量
	 * @param couponId
	 * @return SQL 语句操作的记录数
	 */
	int updateCoupon(Long couponId, Date currentTime);
}





