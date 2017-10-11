package com.zhiyou100.dao;

public interface UserCouponDao {

	/**
	 * 领取成功后向 user_coupon 表插入记录
	 * @param userId
	 * @param CouponId
	 * @return SQL 语句操纵的记录数
	 */
	int addUserCoupon(Long userId, Long CouponId);
}
