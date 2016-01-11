package com.itheima.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import redis.clients.jedis.Jedis;


public class RedisClient {

	private Jedis jedis;

	public RedisClient() {
		this.jedis = new Jedis("183.207.212.44", 6379);
	}
	/**
	 * @param key
	 * @author simon
	 */
	public Map show(String key) {
		Map<String, String> map = this.jedis.hgetAll(key);
		return map;
	}
	
	public boolean isExist(String key){
		boolean flag = this.jedis.exists(key);
		return flag;
	}

	public void showResult() {
		Long size = jedis.dbSize();
		System.out.println("key的总数为=" + size);
	}


//	public static void main(String[] args) {
//		new RedisClient().showResult();
//		new RedisClient().show("15125775960");
//	}
}
