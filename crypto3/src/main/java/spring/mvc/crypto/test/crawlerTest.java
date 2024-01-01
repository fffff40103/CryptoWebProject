package spring.mvc.crypto.test;

import java.io.IOException;

import spring.mvc.crypto.service.CryptoServiceImpl;
import spring.mvc.crypto.service.CryptoServiceImpl2;

//測試程式

public class crawlerTest {
	public static void main(String[] args) {
		
		CryptoServiceImpl2 test= new CryptoServiceImpl2();
		try {
			test.crawlCryptoData();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
