package com.zhiyou100.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhiyou100.dao.CouponDao;
import com.zhiyou100.dao.UserCouponDao;
import com.zhiyou100.model.Coupon;
import com.zhiyou100.service.CouponService;
import com.zhiyou100.service.exception.CouponIsEmptyException;
import com.zhiyou100.service.exception.CouponIsRecivedException;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private UserCouponDao userCouponDao;
	
	public List<Coupon> listCoupon() {
		
		return couponDao.listCoupon();
	}

	@Transactional // 以注解的方式完成事务操作
	// 需要对这两个数据库操作增加一个 事务，有任何一个操作失败数据都回滚到最初的状态
	// 比如：某个人的第二次领取，券数量减一成功，领取记录插入失败，
	// 这个时候就需要把数据回滚到这个方法执行前的状态
	// 只要抛出了 RuntimeException 就会回滚方法内的所有数据库操作
	public boolean receiveCoupon(Long userId, Long couponId) {
		
		// 更新剩余的优惠券数量，flag == 1，领取到券，flag == 0，没有领取到
		// 增加领取记录，flag == 1，记录添加成功，flag == 0，记录添加失败
		
		if (couponDao.updateCoupon(couponId, new Date()) == 0) {
			
			// 券没有了，没有领到，抛异常
			throw new CouponIsEmptyException("你来晚了...");
		}
		
		if (userCouponDao.addUserCoupon(userId, couponId) == 0) {
			
			// 你已经领过了，抛异常
			throw new CouponIsRecivedException("做人不能太贪心");
		}
		
		// 券领了，记录添加了，领取成功
		return true;
	}
}
