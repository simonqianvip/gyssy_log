package com.itheima.domain;

import java.util.Map;

public class Log {
	//公司名称
	private String cn_simple_name;
	//企业代码
	private String enterprise_code;
	//热线
	private String LINKMAN_TEL;
	//计费类型
	private String class_name;
	//spid
	private String SP_ID;
	//服务名称
	private String service_name;
	//业务代码
	private String SERVICE_ID;
	//主叫号码
	private String CALLING_NBR;
	//被叫号码
	private String CALLED_NBR;
	//通话时长
	private float TICKET_DURATION;
	//计费费用
	private float BILLING_CHARGE;
	//通话开始时间
	private String START_DATETIME;
	//通话结束时间
	private String END_DATETIME;
	//按键信息
	private String DIGITS;
	//按键时间
	private String TIME;

	private String row_number;
	private String uuid;
	
	private Map<String, Log> map;
	
	public String getDIGITS() {
		return DIGITS;
	}
	public void setDIGITS(String dIGITS) {
		DIGITS = dIGITS;
	}
	public String getTIME() {
		return TIME;
	}
	public void setTIME(String tIME) {
		TIME = tIME;
	}
	
	public String getSP_ID() {
		return SP_ID;
	}
	public void setSP_ID(String sP_ID) {
		SP_ID = sP_ID;
	}
	public String getSERVICE_ID() {
		return SERVICE_ID;
	}
	public void setSERVICE_ID(String sERVICE_ID) {
		SERVICE_ID = sERVICE_ID;
	}
	public String getCALLING_NBR() {
		return CALLING_NBR;
	}
	public void setCALLING_NBR(String cALLING_NBR) {
		CALLING_NBR = cALLING_NBR;
	}
	public String getCALLED_NBR() {
		return CALLED_NBR;
	}
	public void setCALLED_NBR(String cALLED_NBR) {
		CALLED_NBR = cALLED_NBR;
	}
	public float getTICKET_DURATION() {
		return TICKET_DURATION;
	}
	public void setTICKET_DURATION(float tICKET_DURATION) {
		TICKET_DURATION = tICKET_DURATION;
	}
	public float getBILLING_CHARGE() {
		return BILLING_CHARGE;
	}
	public void setBILLING_CHARGE(float bILLING_CHARGE) {
		BILLING_CHARGE = bILLING_CHARGE;
	}
	
	public String getSTART_DATETIME() {
		return START_DATETIME;
	}
	public void setSTART_DATETIME(String sTART_DATETIME) {
		START_DATETIME = sTART_DATETIME;
	}
	public String getEND_DATETIME() {
		return END_DATETIME;
	}
	public void setEND_DATETIME(String eND_DATETIME) {
		END_DATETIME = eND_DATETIME;
	}
	public String getCn_simple_name() {
		return cn_simple_name;
	}
	public void setCn_simple_name(String cn_simple_name) {
		this.cn_simple_name = cn_simple_name;
	}
	public String getEnterprise_code() {
		return enterprise_code;
	}
	public void setEnterprise_code(String enterprise_code) {
		this.enterprise_code = enterprise_code;
	}
	public String getLINKMAN_TEL() {
		return LINKMAN_TEL;
	}
	public void setLINKMAN_TEL(String lINKMAN_TEL) {
		LINKMAN_TEL = lINKMAN_TEL;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
	}
	public String getRow_number() {
		return row_number;
	}
	public void setRow_number(String row_number) {
		this.row_number = row_number;
	}
	public Map<String, Log> getMap() {
		return map;
	}
	public void setMap(Map<String, Log> map) {
		this.map = map;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
}
