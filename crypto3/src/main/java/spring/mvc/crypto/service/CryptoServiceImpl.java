/*
package spring.mvc.crypto.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;

@Repository
public class CryptoServiceImpl implements CryptoService {
	
	//爬取市值前10大的加密或幣價格
	@Override
	@Scheduled(fixedRate = 10000)
	public List<CrawlerCurrency> crawlerCryptoData1() throws IOException  {
				
				
		
	
				//爬取的網站
				String url = "https://coinmarketcap.com/";

				Document doc=Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36").get();//連結到指定uri
				
				Element tbody =doc.select("tbody").first();//找到第一個tbody標籤
				
				Elements trs = tbody.select("tr");//查找tbody標籤的全部tr子標籤
				
				List<CrawlerCurrency> cryptos = new ArrayList<>();//創造一個資料型別為CryptoCurrency的List
				
				
				//這裡用迴圈來查找市值前10大的加密貨幣，如果要查找市值前20大的加密貨幣只需把10改成20
				int count = 1;
				for (Element tr : trs) {
					if (count <= 10) {
						CrawlerCurrency newCrypto = new CrawlerCurrency();//用迴圈創造CryptoCurreny物件
						
						//設定目標貨幣的Name
						if(tr.child(2).text().split(" ").length>1) {
                        	newCrypto.setpName(tr.child(2).text().split(" ")[1]);
                        }else {
                        	newCrypto.setpName(tr.child(2).text().split(" ")[0]);
                        }
						
						
						//因爬取貨幣的時候要存成Float故把 ex:1,888$的逗點以及$刪除才能以Float型態存入
						newCrypto.setpPrice(Float.parseFloat(tr.child(3).text().replaceAll("[\\$,]", "")));
						
						//此處把爬取資料用subString把爬取波動率 ex:2.32%的%刪除
						newCrypto.setpRate(Float.parseFloat(tr.child(5).text().substring(0, tr.child(5).text().length() - 1)));
						
						newCrypto.setpCap(tr.child(7).text());//因市值是網站自動由小而大排列好的，故用字串存入即可
						
						count++;
						
						cryptos.add(newCrypto);//把每筆貨幣資訊存入List中
					} else {
						break;
					}

				}
                
				for (CrawlerCurrency crypto : cryptos) {
					System.out.println("貨幣名稱:"+crypto.getpName());
					System.out.println("貨幣價格:"+crypto.getpPrice()+"$");
					System.out.println("貨幣漲幅:"+crypto.getpRate()+"%");
					System.out.println("貨幣市值:"+crypto.getpCap()+"$");
					System.out.println("---------------------");
					System.out.println(crypto);
				}
				return cryptos;
				
	}

	@Override
	public List<CrawlerCurrency> crawlerCryptoData() throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CryptoCurrency> crawlerRanking() throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
*/