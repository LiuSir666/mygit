package com.zhiyou100.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.UserDao;
import com.zhiyou100.model.User;
import com.zhiyou100.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	public boolean login(User user) {
		
		User savedUser = dao.getUser(user.getUsername());
		
		if (savedUser != null && savedUser.getPassword().equals(user.getPassword())) {
			
			user.setId(savedUser.getId());
			
			return true;
		}else {
			
			return false;
		}
	}

	public void register(User user) {
		
		User savedUser = dao.getUser(user.getUsername());
		
		if (savedUser == null) {
			
			dao.addUser(user);
		}
	}

	public boolean validUsername(String username) {

		// false 用户名不存在
		// true 用户名存在
		return dao.getUser(username) != null;
	}

}
