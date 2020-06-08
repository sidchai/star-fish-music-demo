package com.softeem.utils;

import java.security.MessageDigest;

/**
 * MD5加密
 * 
 * @author pibigstar
 *
 */
public class MD5Util {
	// 加盐
	private static final String slat = "asdqw12#$%$@!(";

	public static String encrypt(String dataStr) {
		try {
			dataStr = dataStr + slat;
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.update(dataStr.getBytes("UTF8"));
			byte s[] = m.digest();
			String result = "";
			for (int i = 0; i < s.length; i++) {
				result += Integer.toHexString((0x000000FF & s[i]) | 0xFFFFFF00).substring(6);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}
}
