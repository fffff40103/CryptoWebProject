package spring.mvc.crypto.service;

import java.io.IOException;
import java.util.List;

import spring.mvc.crypto.model.entity.CryptoCurrency;

//用來定義爬蟲邏輯
public interface CryptoService {
	
	 
	  List<CryptoCurrency> crawlCryptoData() throws IOException;
	 
}
