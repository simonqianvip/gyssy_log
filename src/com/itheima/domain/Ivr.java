package com.itheima.domain;

import java.util.regex.Pattern;

import nl.justobjects.pushlet.util.Sys;

import com.itheima.exception.CheckDataException;

public class Ivr {
	private String caller;
	private String ip;
	private String session;
	private String filename;
	private String spid;
	
	public String getCaller() {
		return caller;
	}
	public void setCaller(String caller) {
		this.caller = caller;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		String regString = "[0-9]+";
		if(!session.equals(" ") || !session.equals(null)){
			if (Pattern.matches(regString, session)){
		    	String hexString = Long.toHexString(Long.parseLong(session));
		    	String upperCase = hexString.toUpperCase();
		    	this.session = upperCase;
		    }else{
		    	this.session = session;
		    }
		}else{
			this.session = session;
		}
	}
	@Override
	public String toString() {
		return  getCaller() + "|"
				+ getIp() + "|" + getSession() + "|";
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSpid() {
		return spid;
	}
	public void setSpid(String spid) {
		this.spid = spid;
	}
	
	

}
