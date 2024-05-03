<<<<<<< HEAD
package spring.mvc.crypto.model.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import spring.mvc.crypto.model.entity.Account;
import spring.mvc.crypto.model.entity.CompareData;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.StakingDetail;
import spring.mvc.crypto.model.entity.StatusDetail;
import spring.mvc.crypto.model.entity.TransactionDetail;
import spring.mvc.crypto.model.entity.TransferDetail;
import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.model.entity.UserAsset;

public interface CryptoDao {
//	使用者-User:
//	1. 查詢所有使用者(多筆)
	List<User> findAllUsers();
	
//	2. 新增使用者
	int addUser(User user);
	
//	3. 修改密碼
	int updateUserPassword(Integer userId, String newPassword);
	
//	4. 根據使用者名稱查找使用者(登入用-單筆)
	Optional<User> findUserByUsername(String username);
	
//	5. 根據使用者ID查找使用者(單筆)
	Optional<User> findUserById(Integer userId);
	
// 貨幣-Crypto
	
//	1.查詢所有貨幣(多筆)
	List<CrawlerCurrency> findLatestCryptos();
	
//  2.查詢第倒數10隻加密貨幣的前10隻
	List<CompareData> findPrecedingLastTenData();
	
	
//  3.查詢最熱門的5隻貨幣
	List<CryptoCurrency> findTopFiveRanking();
	
	
//  4.新增貨幣
	void addCrypto(CryptoCurrency crypto);
	

//  5.根據貨幣編號尋找該貨幣
	Optional<CryptoCurrency> findCryptoByCryptoId(Integer cNumber);
	
//  6.根據貨幣名稱尋找該貨幣(一定找到)
	CryptoCurrency findCryptoByCryptoNameForsure(String cName);	
	
//  7.根據貨幣名稱尋找該貨幣(不一定找到)
	Optional<CryptoCurrency> findCryptoByCryptoName(String cName);
	
//	8.根據貨幣名稱查找帳戶ID
	public Account findAccountByCryptoName(String cName);
  
//	9.插入批量加密貨幣資訊
	public int[] insertCryptos(List<CrawlerCurrency> cryptos);
	
//  10.插入批量比較資訊
	public int[] insertCompareCryptos(List<CompareData> compareCryptos);

	
//  11.更新既有的5隻最熱門加密貨幣的資訊
	public int updateTopFiveCryptos(List<CryptoCurrency> cryptos);
	

//  12.根據使用者id尋找他現有的資產以及餘額	
	public List<UserAsset> findAssetsByUserId(Integer userId);
	
//  13.根據使用者id在該user新創帳號時新增資產
	public int[] addAssetsByNewUserId(Integer userId);
	
//  14.根據使用者id在使用者購買成功時增加資產	
	public boolean buyCrypto(Float accBalance,Integer userId,Integer accId);
	
//  15.根據使用者id在使用者接收資產成功時增加資產	
	public boolean receiveCrypto(Float accBalance,Integer userId,Integer accId);

//  16.根據使用者id在使用者出售成功時扣除資產		
	
	public boolean sellCrypto(Float accBalance,Integer userId,Integer accId);
	
//  17.根據使用者id在使用者轉帳成功時扣除資產		
	
	public boolean transferCrypto(Float accBalance,Integer userId,Integer accId);

//  18.根據使用者id在使用者購買加密貨幣後扣除usdt
	public boolean deductUSDT(Float balance, Integer userId, Integer accId);

//  19.根據使用者id在使用者售出加密貨幣後增加usdt
	public boolean addUSDT(Float balance, Integer userId, Integer accId);
	
//  20.在使用者質押成功之後根據使用者id扣除Eth裡面的資產
	public boolean stakingCrypto(Float balance,Integer userId);

//  21.在使用者贖回後增加使用者資產
	public boolean redeemCrypto(Float balance,Integer userId);

//  22.更新該使用者的質押狀態(把未贖回改成贖回)
	public boolean changeIsRedeem(Integer stakingId);

		
// 明細-detail
	
//  1.將交易加入交易明細	
	public boolean addTransactionDetail(TransactionDetail  detail);
	
//  2.將轉帳加入交易明細	
	public boolean addTransferDetail(TransferDetail  transferDetail);
	
//	3.加入質押明細
	public boolean addStakingDetail(StakingDetail stakingDetail);

//  4.根據使用者id尋找交易明細
	public List<TransactionDetail> findTransactionDetailByUserId(Integer userId);
	
//	5.根據使用者id尋找轉帳明細
	public List<TransferDetail> findTransferDetailByUserId(Integer userId);
	
//  6.根據使用者id尋找質押明細	
	public List<StakingDetail> findNoneRedeemStakingDetailByUserId(Integer userId);
	
//	7.搜尋所有質押使用者
	public List<StakingDetail >findAllNoneRedeemStakingDetail();
	
//  8.找到所有質押資訊(包誇以贖回以及未贖回)
	public List<StakingDetail> findAllRedeemStakingDetailByUserId(Integer userId);
	
//  9.根據狀態id狀態明細
	
