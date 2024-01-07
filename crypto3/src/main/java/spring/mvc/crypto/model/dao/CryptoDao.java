package spring.mvc.crypto.model.dao;

import java.util.List;
import java.util.Optional;

import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.User;

public interface CryptoDao {
//	使用者-User:
//	1. 查詢所有使用者(多筆)
	List<User> findAllUsers();
	
//	2. 新增使用者
	void addUser(User user);
	
//	3. 修改密碼
	Boolean updateUserPassword(Integer userId, String newPassword);
	
//	4. 根據使用者名稱查找使用者(登入用-單筆)
	Optional<User> findUserByUsername(String username);
	
//	5. 根據使用者ID查找使用者(單筆)
	Optional<User> findUserById(Integer userId);
	
// 貨幣-Crypto
//	1.查詢所有貨幣(多筆)
	List<CrawlerCurrency> findLatestCryptos();
	
//  2.查詢最熱門的5隻貨幣
	List<CryptoCurrency> findTopFiveRanking();
	
//  3.新增貨幣
	void addCrypto(CryptoCurrency crypto);
	
//  4.根據貨幣編號尋找該貨幣
	Optional<CryptoCurrency> findCryptoByCryptoId(Integer cNumber);
	
//  5.插入批量加密貨幣資訊
	public int[] insertCryptos(List<CrawlerCurrency> cryptos);
	
//  6.更新既有的5隻最熱門加密貨幣的資訊
	public int updateTopFiveCryptos(List<CryptoCurrency> cryptos);
}
