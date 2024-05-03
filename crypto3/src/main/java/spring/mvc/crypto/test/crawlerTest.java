package spring.mvc.crypto.test;


import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import spring.mvc.crypto.model.entity.CompareData;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.service.CryptoService;
import spring.mvc.crypto.service.CryptoServiceImpl2;
import spring.mvc.crypto.service.CryptoServiceImpl3;

public class crawlerTest {
	

	
	public static void main(String[] args) throws IOException {
		//String api_key="ce3d7453caab5e81ca09e980616a71cdb42b857b37d91296a798d4dad70d3eff";
		CryptoService cryptoService=new CryptoServiceImpl3();
		List<CryptoCurrency> crawlerCurrencies= cryptoService.crawlerRanking();
		for(CryptoCurrency currency:crawlerCurrencies) {
			System.out.println(currency);
		}
		
		

	}
	
}


