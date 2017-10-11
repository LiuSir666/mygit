package com.zhiyou100.dao;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.Coupon;

import junit.framework.TestCase;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class CouponDaoTest {

	@Autowired
	private CouponDao dao;
	
	@Test
	public void testListCoupon() {
		
		List<Coupon> list = dao.listCoupon();
		
		for (Coupon coupon : list) {
			
			System.out.println(coupon);
		}
	}

	@Test
	public void testUpdateCoupon() {
		
		// TestCase.assertEquals(0, dao.updateCoupon(1001L, new Date()));
		
		TestCase.assertEquals(1, dao.updateCoupon(1000L, new Date()));
	}

}
