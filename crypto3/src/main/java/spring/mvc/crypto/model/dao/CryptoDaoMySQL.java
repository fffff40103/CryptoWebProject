package spring.mvc.crypto.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.mvc.crypto.model.entity.Account;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.model.entity.UserAsset;

@Repository
public class CryptoDaoMySQL implements CryptoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	// 使用者-User:

	// 1. 查詢所有使用者(多筆)
	@Override
	public List<User> findAllUsers() {
		String sql = "select userId,username,password from user ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));

	}

	// 2. 新增使用者
	@Override
	public void addUser(User user) {
		String sql = "insert into user(username, password) values(?, ?)";
		jdbcTemplate.update(sql, user.getUsername(), user.getPassword());

	}

	// 3. 修改密碼
	@Override
	public Boolean updateUserPassword(Integer userId, String newPassword) {
		// TODO Auto-generated method stub
		return null;
	}

	// 4. 根據使用者名稱查找使用者(登入用-單筆)
	@Override
	public Optional<User> findUserByUsername(String username) {
		String sql = "select userId,username,password from user where username=?";
		try {
			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
			return Optional.ofNullable(user);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}

	// 5. 根據使用者ID查找使用者(單筆)
	@Override
	public Optional<User> findUserById(Integer userId) {
		String sql = "select userId,username,password from user where userId=?";
		try {
			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), userId);
			return Optional.ofNullable(user);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
	// 貨幣資訊Crypto:
	@Override
	//1.查詢所有貨幣(多筆)
	public List<CrawlerCurrency> findLatestCryptos() {
		String sql="SELECT *\r\n"
				+ "FROM (\r\n"
				+ "    SELECT *\r\n"
				+ "    FROM crawlerdata\r\n"
				+ "    ORDER BY pNumber DESC\r\n"
				+ "    LIMIT 10\r\n"
				+ ") AS subquery\r\n"
				+ "ORDER BY pNumber ASC\r\n"
				+ "LIMIT 10";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(CrawlerCurrency.class));
	}
	
	//2.查詢最熱門的5隻貨幣
	@Override
	public List<CryptoCurrency> findTopFiveRanking() {
		String sql="select cNumber,cName,price,rate,cap from cryptoinfo limit 5";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(CryptoCurrency.class));
	}
	
    //  3.新增貨幣
	@Override
	public void addCrypto(CryptoCurrency crypto) {
		String sql="insert into cryptoInfo(name,price,value,rate) values(?,?,?,?)";
		jdbcTemplate.update(sql,crypto.getcName(),crypto.getPrice(),crypto.getCap(),crypto.getRate());
		
	}
	
    //  4.根據貨幣編號尋找該貨幣
	@Override
	public Optional<CryptoCurrency> findCryptoByCryptoId(Integer cNumber) {
		String sql="select cNumber,cName,price,rate,cap from cryptoInfo where cNumber=?";
		try {
			CryptoCurrency crypto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(CryptoCurrency.class), cNumber);
			return Optional.ofNullable(crypto);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
	// 5.根據貨幣名稱尋找該貨幣
	@Override
	public Optional<CryptoCurrency> findCryptoByCryptoName(String cName) {
		String sql="select cNumber,cName,price,rate,cap from cryptoInfo where cName=?";
		try {
			CryptoCurrency crypto=jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(CryptoCurrency.class), cName);
			return Optional.ofNullable(crypto);
		}catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
		
	}
	
	//5.批量插入最新爬取的10隻加密貨幣
	@Override
	public int[] insertCryptos(List<CrawlerCurrency> cryptos) {
		String sql="insert into crawlerData(pName,pPrice,pRate,pCap) values(?,?,?,?)";
		return this.jdbcTemplate.batchUpdate(
				sql,
				new BatchPreparedStatementSetter() {

					public void setValues(PreparedStatement ps, int i) throws SQLException {
						ps.setString(1, cryptos.get(i).getpName());
						ps.setFloat(2, cryptos.get(i).getpPrice());					
						ps.setFloat(3,cryptos.get(i).getpRate());
						ps.setString(4,cryptos.get(i).getpCap() );
					}

					public int getBatchSize() {
						return cryptos.size();
					}

				});
	}

	//6.更新既有的最熱門5隻加密貨幣
	@Override
	public int updateTopFiveCryptos(List<CryptoCurrency> cryptos) {
		String sql="update cryptoinfo set cName=?,price=?,rate=?,cap=? where cNumber=?";
		int result=0;
		for(CryptoCurrency crypto:cryptos) {
			int count=jdbcTemplate.update(sql,crypto.getcName(),crypto.getPrice(),crypto.getRate(),crypto.getCap(),crypto.getcNumber());
			result+=count;
		}
		return result;
	}
    
	//7.助教測試
	@Override
	public List<CryptoCurrency> findCryptosByUserId(Integer userId) {
		
		String sql="SELECT \r\n"
				+ "    cryptoinfo.cNumber, cryptoinfo.cName, cryptoinfo.price, cryptoinfo.rate, cryptoinfo.cap\r\n"
				+ "FROM user_ref_account\r\n"
				+ "JOIN account ON user_ref_account.accId = account.accId\r\n"
				+ "JOIN cryptoinfo ON account.cryptoNumber = cryptoinfo.cNumber\r\n"
				+ "WHERE user_ref_account.userId = ?";
		
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(CryptoCurrency.class),userId);
	}

	//  9.根據使用者id尋找他現有的資產以及餘額
	@Override
	public List<UserAsset> findAssetsByUserId(Integer userId) {
		String sql="SELECT userId,cryptoinfo.cName,accBalance\r\n"
				+ "From user_ref_account \r\n"
				+ "Join account on user_ref_account.accId=account.accId\r\n"
				+ "Join cryptoinfo on account.cryptoNumber=cryptoinfo.cNumber\r\n"
				+ "where userId=?;\r\n";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(UserAsset.class),userId );		
	}

	

	

	

	
	
	
	
	
	
	
}
