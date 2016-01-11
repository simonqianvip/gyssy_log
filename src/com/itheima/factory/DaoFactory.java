package com.itheima.factory;

import java.io.FileInputStream;
import java.util.Properties;

import com.itheima.dao.UserDao;

public class DaoFactory {
	private static DaoFactory factory = new DaoFactory();
	private static Properties prop = null;
	static {
		try{
			String path = DaoFactory.class.getClassLoader().getResource("config.properties").getPath();
			prop = new Properties();
			prop.load(new FileInputStream(path));
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	private DaoFactory() {
		// TODO Auto-generated constructor stub
	}
	public static DaoFactory getInstance(){
		return factory;
	}
	public UserDao getDao(){
		try {
			String classStr = prop.getProperty("dao");
			Class clazz = Class.forName(classStr);
			return (UserDao)clazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}
