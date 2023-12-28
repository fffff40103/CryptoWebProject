package spring.mvc.crypto.service;

import java.util.List;

import spring.mvc.crypto.model.entity.CryptoCurrency;

//用於處理WebSocket相關操作
public interface WebSocketService {
	
	
	void sendCryptoData(List<CryptoCurrency> cryptoCurrencies);
	
}
