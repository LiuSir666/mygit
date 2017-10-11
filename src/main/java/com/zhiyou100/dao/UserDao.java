package com.zhiyou100.dao;

import com.zhiyou100.model.User;

public interface UserDao {

	
	User getUser(String username);
	
	
	int addUser(User user);
}