	public Optional<StatusDetail> findStatusById(Integer statusId);
	
	
}
=======
package spring.mvc.crypto.model.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import spring.mvc.crypto.model.entity.Account;
import spring.mvc.crypto.model.entity.CompareData;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.StakingDetail;
import spring.mvc.crypto.model.entity.StatusDetail;
import spring.mvc.crypto.model.entity.TransactionDetail;
import spring.mvc.crypto.model.entity.TransferDetail;
import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.model.entity.UserAsset;

public interface CryptoDao {
//	使用者-User:
//	1. 查詢所有使用者(多筆)
	List<User> findAllUsers();
	
//	2. 新增使用者
	int addUser(User user);
	
//	3. 修改密碼
	int updateUserPassword(Integer userId, String newPassword);
	
//	4. 根據使用者名稱查找使用者(登入用-單筆)
	Optional<User> findUserByUsername(String username);
	
//	5. 根據使用者ID查找使用者(單筆)
	Optional<User> findUserById(Integer userId);
	
// 貨幣-Crypto
//	1.查詢所有貨幣(多筆)
	List<CrawlerCurrency> findLatestCryptos();
	
//  2.查詢第倒數10隻加密貨幣的前10隻
	List<CompareData> findPrecedingLastTenData();
	
	List<CrawlerCurrency> findPrecedingLastTenData2();
	
//  3.查詢最熱門的5隻貨幣
	List<CryptoCurrency> findTopFiveRanking();
	
	
//  4.新增貨幣
	void addCrypto(CryptoCurrency crypto);
	

//  5.根據貨幣編號尋找該貨幣
	Optional<CryptoCurrency> findCryptoByCryptoId(Integer cNumber);
	
//  6.根據貨幣名稱尋找該貨幣(一定找到)
	CryptoCurrency findCryptoByCryptoNameForsure(String cName);	
	
//  7.根據貨幣名稱尋找該貨幣(不一定找到)
	Optional<CryptoCurrency> findCryptoByCryptoName(String cName);
	
//	8.根據貨幣名稱查找帳戶ID
	public Account findAccountByCryptoName(String cName);
  
//	9.插入批量加密貨幣資訊
	public int[] insertCryptos(List<CrawlerCurrency> cryptos);
	
	//插入批量比較資訊
	public int[] insertCompareCryptos(List<CompareData> compareCryptos);

	
//  10.更新既有的5隻最熱門加密貨幣的資訊
	public int updateTopFiveCryptos(List<CryptoCurrency> cryptos);
	

//  11.根據使用者id尋找他現有的資產以及餘額	
	public List<UserAsset> findAssetsByUserId(Integer userId);
	
//  12.根據使用者id在該user新創帳號時新增資產
	public int[] addAssetsByNewUserId(Integer userId);
	
//  13.根據使用者id在使用者購買成功時增加資產	
	public boolean buyCrypto(Float accBalance,Integer userId,Integer accId);
	
//  14.根據使用者id在使用者接收資產成功時增加資產	
	public boolean receiveCrypto(Float accBalance,Integer userId,Integer accId);

//  15.根據使用者id在使用者出售成功時扣除資產		
	
	public boolean sellCrypto(Float accBalance,Integer userId,Integer accId);
	
//  16.根據使用者id在使用者轉帳成功時扣除資產		
	
	public boolean transferCrypto(Float accBalance,Integer userId,Integer accId);

//  17.根據使用者id在使用者購買加密貨幣後扣除usdt
	public boolean deductUSDT(Float balance, Integer userId, Integer accId);

//  18.根據使用者id在使用者售出加密貨幣後增加usdt
	public boolean addUSDT(Float balance, Integer userId, Integer accId);
	
//  19.在使用者質押成功之後根據使用者id扣除Eth裡面的資產
	public boolean stakingCrypto(Float balance,Integer userId);

//  20.在使用者贖回後增加使用者資產
	public boolean redeemCrypto(Float balance,Integer userId);

//  21.更新該使用者的質押狀態(把未贖回改成贖回)
	public boolean changeIsRedeem(Integer stakingId);

		
// 明細-detail
	
//  1.將交易加入交易明細	
	public boolean addTransactionDetail(TransactionDetail  detail);
	
//  2.將轉帳加入交易明細	
	public boolean addTransferDetail(TransferDetail  transferDetail);
	
//	3.加入質押明細
	public boolean addStakingDetail(StakingDetail stakingDetail);

//  3.根據使用者id尋找交易明細
	public List<TransactionDetail> findTransactionDetailByUserId(Integer userId);
	
//	4.根據使用者id尋找轉帳明細
	public List<TransferDetail> findTransferDetailByUserId(Integer userId);
	
//  5.根據使用者id尋找質押明細	
	public List<StakingDetail> findNoneRedeemStakingDetailByUserId(Integer userId);
	
//	6.搜尋所有質押使用者
	public List<StakingDetail >findAllNoneRedeemStakingDetail();
	
//  7.找到所有質押資訊(包誇以贖回以及未贖回)
	public List<StakingDetail> findAllRedeemStakingDetailByUserId(Integer userId);
	
//  8.根據狀態id狀態明細
	
	public Optional<StatusDetail> findStatusById(Integer statusId);
	
	
}
>>>>>>> branch 'master' of https://github.com/fffff40103/CryptoWebProject.git
