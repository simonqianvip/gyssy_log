package com.itheima.util;

import java.util.Properties;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class LinuxUtil {
	
	private static final String LINUX_USERNAME = "yewu";
	private static final String LINUX_PASSWORD = "Gaoyangsray";
//	private static final String LINUX_IP = "10.9.195.166";
	private static final int LINUX_PORT = 22;
	private static ChannelSftp sftp = null;
	private static Session sshSession = null;

	public static ChannelSftp connect(String linux_ip) {
		try {
			JSch jsch = new JSch();
			jsch.getSession(LINUX_USERNAME, linux_ip, LINUX_PORT);
			sshSession = jsch.getSession(LINUX_USERNAME, linux_ip, LINUX_PORT);
			System.out.println("Session created.");
			sshSession.setPassword(LINUX_PASSWORD);
			Properties sshConfig = new Properties();
			sshConfig.put("StrictHostKeyChecking", "no");
			sshSession.setConfig(sshConfig);
			sshSession.connect();
			System.out.println("Session connected.");
			System.out.println("Opening Channel.");
			Channel channel = sshSession.openChannel("sftp");
			channel.connect();
			sftp = (ChannelSftp) channel;
			System.out.println("Connected to " + linux_ip + ".");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sftp;
	}
	
	public static void disconnect() throws Exception {
		if(sshSession!=null){
			if(sshSession.isConnected()){
				sshSession.disconnect();
			}
		}
        if(sftp != null){ 
            if(sftp.isConnected()){ 
                sftp.disconnect(); 
            }else if(sftp.isClosed()){ 
            	System.out.println(" sftp is closed already"); 
            } 
        } 
    } 
}
