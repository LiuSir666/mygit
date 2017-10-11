package com.zhiyou100.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import junit.framework.TestCase;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-service.xml", "classpath:spring/spring-dao.xml"})
public class CouponServiceTest {

	@Autowired
	private CouponService service;
	
	@Test
	public void testListCoupon() {
		fail("Not yet implemented");
	}

	@Test
	public void testReceiveCoupon() {
		
		TestCase.assertEquals(true, service.receiveCoupon(1000L, 1000L));
	}

}
