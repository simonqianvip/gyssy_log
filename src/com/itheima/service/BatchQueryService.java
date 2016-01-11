package com.itheima.service;

import java.util.List;

import com.itheima.dao.impl.BatchQueryDaoImpl;
import com.itheima.domain.Log;
import com.itheima.web.bean.Page;


public class BatchQueryService {
	private BatchQueryDaoImpl dao = new BatchQueryDaoImpl();
	
	public List<Log> findAll(List<Log> list){
		return dao.findAll(list);
	}
	
	public List<Log> findAll(List<Log> list,int startindex, int pagesize){
		return dao.findAll(list,startindex,pagesize);
	}
	public Page findAllLogs(String pagenum,List list) {
		int num = 1;
		if(pagenum!=null&&!pagenum.equals(""))
			num = Integer.parseInt(pagenum);
		int totalrecords = dao.getTotalRecords(list);
		Page page = new Page(num,totalrecords);
		List records = dao.findAll(list, page.getStartindex(),page.getPagesize());
		page.setRecords(records);
		return page;
	}
	
}
