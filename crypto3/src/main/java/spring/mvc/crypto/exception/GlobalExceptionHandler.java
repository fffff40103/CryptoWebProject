package spring.mvc.crypto.exception;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import spring.mvc.crypto.model.dao.CryptoDao;
import spring.mvc.crypto.model.entity.StakingDetail;
import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.model.entity.UserAsset;

@ControllerAdvice
public class GlobalExceptionHandler {

	// 連接CryptoDaoMySQL類別
	@Autowired
	private CryptoDao dao;

	// 設定如果沒有值的話就會回傳錯以及需要的資訊
	@ExceptionHandler(NullPointerException.class)
	public String handleNullPointerException(Model model, HttpSession session, Exception ex) {
		// 先得到當前用戶
		User currentUser = (User) session.getAttribute("user");
		// 得到用戶質押未贖回的以太幣數量
		List<StakingDetail> stakingDetails = dao.findNoneRedeemStakingDetailByUserId(currentUser.getUserId());
		double totalStakingAmount = stakingDetails.stream()
				.mapToDouble(stakingDetail -> stakingDetail.getQuantity().doubleValue()).sum();
		model.addAttribute("totalStakingAmount", totalStakingAmount);
		// 得到當前所有用戶總質押人數
		List<StakingDetail> totalStakingDetails = dao.findAllNoneRedeemStakingDetail();
		Float totalStakingNumber = 0f;
		for (int i = 0; i < totalStakingDetails.size(); i++) {
			totalStakingNumber += totalStakingDetails.get(i).getQuantity();
		}
		model.addAttribute("totalStakingNumber", totalStakingNumber);
		// 透過當前用戶尋找當前Eth資產
		List<UserAsset> userAssets = dao.findAssetsByUserId(currentUser.getUserId());
		Optional<UserAsset> ethOpt = userAssets.stream().filter(userAsset -> userAsset.getcName().equals("ETH"))
				.findAny();
		// 將資產回傳給staking頁面
		if (ethOpt.isPresent()) {
			UserAsset ethAsset = ethOpt.get();
			Float ethBalance = ethAsset.getAccBalance();
			model.addAttribute("ethBalance", ethBalance);

		}
		model.addAttribute("ErrorMessage", "Value required");

		return "staking";

	}

}
