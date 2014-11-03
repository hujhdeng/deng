package com.renrenxian.common.util;

import java.security.MessageDigest;

/**
 * md5
 * 
 * @author haoxw
 * 
 */
public class MD5 {

	final static char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7',
			'8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	/**
	 * Encodes a string
	 * 
	 * @param str
	 *            String to encode
	 * @return Encoded String
	 */
	public static String crypt(String str) {
		return crypt(str, Charsets.UTF8.encoding);
	}

	/**
	 * encode a string with given encoding
	 * 
	 * @param str
	 *            String to encode
	 * @param charSet
	 *            encoding
	 * @return the encode String
	 */
	public static String crypt(String str, String charSet) {
		if (str == null || str.length() == 0 || charSet == null) {
			throw new IllegalArgumentException(
					"String or charset to encript cannot be null or zero length");
		}
		return getMD5(Charsets.getBytes(str, charSet));
	}

	@Deprecated
	public static String getMD5(byte[] source) {
		return crypt(source);
	}

	/**
	 * encode bytes
	 * 
	 * @param source
	 *            source bytes
	 * @return the encode String
	 */
	public static String crypt(byte[] source) {
		String s = null;

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(source);
			byte tmp[] = md.digest();
			char str[] = new char[16 * 2];
			int k = 0;
			for (int i = 0; i < 16; i++) {
				byte byte0 = tmp[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];

				str[k++] = hexDigits[byte0 & 0xf];
			}
			s = new String(str);

		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}
		return s;
	}
	
	public static void main(String[] args) {
    System.out.println(MD5.crypt("60000170230|WEB|WEB|813e7f5a-b134-410a-bfe8-958e533bee19|1408590570297"));
    System.out.println(new java.util.Date(1408688761252L));
    System.out.println(new java.util.Date(1408590570297L));
  }

}
