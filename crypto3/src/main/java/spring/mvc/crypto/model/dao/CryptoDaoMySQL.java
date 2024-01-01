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

import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.User;

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
	public List<CryptoCurrency> findLatestCryptos() {
		String sql="SELECT *\r\n"
				+ "FROM (\r\n"
				+ "    SELECT *\r\n"
				+ "    FROM cryptoInfo\r\n"
				+ "    ORDER BY cryptoId DESC\r\n"
				+ "    LIMIT 10\r\n"
				+ ") AS subquery\r\n"
				+ "ORDER BY cryptoId ASC\r\n"
				+ "LIMIT 10";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(CryptoCurrency.class));
	}
	
    //  2.新增貨幣
	@Override
	public void addCrypto(CryptoCurrency crypto) {
		String sql="insert into cryptoInfo(name,price,value,rate) values(?,?,?,?)";
		jdbcTemplate.update(sql,crypto.getName(),crypto.getPrice(),crypto.getValue(),crypto.getRate());
		
	}
	
    //  3.根據貨幣編號尋找該貨幣
	@Override
	public Optional<CryptoCurrency> findCryptoByCryptoId(Integer cryptoId) {
		String sql="select cryptoId,name,price,value,rate from cryptoInfo where cryptoId=?";
		try {
			CryptoCurrency crypto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(CryptoCurrency.class), cryptoId);
			return Optional.ofNullable(crypto);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
	// 4.更新所有貨幣的資訊
	@Override
	public int[] insertCryptos(List<CryptoCurrency> cryptos) {
		String sql="insert into cryptoinfo(name,price,value,rate) values(?,?,?,?)";
		return this.jdbcTemplate.batchUpdate(
				sql,
				new BatchPreparedStatementSetter() {

					public void setValues(PreparedStatement ps, int i) throws SQLException {
						ps.setString(1, cryptos.get(i).getName());
						ps.setFloat(2, cryptos.get(i).getPrice());					
						ps.setString(3,cryptos.get(i).getValue());
						ps.setFloat(4,cryptos.get(i).getRate() );
					}

					public int getBatchSize() {
						return cryptos.size();
					}

				});
	}
	
	
}
