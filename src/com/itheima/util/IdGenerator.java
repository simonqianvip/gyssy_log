package com.itheima.util;

import java.math.BigInteger;
import java.util.Random;

//ID生成器
public class IdGenerator {
	public static String genPK(){
//		return UUID.randomUUID().toString();//在网络上生成一个唯一的字符串
		return new BigInteger(165, new Random()).toString(36).toUpperCase();
	}
}
