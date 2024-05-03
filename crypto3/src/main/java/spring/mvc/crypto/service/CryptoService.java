package spring.mvc.crypto.service;

import java.io.IOException;
import java.util.List;

import spring.mvc.crypto.model.entity.CompareData;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;

//用來定義爬蟲邏輯
public interface CryptoService {
	
	 
	  List<CrawlerCurrency> crawlerCryptoData() throws IOException;
	  
	   List<CompareData> crawlerCompareData() throws IOException;
	  
	  List<CryptoCurrency> crawlerRanking()throws IOException;
	 
}