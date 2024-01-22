package spring.mvc.crypto.test;

import spring.mvc.crypto.security.sample.AESSample;

public class EncryptionTest {
	public static void main(String[] args) throws Exception {
		AESSample aes=new AESSample();
		aes.encryption("abc123");
		aes.decryption("FGD3QM5dVuitUHHHPC1YoA==");
		
	}
}
