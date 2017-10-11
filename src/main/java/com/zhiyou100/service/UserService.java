package com.zhiyou100.service;

import com.zhiyou100.model.User;

public interface UserService {

	boolean login(User user);
	
	void register(User user);
	
	boolean validUsername(String username);
}
