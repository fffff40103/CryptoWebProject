package spring.mvc.crypto.scheduler;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import spring.mvc.crypto.model.dao.CryptoDao;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.service.CryptoService;
import spring.mvc.crypto.service.WebSocketService;

//這個排程任務使用了 @Scheduled 標註，
//每5分鐘執行一次，爬蟲加密貨幣數據並通過 WebSocket 傳送給前端
@Component
public class CryptoDataScheduler {
	
	@Autowired
	@Qualifier("cryptoServiceImpl2")
	private  CryptoService cryptoService;
	
	@Autowired
	private  CryptoDao cryptoDaoMySql;
	
	//每5秒去網站爬資料，然後把它存到資料庫
    @Scheduled(fixedRate = 5000)  // 
    public void crawlCryptoDataAndSendToWebSocket() throws IOException {
        List<CryptoCurrency> cryptoCurrencies = cryptoService.crawlCryptoData();
        cryptoDaoMySql.insertCryptos(cryptoCurrencies);
        
    }
	
	
}
