package com.itheima.dao;

import java.util.List;

import com.itheima.domain.Log;

public interface BatchQueryDao {
	
	List<Log> findAll(List<Log> list,int startindex, int pagesize);
	
	int getTotalRecords(List<Log> list);
	
	List<Log> findAll(List<Log> list); 

}
