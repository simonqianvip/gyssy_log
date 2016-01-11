package com.itheima.dao;

import com.itheima.domain.User;

public interface UserDao {
	public boolean hasName(String username);
	public void addUser(User user);
	public boolean isUser(User user);
}
