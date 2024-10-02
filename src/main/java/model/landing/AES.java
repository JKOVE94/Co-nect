package model.landing;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AES {
	public static String algorithms = "AES/CBC/PKCS5Padding";
	//사용할 암호 알고리즘 
	public static final String PRIVATEKEY = "CONECTPROJECTKEYCONECTPROJECTKEY"; 
	//암호화, 복호화에 사용할 비밀키
	//AES-256 알고리즘을 사용하므로 32바이트의 문자로 설정
	
	//암호화
	public static String Encode(String ID) throws Exception {
		
		SecretKeySpec secretkey = new SecretKeySpec(PRIVATEKEY.getBytes("UTF-8"),"AES");
		//비밀키를 BYTE배열로 변환 & AES 알고리즘 사용(AES-256)
		IvParameterSpec IV = new IvParameterSpec(PRIVATEKEY.substring(0,16).getBytes());
		//초기화 벡터
		Cipher cipher = Cipher.getInstance(algorithms);
		//객체 생성
		cipher.init(Cipher.ENCRYPT_MODE, secretkey, IV);
		//객체 초기화
		
		byte[] encrypted = cipher.doFinal(ID.getBytes("UTF-8"));
		//암호화 진행
		String result = Base64.getEncoder().encodeToString(encrypted); 
		//암호화 인코딩 후 저장
		
		return result;
	}
	
	public static String Decode(String result) throws Exception  {
		
		SecretKeySpec secretkey = new SecretKeySpec(PRIVATEKEY.getBytes("UTF-8"),"AES");
		IvParameterSpec IV = new IvParameterSpec(PRIVATEKEY.substring(0,16).getBytes());
		
		Cipher cipher = Cipher.getInstance(algorithms);
		cipher.init(Cipher.DECRYPT_MODE, secretkey, IV);
		
		byte[] encrypted = cipher.doFinal(Base64.getDecoder().decode(result));
		String ID = new String(encrypted);
		
		return ID;
	}
}
