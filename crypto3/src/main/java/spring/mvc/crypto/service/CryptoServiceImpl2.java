package spring.mvc.crypto.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;

@Component
public class CryptoServiceImpl2 implements CryptoService {
	
	//爬取市值前10大的加密或幣價格
	@Override
	public List<CrawlerCurrency> crawlerCryptoData() throws IOException  {
			
			List<CrawlerCurrency> cryptos=new ArrayList<>();
			//要爬資料網站的網址
			String url = "https://hk.investing.com/crypto/";
			//因為有些資料會擋爬蟲的人，加入userAgent就是要讓你自己看起來像一個真實的用戶
			Document doc=Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.3").get();//連結到指定uri
			//找到第一個tbody標籤
			Element tBody=doc.select("tbody").first();
			//找到每一個tr標籤
			Elements trTags=tBody.select("tr");
			//每一個tr標籤都代表一個加密貨幣資訊，底下有很多td標籤就是詳細的加密貨幣資訊
			int count=1;
			for(Element trTag:trTags) {
				System.out.println(count);
				CrawlerCurrency newCrypto=new CrawlerCurrency();
				Elements tds=trTag.select("td");
				//分別拿到每個貨幣的名稱、價格、市值、24小時漲幅
				String name=tds.select(".js-currency-symbol").text();
				newCrypto.setpName(name);
				System.out.println(name);
				
				Float price=Float.parseFloat(tds.select(".js-currency-price").text().replaceAll("[\\,]",""));
				newCrypto.setpPrice(price);
				System.out.println(price+"$");
				
				String value=tds.select(".js-market-cap").text();
				newCrypto.setpCap(value);
				System.out.println(value);
				
				Float rate=Float.parseFloat(tds.select(".js-currency-change-24h").text().substring(0,tds.select(".js-currency-change-24h").text().length()-1));
				newCrypto.setpRate(rate);
				System.out.println(rate+"%");
				
				cryptos.add(newCrypto);
				System.out.println("--------------------");
				count++;				
			}							
			return cryptos;	
	}

	@Override
	public List<CryptoCurrency> crawlerRanking() throws IOException {
		
		List<CryptoCurrency> cryptos=new ArrayList<>();
		//要爬資料網站的網址
		String url = "https://hk.investing.com/crypto/";
		//因為有些資料會擋爬蟲的人，加入userAgent就是要讓你自己看起來像一個真實的用戶
		Document doc=Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.3").get();//連結到指定uri
		//找到第一個tbody標籤
		Element tBody=doc.select("tbody").first();
		//找到每一個tr標籤
		Elements trTags=tBody.select("tr");
		//每一個tr標籤都代表一個加密貨幣資訊，底下有很多td標籤就是詳細的加密貨幣資訊
			int count=1;
			int cryptoNumber=501;
			for(Element trTag:trTags) {
				
			
			
				CryptoCurrency newCrypto=new CryptoCurrency();
				//設定資料為5開頭符合資料表
				newCrypto.setcNumber(cryptoNumber);
				Elements tds=trTag.select("td");
				//分別拿到每個貨幣的名稱、價格、市值、24小時漲幅
				String name=tds.select(".js-currency-symbol").text();
				newCrypto.setcName(name);
				System.out.println(name);
				
				Float price=Float.parseFloat(tds.select(".js-currency-price").text().replaceAll("[\\,]",""));
				newCrypto.setPrice(price);
				System.out.println(price+"$");
				
				String value=tds.select(".js-market-cap").text();
				newCrypto.setCap(value);
				System.out.println(value);
				
				Float rate=Float.parseFloat(tds.select(".js-currency-change-24h").text().substring(0,tds.select(".js-currency-change-24h").text().length()-1));
				newCrypto.setRate(rate);
				System.out.println(rate+"%");
				
				cryptos.add(newCrypto);
				System.out.println("--------------------");
				count++;
				cryptoNumber++;
				if(count>10) {
					break;
				}
						
		    }					
		
		return cryptos;
	}
	

}