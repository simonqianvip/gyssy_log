package com.itheima.service;

import com.itheima.dao.impl.UserDaoImpl;
import com.itheima.domain.User;

public class UserService {
	private UserDaoImpl dao = new UserDaoImpl();
	/**
	 * 注册用户的方法
	 */
//	public void registUser(User user){
//		dao.addUser(user);
//	}
	/**
	 * 检查用户名是否已经被使用的方法
	 */
//	public boolean hasName(String username){
//		return dao.hasName(username);
//	}
	
	/**
	 * 检验用户名密码是否正确的方法
	 */
	public boolean isUser(User user){
		return dao.isUser(user);
	}
}
