package spring.mvc.crypto.scheduler;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import spring.mvc.crypto.model.dao.CryptoDao;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.CompareData;
import spring.mvc.crypto.service.CryptoService;


//這個排程任務使用了 @Scheduled 標註，
//每5分鐘執行一次，爬蟲加密貨幣數據並通過 WebSocket 傳送給前端
@Component
public class CryptoDataScheduler {
	
	@Autowired
	@Qualifier("cryptoServiceImpl3")
	private  CryptoService cryptoService;
	
	@Autowired
	private  CryptoDao cryptoDaoMySql;
	
	//每5秒去網站爬資料，然後把它存到資料庫
    @Scheduled(fixedRate = 10000)  // 
    public void crawlCryptoDataAndSendToWebSocket() throws IOException {
        List<CrawlerCurrency> cryptoCurrencies = cryptoService.crawlerCryptoData();
        cryptoDaoMySql.insertCryptos(cryptoCurrencies);
        
    }
    
    
    @Scheduled(fixedRate=10000)
	public void crawlCompareCrypto()throws IOException{
		List<CompareData> cryptoCurrencies=cryptoService.crawlerCompareData();
		cryptoDaoMySql.insertCompareCryptos(cryptoCurrencies);
}
    
    //每10秒爬最新的貨幣資訊，編號從501開始
    @Scheduled(fixedRate=10000)
    	public void crawlTopFiveCrypto()throws IOException{
    		List<CryptoCurrency> cryptoCurrencies=cryptoService.crawlerRanking();
    		cryptoDaoMySql.updateTopFiveCryptos(cryptoCurrencies);
    }
    
    
    
    
    
    
	
	
}
