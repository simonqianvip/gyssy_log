package com.itheima.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.jcraft.jsch.ChannelSftp;

public class StrUtil {
	private long lastTimeFileSize = 0; // �ϴ��ļ���С
	public static String formatData(String name){
		String filename = null;
		if(!name.equals(" ") || !name.equals(null)){
			String[] splits = name.split(" ");
			filename = splits[splits.length-1];
		}
		return filename;
	}
	/**
	 * 根据条件找到匹配的文件
	 * @param vector
	 * @param condition
	 * @return
	 */
	public static String traverse(Vector vector,String condition){
		String result = "";
		ArrayList list = new ArrayList();
		for(int i = 0;i < vector.size();i++){
			String file = String.valueOf(vector.get(i));
			if(file.contains(condition)){
				list.add(file);
				if(list.size()>1){
					//取出最新的文件
					for(Object str:list){
						System.out.println("路径下的所有文件========="+String.valueOf(str));
					}
					String splitWord = sort(list);
					for(Object obj:list){
						String str = String.valueOf(obj);
						if(str.contains(splitWord)){
							result = str;
						}
					}
				}else{
					result = file;
				}
			}
		} 
		return result;
	}
	
	/**
	 * 对集合进行升序排列，返回最大值
	 * @param arrayList
	 * @return
	 */
	public static String sort(List arrayList){
		ArrayList<String> list = new ArrayList<String>();
		for(Object line:arrayList){
			String str = String.valueOf(line);
			String[] split = str.split(".log_");
			list.add(split[split.length-1]);
		}
		Collections.sort(list);
		
		System.out.println(list.get(list.size()-1));
		return list.get(list.size()-1);
	}
	
	
	public void realtimeShowLog(String filename) throws Exception {
		ChannelSftp sftp = LinuxUtil.connect("172.16.10.199");
		String stream2String = inputStream2String(sftp.get(filename));
		// ָ���ļ��ɶ���д
		final RandomAccessFile randomFile = new RandomAccessFile(stream2String,
				"rw");
		// ����һ���߳�ÿ10���Ӷ�ȡ��������־��Ϣ
		ScheduledExecutorService exec = Executors.newScheduledThreadPool(1);
		exec.scheduleWithFixedDelay(new Runnable() {
			public void run() {
				try {
					// ��ñ仯���ֵ�
					randomFile.seek(lastTimeFileSize);
					String tmp = "";
					while ((tmp = randomFile.readLine()) != null) {
						System.out.println(new String(tmp.getBytes("ISO8859-1")));
					}
					lastTimeFileSize = randomFile.length();
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}, 0, 1, TimeUnit.SECONDS);
	}
	
	
	/**
	 * ʵʱ�����־��Ϣ
	 * 
	 * @param logFile
	 *            ��־�ļ�
	 * @throws Exception
	 */

	public String inputStream2String(InputStream is) throws Exception {
		BufferedReader in = new BufferedReader(new InputStreamReader(is));
		StringBuffer buffer = new StringBuffer();
		String line = "";
		while ((line = in.readLine()) != null) {
			buffer.append(line);
		}
		return buffer.toString();
	}
	
	public static void main(String[] args) {
		String name = "scu0067-02";
		String name1 = "ABDscu";
		String upperCase = name.toUpperCase();
		String lowerCase = name1.toLowerCase();
		System.out.println(upperCase);
		System.out.println(lowerCase);
	}
	

}
