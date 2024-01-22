package spring.mvc.crypto.test;

import java.io.IOException;
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
		
		CryptoServiceImpl2 test= new CryptoServiceImpl2();
		
		try {
			test.crawlerRanking();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}






