package kr.co.dohwa.util;

import java.security.MessageDigest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Sha256Util {

	public static String sha256C(String shaPwd) {
		
		try {

			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(shaPwd.getBytes());
			byte byteData[] = md.digest();

			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			StringBuffer hexString = new StringBuffer();
			for (int i=0;i<byteData.length;i++) {
				String hex=Integer.toHexString(0xff & byteData[i]);
				if(hex.length()==1){
					hexString.append('0');
				}
				hexString.append(hex);
			}

			return hexString.toString();
			
		} catch(Exception e) {
			log.error("Sha256Util class >>> sha256C Method >>> error", e);
		}

		return "";
	}
}
