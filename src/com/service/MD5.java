package com.service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5 {
	
	/*MD5密码加密*/
	
	/*public static String MD5password(String password) {
		
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte[] result = digest.digest(password.getBytes());
			StringBuffer sb = new StringBuffer();
			//把每一个byte做一个与运算：0xff
			for(byte b : result) {
				//与运算
				int number = b & 0xff;
				String str = Integer.toHexString(number);
				if(str.length() == 1) {
					sb.append("0");
				}
				sb.append(str);
			}
			return sb.toString();
		} catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "";
		}
	}*/
	
	public static String MD5password(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base = new BASE64Encoder();
		String newpassword = base.encode(md5.digest(password.getBytes("utf-8")));
		
		return newpassword;
		
	}
	
	public static boolean Checkpassword(String newpassword, String oldpassword) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		
		if(MD5password(newpassword).equals(oldpassword)) {
			return true;
		} else {
			return false;
		}
	}
	
	/*public static void main(String []args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String s = "123456";
		System.out.println(MD5password(s));
	}*/
}
