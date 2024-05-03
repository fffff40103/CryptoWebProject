<<<<<<< HEAD
package spring.mvc.crypto.test;


import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import spring.mvc.crypto.model.entity.CompareData;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.service.CryptoService;
import spring.mvc.crypto.service.CryptoServiceImpl2;
import spring.mvc.crypto.service.CryptoServiceImpl3;

public class crawlerTest {
	

	
	public static void main(String[] args) throws IOException {
		//String api_key="ce3d7453caab5e81ca09e980616a71cdb42b857b37d91296a798d4dad70d3eff";
		CryptoService cryptoService=new CryptoServiceImpl3();
		List<CryptoCurrency> crawlerCurrencies= cryptoService.crawlerRanking();
		for(CryptoCurrency currency:crawlerCurrencies) {
			System.out.println(currency);
		}
		
		

	}
	
}



=======
package spring.mvc.crypto.test;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.service.CryptoServiceImpl2;

/**
KeyHolder keyHolder = new GeneratedKeyHolder();

int affectedRows = jdbcTemplate.update(connection -> {
    PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    ps.setInt(1, tran.getTranNo());
    ps.setString(2, tran.getDepartureStation());
    ps.setString(3, tran.getArrivalStation());
    ps.setString(4, tran.getDate());
    ps.setString(5, tran.getDepartureTime());
    ps.setString(6, tran.getArrivalTime());
    return ps;
}, keyHolder);

if (keyHolder.getKey() != null) {
	 tran.setTranId(keyHolder.getKey().intValue());
}

return affectedRows;
**/

public class crawlerTest {
	public static void main(String[] args) {
		

		Timestamp now = new Timestamp(System.currentTimeMillis());
		System.out.println(now);
		
	}
	
}






>>>>>>> branch 'master' of https://github.com/fffff40103/CryptoWebProject.git
