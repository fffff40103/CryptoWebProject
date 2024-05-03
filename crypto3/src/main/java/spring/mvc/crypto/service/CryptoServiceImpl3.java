package spring.mvc.crypto.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import spring.mvc.crypto.model.entity.CompareData;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;

@Component
public class CryptoServiceImpl3 implements CryptoService {
	// 爬取資料需要的api_key
	String api_key = "ce3d7453caab5e81ca09e980616a71cdb42b857b37d91296a798d4dad70d3eff";

	// 需要爬取的貨幣名稱
	String[] wantedCryptos = {"BTC", "ETH", "BNB", "SOL", "USDT", "XRP", "DOGE", "TON", "ADA", "TRX"};

	// 爬取市值前10大的加密或幣價格
	@Override
	public List<CrawlerCurrency> crawlerCryptoData() throws IOException {
		// 要爬的貨幣

		List<CrawlerCurrency> cryptos = new ArrayList<>();
		// 把貨幣資訊儲存到個別物件裡面
		for (String wantedCrypto : wantedCryptos) {
			// 每次的迴圈產生對應的貨幣以及相關資訊
			CrawlerCurrency crawlerCurrency = new CrawlerCurrency();
			// 價格的API
			String priceApi = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=" + wantedCrypto
					+ "&tsyms=USD&api_key=" + api_key;
			Document doc = Jsoup.connect(priceApi).ignoreContentType(true).get();
			// 將返回的 JSON 字符串轉換為 JSONObject
			JSONObject jsonObject = new JSONObject(doc.text());

			// 得到現在價格
			String currentPrice = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("PRICE");

			// 得到24小時前的價格
			String recordPrice = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("OPEN24HOUR");
			// 得到市值
			String marketCap = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("MKTCAP");
			// 把價格都換成Float
			Float floatCurrentPrice = Float.valueOf(currentPrice.replace(",", "").substring(1).trim());

			Float floatRecordPrice = Float.valueOf(recordPrice.replace(",", "").substring(1).trim());
			// 漲跌幅計算
			Float priceChage = ((floatCurrentPrice - floatRecordPrice) / floatRecordPrice) * 100;
			String twoDigitsStringRate = String.format("%.02f", priceChage);
			Float twoDigitsFloatRate = Float.valueOf(twoDigitsStringRate);

			// 把相關資訊加入每次產生的類別
			crawlerCurrency.setpPrice(floatCurrentPrice);
			crawlerCurrency.setpRate(twoDigitsFloatRate);
			crawlerCurrency.setpName(wantedCrypto);
			crawlerCurrency.setpCap(marketCap);
			// 把個別貨幣資訊加入ArrayList
			cryptos.add(crawlerCurrency);
		}
		return cryptos;
	}

	// 爬取市值前10大的加密或幣價格
	@Override
	public List<CompareData> crawlerCompareData() throws IOException {
		// 比較的資料
		List<CompareData> compareCryptos = new ArrayList<>();

		// 把貨幣資訊儲存到個別物件裡面
		for (String wantedCrypto : wantedCryptos) {
			// 每次的迴圈產生對應的貨幣以及相關資訊
			CompareData compareData = new CompareData();
			// 價格的API
			String priceApi = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=" + wantedCrypto
					+ "&tsyms=USD&api_key=" + api_key;
			Document doc = Jsoup.connect(priceApi).ignoreContentType(true).get();
			// 將返回的 JSON 字符串轉換為 JSONObject
			JSONObject jsonObject = new JSONObject(doc.text());

			// 得到現在價格
			String currentPrice = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("PRICE");

			// 得到24小時前的價格
			String recordPrice = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("OPEN24HOUR");
			// 得到市值
			String marketCap = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("MKTCAP");
			// 把價格都換成Float
			Float floatCurrentPrice = Float.valueOf(currentPrice.replace(",", "").substring(1).trim());

			Float floatRecordPrice = Float.valueOf(recordPrice.replace(",", "").substring(1).trim());
			// 漲跌幅計算
			Float priceChage = ((floatCurrentPrice - floatRecordPrice) / floatRecordPrice) * 100;
			String twoDigitsStringRate = String.format("%.02f", priceChage);
			Float twoDigitsFloatRate = Float.valueOf(twoDigitsStringRate);

			// 把相關資訊加入每次產生的類別
			compareData.setComparePrice(floatCurrentPrice);
			compareData.setCompareRate(twoDigitsFloatRate);
			compareData.setCompareName(wantedCrypto);
			compareData.setCompareCap(marketCap);
			// 把個別貨幣資訊加入ArrayList
			compareCryptos.add(compareData);
		}
		return compareCryptos;
	}

	@Override
	public List<CryptoCurrency> crawlerRanking() throws IOException {
		int cryptoNumber = 501;
		// 獨立的資料
		List<CryptoCurrency> uniqueCryptoInfos = new ArrayList<>();

		// 把貨幣資訊儲存到個別物件裡面
		for (String wantedCrypto : wantedCryptos) {
			// 每次的迴圈產生對應的貨幣以及相關資訊
			CryptoCurrency cryptoCurrency = new CryptoCurrency();
			// 價格的API
			String priceApi = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=" + wantedCrypto
					+ "&tsyms=USD&api_key=" + api_key;
			Document doc = Jsoup.connect(priceApi).ignoreContentType(true).get();
			// 將返回的 JSON 字符串轉換為 JSONObject
			JSONObject jsonObject = new JSONObject(doc.text());

			// 得到現在價格
			String currentPrice = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("PRICE");

			// 得到24小時前的價格
			String recordPrice = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("OPEN24HOUR");
			// 得到市值
			String marketCap = jsonObject.getJSONObject("DISPLAY").getJSONObject(wantedCrypto).getJSONObject("USD")
					.getString("MKTCAP");
			// 把價格都換成Float
			Float floatCurrentPrice = Float.valueOf(currentPrice.replace(",", "").substring(1).trim());

			Float floatRecordPrice = Float.valueOf(recordPrice.replace(",", "").substring(1).trim());
			// 漲跌幅計算
			Float priceChage = ((floatCurrentPrice - floatRecordPrice) / floatRecordPrice) * 100;
			String twoDigitsStringRate = String.format("%.02f", priceChage);
			Float twoDigitsFloatRate = Float.valueOf(twoDigitsStringRate);

			// 把相關資訊加入每次產生的類別
			cryptoCurrency.setcNumber(cryptoNumber);
			cryptoCurrency.setPrice(floatCurrentPrice);
			cryptoCurrency.setRate(twoDigitsFloatRate);
			cryptoCurrency.setcName(wantedCrypto);
			cryptoCurrency.setCap(marketCap);
			// 把個別貨幣資訊加入ArrayList
			uniqueCryptoInfos.add(cryptoCurrency);
			cryptoNumber++;
		}
		return uniqueCryptoInfos;

	}

}