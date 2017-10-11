package com.zhiyou100.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import junit.framework.TestCase;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class UserCouponDaoTest {

	@Autowired
	private UserCouponDao dao;
	
	@Test
	public void testAddUserCoupon() {
		
		TestCase.assertEquals(1, dao.addUserCoupon(1000L, 1000L));
	}
}
