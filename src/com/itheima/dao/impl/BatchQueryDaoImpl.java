package com.itheima.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.itheima.dao.BatchQueryDao;
import com.itheima.domain.Log;
import com.itheima.exception.DaoException;
import com.itheima.util.OracleDBCPUtil;

public class BatchQueryDaoImpl implements BatchQueryDao {
	private Connection conn = null;
	private Statement statement = null;
	private ResultSet set = null;
	
	@Override
	public int getTotalRecords(List<Log> list) {
		int count=0;
		try {
			conn = OracleDBCPUtil.getConnection();
			statement = conn.createStatement();
			for(Log log :list){
				
				String sql = "with aa as (select name,a.SP_ID,a.SERVICE_ID,CALLING_NBR,CALLED_NBR,round(ticket_duration/60,2),round(billing_charge/10000,2),"
						+ "to_char(start_datetime,'yyyy-mm-dd hh24:mi:ss') start_datetime,to_char(end_datetime,'yyyy-mm-dd hh24:mi:ss') end_datetime "
						+ "from usage_charge_1203 a,VSP.vsp_service b where a.service_id=b.service_id and start_datetime>=to_date('"+log.getSTART_DATETIME()+"','yyyy-mm-dd hh24:mi:ss') "
						+ "and start_datetime<=to_date('"+log.getEND_DATETIME()+"','yyyy-mm-dd hh24:mi:ss') and calling_nbr='"+log.getCALLING_NBR()+"'),"
						+ "bb as (select a.time,b.UUID, DIGITS,b.caller,b.called,to_char(b.begintime,'yyyy-mm-dd hh24:mi:ss') begintime,"
						+ "to_char(b.endtime,'yyyy-mm-dd hh24:mi:ss') endtime from IVRLOG_CALLKEY a,IVRLOG_CALLdEtail b "
						+ "where a.UUID(+)=b.UUID and caller='"+log.getCALLING_NBR()+"' and b.begintime>=to_date('"+log.getSTART_DATETIME()+"','yyyy-mm-dd hh24:mi:ss') "
						+ "and b.begintime<=to_date('"+log.getEND_DATETIME()+"','yyyy-mm-dd hh24:mi:ss')) "
						+ "select count(*) from aa,bb where aa.calling_nbr=bb.caller and aa.called_nbr=bb.called and start_datetime<=bb.endtime and begintime<=start_datetime ";
				set = statement.executeQuery(sql);
				while(set.next()){
					count = set.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException(e);
		}finally{
			OracleDBCPUtil.relase(set, statement, conn);
		}
		
		return count;
	}

	@Override
	public List<Log> findAll(List<Log> list) {
		Date nowTime = new Date(System.currentTimeMillis());
		SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String retStrFormatNowDate = sdFormatter.format(nowTime);
		List logList = new ArrayList<>();
		 Statement statement = null;
				try {
					conn = OracleDBCPUtil.getConnection();
					statement = conn.createStatement();
					String beginTime = "";
					String endTime = "";
					String callerNbr = "";
					ArrayList<String> result = new ArrayList<String>();
					for(Log log :list){
						callerNbr = log.getCALLING_NBR();
						System.out.println(callerNbr+"  "+retStrFormatNowDate);
						beginTime = log.getSTART_DATETIME();
						endTime = log.getEND_DATETIME();
					
//					String sql = "WITH aa AS (SELECT cn_simple_name,enterprise_code,LINKMAN_TEL,service_id,service_name,b.class_name,SPID,CALLING_NBR,CALLED_NBR,"
//							+ "b.CLASS_ID,ROUND (ticket_duration / 60, 2) ticket_duration,ROUND (billing_charge / 10000, 2) billing_charge,"
//							+ "TO_CHAR (start_datetime, 'yyyy-mm-dd hh24:mi:ss') start_datetime,TO_CHAR (end_datetime, 'yyyy-mm-dd hh24:mi:ss') "
//							+ "end_datetime FROM usage_charge_1203 a, sp_service_info b WHERE a.service_id(+) = b.insert_code AND sett_ruleid IS NULL "
//							+ "AND start_datetime >= TO_DATE ('"+beginTime+"','yyyy-mm-dd hh24:mi:ss') "
//							+ "AND start_datetime <= TO_DATE('"+endTime+"','yyyy-mm-dd hh24:mi:ss') "
//							+ "AND calling_nbr = '"+callerNbr+"'),"
//							+ "bb AS (SELECT a.time, b.UUID,DIGITS,b.caller,b.called,id,TO_CHAR (b.begintime,'yyyy-mm-dd hh24:mi:ss') begintime,"
//							+ "TO_CHAR (b.endtime, 'yyyy-mm-dd hh24:mi:ss') endtime FROM   IVRLOG_CALLKEY a, IVRLOG_CALLdEtail b "
//							+ "WHERE a.UUID(+) = b.UUID AND caller = '"+callerNbr+"' AND b.begintime >= TO_DATE ('"+beginTime+"','yyyy-mm-dd hh24:mi:ss') "
//							+ "AND b.begintime <= TO_DATE ('"+endTime+"','yyyy-mm-dd hh24:mi:ss')),"
//							+ "cc AS (SELECT   dest_id,called_nbr,FEE_CODE / 100 FEE_CODE,TO_CHAR (CREATE_TIME, 'yyyy-mm-dd hh24:mi:ss') "
//							+ "CREATE_TIME FROM   smschange.t_sms_view@ivrpro WHERE   dest_id = '"+callerNbr+"' AND STATUS = 0 "
//							+ "AND CREATE_TIME >= TO_DATE ('"+beginTime+"','yyyy-mm-dd hh24:mi:ss') "
//							+ "AND CREATE_TIME < TO_DATE ('"+endTime+"','yyyy-mm-dd hh24:mi:ss')) "
//							+ "SELECT cn_simple_name,enterprise_code,LINKMAN_TEL,service_id,service_name,class_name,SPID,CALLING_NBR,CALLED_NBR,"
//							+ "ticket_duration,DECODE (substr(CLASS_ID,1,2),'05',FEE_CODE, billing_charge),start_datetime,end_datetime,"
//							+ "time,UUID,DIGITS,caller,called,begintime,endtime,ROW_NUMBER() OVER (PARTITION BY calling_nbr, called_nbr, start_datetime ORDER BY time) rr ,"
//							+ "DENSE_RANK() OVER (order BY calling_nbr, called_nbr, start_datetime) r_id "
//							+ "FROM (SELECT aa.*,bb.*,FEE_CODE,DENSE_RANK () "
//							+ "OVER (PARTITION BY aa.calling_nbr,aa.called_nbr,start_datetime ORDER BY abs(TO_DATE (begintime,'yyyy-mm-dd hh24:mi:ss')-TO_DATE (start_datetime,'yyyy-mm-dd hh24:mi:ss'))) rrr "
//							+ "FROM aa, bb, cc WHERE aa.calling_nbr = bb.caller(+) AND aa.called_nbr = bb.called(+) "
//							+ "AND aa.start_datetime >= bb.begintime(+) AND aa.start_datetime <= bb.endtime(+) "
//							+ "AND aa.calling_nbr = cc.dest_id(+) AND aa.called_nbr = cc.called_nbr(+) "
//							+ "AND aa.start_datetime >= cc.CREATE_TIME(+) AND aa.start_datetime <= cc.CREATE_TIME(+)) WHERE rrr =1 order by 12";
						String sql = "WITH aa AS (SELECT cn_simple_name,enterprise_code,LINKMAN_TEL,service_id,service_name,b.class_name,SPID,CALLING_NBR,CALLED_NBR,b.CLASS_ID,ROUND (ticket_duration / 60, 2) ticket_duration,ROUND (billing_charge / 10000, 2) billing_charge,TO_CHAR (start_datetime, 'yyyy-mm-dd hh24:mi:ss') start_datetime,TO_CHAR (end_datetime, 'yyyy-mm-dd hh24:mi:ss') end_datetime FROM usage_charge_1203 a, sp_service_info b WHERE a.service_id(+) = b.insert_code AND sett_ruleid IS NULL AND start_datetime >= TO_DATE ('" + 
						          beginTime + "','yyyy-mm-dd hh24:mi:ss') " + 
						          "AND start_datetime <= TO_DATE('" + endTime + "','yyyy-mm-dd hh24:mi:ss') " + 
						          "AND calling_nbr = '" + callerNbr + "')," + 
						          "bb AS (SELECT a.time, b.UUID,DIGITS,b.caller,b.called,id,TO_CHAR (b.begintime,'yyyy-mm-dd hh24:mi:ss') begintime," + 
						          "TO_CHAR (b.endtime, 'yyyy-mm-dd hh24:mi:ss') endtime FROM   IVRLOG_CALLKEY a, IVRLOG_CALLdEtail b " + 
						          "WHERE a.UUID(+) = b.UUID AND caller = '" + callerNbr + "' AND b.begintime >= TO_DATE ('" + beginTime + "','yyyy-mm-dd hh24:mi:ss') " + 
						          "AND b.begintime <= TO_DATE ('" + endTime + "','yyyy-mm-dd hh24:mi:ss'))," + 
						          "cc AS (SELECT   dest_id,called_nbr,FEE_CODE / 100 FEE_CODE,TO_CHAR (CREATE_TIME, 'yyyy-mm-dd hh24:mi:ss') " + 
						          "CREATE_TIME FROM   smschange.t_sms_view@ivrpro WHERE   dest_id = '" + callerNbr + "' AND STATUS = 0 " + 
						          "AND CREATE_TIME >= TO_DATE ('" + beginTime + "','yyyy-mm-dd hh24:mi:ss') " + 
						          "AND CREATE_TIME < TO_DATE ('" + endTime + "','yyyy-mm-dd hh24:mi:ss')) " + 
						          "SELECT cn_simple_name,enterprise_code,LINKMAN_TEL,service_id,service_name,class_name,SPID,CALLING_NBR,CALLED_NBR," + 
						          "ticket_duration,DECODE (substr(CLASS_ID,1,2),'05',FEE_CODE, billing_charge),start_datetime,end_datetime," + 
						          "decode(UUID,NULL,'X',TIME),nvl(UUID,sys_guid()),DIGITS,caller,called,begintime,endtime,ROW_NUMBER() OVER (PARTITION BY calling_nbr, called_nbr, start_datetime ORDER BY time) rr ,DENSE_RANK() OVER (order BY calling_nbr, called_nbr, start_datetime) r_id " + 
						          "FROM (SELECT aa.*,bb.*,FEE_CODE,DENSE_RANK () " + 
						          "OVER (PARTITION BY aa.calling_nbr,aa.called_nbr,start_datetime ORDER BY abs(TO_DATE (begintime,'yyyy-mm-dd hh24:mi:ss')-TO_DATE (start_datetime,'yyyy-mm-dd hh24:mi:ss'))) rrr " + 
						          "FROM aa, bb, cc WHERE aa.calling_nbr = bb.caller(+) AND aa.called_nbr = bb.called(+) " + 
						          "AND aa.start_datetime >= bb.begintime(+) AND aa.start_datetime <= bb.endtime(+) " + 
						          "AND aa.calling_nbr = cc.dest_id(+) AND aa.called_nbr = cc.called_nbr(+) " + 
						          "AND aa.start_datetime >= cc.CREATE_TIME(+) AND aa.start_datetime <= cc.CREATE_TIME(+)) WHERE rrr =1  order by 12";
					
							set = statement.executeQuery(sql);
						
						while(set.next()){
							Log logInfo = new Log();
							logInfo.setCn_simple_name(set.getString(1));
							logInfo.setEnterprise_code(set.getString(2));
							logInfo.setLINKMAN_TEL(set.getString(3));
							logInfo.setSERVICE_ID(set.getString(4));
							logInfo.setService_name(set.getString(5));
							logInfo.setClass_name(set.getString(6));
							logInfo.setSP_ID(set.getString(7));
							logInfo.setCALLING_NBR(set.getString(8));
							logInfo.setCALLED_NBR(set.getString(9));
							logInfo.setTICKET_DURATION(set.getFloat(10));
							logInfo.setBILLING_CHARGE(set.getFloat(11));
							logInfo.setSTART_DATETIME(set.getString(12));
							logInfo.setEND_DATETIME(set.getString(13));
							logInfo.setTIME(set.getString(14));
							logInfo.setDIGITS(set.getString(16));
							logInfo.setRow_number(set.getString(21));
							logInfo.setUuid(set.getString(15));
							logList.add(logInfo);
						}
					}
				}catch (SQLException e) {
					e.printStackTrace();
					throw new RuntimeException("对不起，服务器出现故障！" + e.getMessage());
				}finally{
					OracleDBCPUtil.relase(set, statement, conn);
				}
				return logList;
	}
	
	@Override
	public List<Log> findAll(List<Log> list,int startindex, int pagesize) {
		List logList = new ArrayList<>();
				try {
					conn = OracleDBCPUtil.getConnection();
					statement = conn.createStatement();
					StringBuffer sb = new StringBuffer();
					String beginTime = "";
					String endTime = "";
					String callerNbr = "";
					for(Log log :list){
						callerNbr = log.getCALLING_NBR();
						beginTime = log.getSTART_DATETIME();
						endTime = log.getEND_DATETIME();
					
					String str = sb.toString();
					String callerList = str.substring(0, str.length()-1);
					System.out.println(callerList);
						String sql = "with aa as (select name,a.SP_ID,a.SERVICE_ID,CALLING_NBR,CALLED_NBR,round(ticket_duration/60,2),round(billing_charge/10000,2),"
								+ "to_char(start_datetime,'yyyy-mm-dd hh24:mi:ss') start_datetime,to_char(end_datetime,'yyyy-mm-dd hh24:mi:ss') end_datetime "
								+ "from usage_charge_1203 a,VSP.vsp_service b where a.service_id=b.service_id and start_datetime>=to_date('"+beginTime+"','yyyy-mm-dd hh24:mi:ss') "
								+ "and start_datetime<=to_date('"+endTime+"','yyyy-mm-dd hh24:mi:ss') and calling_nbr in("+callerList+")),"
								+ "bb as (select a.time,b.UUID, DIGITS,b.caller,b.called,to_char(b.begintime,'yyyy-mm-dd hh24:mi:ss') begintime,"
								+ "to_char(b.endtime,'yyyy-mm-dd hh24:mi:ss') endtime from IVRLOG_CALLKEY a,IVRLOG_CALLdEtail b "
								+ "where a.UUID(+)=b.UUID and caller in("+callerList+") and b.begintime>=to_date('"+beginTime+"','yyyy-mm-dd hh24:mi:ss') "
								+ "and b.begintime<=to_date('"+endTime+"','yyyy-mm-dd hh24:mi:ss')) "
								+ "select * from (select aa.*,bb.*,rownum as rowno from aa,bb where aa.calling_nbr=bb.caller and aa.called_nbr=bb.called "
								+ "and start_datetime<=bb.endtime and begintime<=start_datetime and rownum <="+(pagesize+startindex)+") ta where ta.rowno >="+startindex;
						set = statement.executeQuery(sql);
						while(set.next()){
							Log logInfo = new Log();
							logInfo.setCn_simple_name(set.getString(1));
							logInfo.setEnterprise_code(set.getString(2));
							logInfo.setLINKMAN_TEL(set.getString(3));
							logInfo.setSERVICE_ID(set.getString(4));
							logInfo.setService_name(set.getString(5));
							logInfo.setClass_name(set.getString(6));
							logInfo.setSP_ID(set.getString(7));
							logInfo.setCALLING_NBR(set.getString(8));
							logInfo.setCALLED_NBR(set.getString(9));
							logInfo.setTICKET_DURATION(set.getFloat(10));
							logInfo.setBILLING_CHARGE(set.getFloat(11));
							logInfo.setSTART_DATETIME(set.getString(12));
							logInfo.setEND_DATETIME(set.getString(13));
							logInfo.setTIME(set.getString(14));
							logInfo.setDIGITS(set.getString(16));
							logList.add(logInfo);
						}
					}
				}catch (SQLException e) {
					e.printStackTrace();
					throw new DaoException(e);
				}finally{
					OracleDBCPUtil.relase(set, statement, conn);
					
				}
				return logList;
	}

}
