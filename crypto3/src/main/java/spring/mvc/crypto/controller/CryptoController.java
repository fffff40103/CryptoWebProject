package spring.mvc.crypto.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.crypto.model.dao.CryptoDao;
import spring.mvc.crypto.model.entity.Account;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.StatusDetail;
import spring.mvc.crypto.model.entity.TransactionDetail;
import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.model.entity.UserAsset;
import spring.mvc.crypto.service.CryptoService;
import spring.mvc.crypto.service.SendingEmailService;

@Controller
@RequestMapping("/crypto")
public class CryptoController {

	// 連接CryptoDaoMySQL類別
	@Autowired
	private CryptoDao dao;
	
	
	@Autowired
	private  SendingEmailService emailService;
	
	@GetMapping("/getcode")
	private void getCodeImage(HttpSession session, HttpServletResponse response) throws IOException {
		// 產生一個驗證碼 code
		Random random = new Random();
		String code1 = String.format("%c", (char)(random.nextInt(122-65+1) + 65));
		String code2 = String.format("%c", (char)(random.nextInt(122-65+1) + 65));
		String code3 = String.format("%c", (char)(random.nextInt(122-65+1) + 65));
		String code4 = String.format("%c", (char)(random.nextInt(122-65+1) + 65));
		
		String code  = code1+code2+code3+code4;
		session.setAttribute("code", code);
		
		// Java 2D 產生圖檔
		// 1. 建立圖像暫存區
		BufferedImage img = new BufferedImage(80, 30, BufferedImage.TYPE_INT_BGR);
		// 2. 建立畫布
		Graphics g = img.getGraphics();
		// 3. 設定顏色
		g.setColor(Color.YELLOW);
		// 4. 塗滿背景
		g.fillRect(0, 0, 80, 30);
		// 5. 設定顏色
		g.setColor(Color.BLACK);
		// 6. 設定自型
		g.setFont(new Font("新細明體", Font.PLAIN, 30));
		// 7. 繪字串
		g.drawString(code, 10, 23); // code, x, y
		// 8. 干擾線
		g.setColor(Color.RED);
		for(int i=0;i<5;i++) {
			int x1 = random.nextInt(80);
			int y1 = random.nextInt(30);
			int x2 = random.nextInt(80);
			int y2 = random.nextInt(30);
			g.drawLine(x1, y1, x2, y2);
		}
		
		// 設定回應類型
		response.setContentType("image/png");
		
		// 將影像串流回寫給 client
		ImageIO.write(img, "PNG", response.getOutputStream());
	}
	
	
	// 登入頁面
	@GetMapping("/login")
	public String loginPage(HttpSession session) {
		return "login";
	}

	// 接收及驗證帳號密碼
	@PostMapping("/login")

	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("code") String code,
			HttpSession session, Model model) {
		//先看驗證碼對或錯，如果錯就不放行，如果隊就放行
		
		//先查找有無該位使用者，如果沒有就不放行
		Optional<User> userOpt = dao.findUserByUsername(username);
		if (userOpt.isPresent()) {
			//得到此user
			User user = userOpt.get();
			
			// 使用加密過的密碼跟使用者輸入的密碼來做驗證，如果一致就放行
			if (user.getPassword().equals(password)) {
				//把user資料加入session方便做驗證
				session.setAttribute("user", user);
				//登入成功後查找user的資產，並且傳給前端渲染
				List<UserAsset> userAssets=dao.findAssetsByUserId(user.getUserId());
				model.addAttribute("userAssets", userAssets);
				return "userAsset";
			} else {
				// 密碼錯誤不放行
				session.invalidate();
				model.addAttribute("message", "Password or username doesn't exist");
				return "login";
			}
		} else {
			// 帳號不存在，不放行
			session.invalidate();
			model.addAttribute("message", "Password or username doesn't exist");
			return "login";
		}
	}

	
	// 登出
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:./login";
	}

	// 到註冊頁面
	@GetMapping("/register")
	public String registerPage() {

		return "register";
	}

	    //收到註冊資料
		@PostMapping("/register")
		public String register(@RequestParam("username") String username,
							   @RequestParam("password") String password,
							   @RequestParam("password2")String password2,
							   Model model
													) {
			List<User> users=dao.findAllUsers();
			Optional<User>userOpt=users.stream().filter(oneUser->oneUser.getUsername().equals(username)).findAny();
			if(userOpt.isPresent()){
				//帳號已被註冊
				model.addAttribute("message","❌username already taken");
			}else {
				//註冊成功!重導到login頁面
				if(password.equals(password2)) {
					if(!username.endsWith("@gmail.com")) {
						model.addAttribute("message","Please enter valid email");
						return "register";
					}
					emailService.sendIngEmail(username);
					model.addAttribute("message","✔️Register successfully");
					User newUser=new User();
					newUser.setPassword(password);
					newUser.setUsername(username);
					//生成新使用者後會自動得到該使用者的id
					Integer userId=(Integer)dao.addUser(newUser);
					//幫使用者開設每個幣的帳戶，並且給他入金1000Usdt
					dao.addAssetsByNewUserId(userId);
					try {
						Thread.sleep(5000);
						return "register";
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}else {
					//帳號密碼不一致
					model.addAttribute("message", "❌The passwords you enter don't match");
					return "register";
				}
			}
			return "register";
		}

	// 網站首頁
	@GetMapping("/index")
	public String homePage() {
		return "index";
	}

	// 交易操作頁面
	@GetMapping("/transaction")
	public String userAsset() {
		return "transaction";
	}

	// 使用者持有資產頁面
	@GetMapping("/userAsset")
	public String userPage() {
		return "userAsset";
	}

	// 共同質押頁面
	@GetMapping("/staking")
	public String stakingPage() {
		return "staking";
	}

	// 市場行情頁面
	@GetMapping("/market")
	public String market() {
		return "market";
	}
	
	@GetMapping("/userProfile")
	public String userProfile(Model model,HttpSession session) {
		User currentUser=(User)session.getAttribute("user");
		model.addAttribute("userName",currentUser.getUsername());
		return "userProfile";
	}
	
	// 交易明細頁面
	@GetMapping("/userDetail")
	public String userDetail(Model model,HttpSession session) {
		//得到User
		User currentUser=(User)session.getAttribute("user");
		List<TransactionDetail> details=dao.findDetailByUserId(currentUser.getUserId());
		model.addAttribute("details",details);
		return "userDetail";
	}
	
	@Transactional
	@PostMapping("/buy")
	public String buyCrypto(@RequestParam("cryptoName") String name,
			@RequestParam("cryptoPrice") String stringPrice, 
			@RequestParam("cryptoAmount") Float amount,
			HttpSession session, Model model) {
		//處理價格型態
		String noDollarString=stringPrice.substring(1,stringPrice.length()-1);
		if(!noDollarString.contains(".")) {
			noDollarString+=".00";
		}
		//處理價格，把她從String變成Float
		Float floatPrice=Float.parseFloat(noDollarString); 
		// 得到該使用者的session
		User currentUser = (User) session.getAttribute("user");
		// 檢查該加密貨幣是否有提供交易
		Optional<CryptoCurrency> mycrypto = dao.findCryptoByCryptoName(name);
		if (mycrypto.isEmpty()) {
			
			model.addAttribute("resultMessage", "This crypto is currently not  provided transaction");
			return "userAsset";
		}
		// 檢查有無足夠usdt可以購買加密貨幣，如果夠的話就扣款回傳購買成功，不夠的話就回傳餘額不足
		List<UserAsset> userAssets = dao.findAssetsByUserId(currentUser.getUserId());		
		Float usdt = userAssets.stream().filter(userAsset -> userAsset.getcName().equals("USDT"))
				.map(UserAsset::getAccBalance).findFirst().orElse(0.0f);	
		//算出使用者購買貨幣的總價
		Float totalAmount=floatPrice*amount;
		//如果餘額不足就顯示購買失敗
		if (usdt <= totalAmount) {
			model.addAttribute("userAssets", userAssets);
			model.addAttribute("resultMessage","餘額不足，購買失敗");
			return "userAsset";
		}
		//扣除購買貨幣價格剩下的貨幣
		usdt=usdt-totalAmount;
		//先找到該貨幣對應帳戶
		Account account=dao.findAccountByCryptoName(name);
		//得到該使用者美金(usdt)帳戶
		Account usdtAccount=dao.findAccountByCryptoName("USDT");
		//購買貨幣
		dao.buyCrypto(amount,currentUser.getUserId() ,account.getAccId());
		//扣款購買金額後的帳戶
		dao.deductUSDT(usdt,currentUser.getUserId() ,usdtAccount.getAccId());
		//加入購買明細
		TransactionDetail detail=new TransactionDetail();
		detail.setUserId(currentUser.getUserId());
		detail.setcNumber(account.getCryptoNumber());
		detail.setQuantity(amount);
		detail.setPrice(floatPrice);
		detail.setStatusId(1);
		
		dao.addTransactionDetail(detail);
		//購買貨幣以及扣款後更新資訊
		userAssets=dao.findAssetsByUserId(currentUser.getUserId());
		//購買成功!
		model.addAttribute("userAssets", userAssets);
		model.addAttribute("resultMessage","購買成功!");
		return "userAsset";
	}
    
	// 在userAsset頁面按賣出按鈕

	@PostMapping("/sell")

	public String sellCrypto(@RequestParam("cryptoName") String name,
			@RequestParam("cryptoPrice") String stringPrice, 
			@RequestParam("cryptoAmount") Float amount,
			Model model,HttpSession session) {
		        //處理價格型態
				String noDollarString=stringPrice.substring(1,stringPrice.length()-1);
				if(!noDollarString.contains(".")) {
					noDollarString+=".00";
				}
				//處理價格，把她從String變成Float
				Float floatPrice=Float.parseFloat(noDollarString); 
				// 得到該使用者的session
				User currentUser = (User) session.getAttribute("user");
				// 檢查該加密貨幣是否有提供交易
				Optional<CryptoCurrency> mycrypto = dao.findCryptoByCryptoName(name);
				if (mycrypto.isEmpty()) {
					
					model.addAttribute("resultMessage", "This crypto is currently not  provided transaction");
					return "userAsset";
				}
				// 檢查有無足夠的特定貨幣可以售出，如果夠的話就扣款回傳購買成功，不夠的話就回傳餘額不足
				List<UserAsset> userAssets = dao.findAssetsByUserId(currentUser.getUserId());		
				Float usdt = userAssets.stream().filter(userAsset -> userAsset.getcName().equals("USDT"))
						.map(UserAsset::getAccBalance).findFirst().orElse(0.0f);	
				//特定的帳戶餘額
				Float sellCrypto = userAssets.stream().filter(userAsset -> userAsset.getcName().equals(name))
						.map(UserAsset::getAccBalance).findFirst().orElse(0.0f);	
				//如果餘額不足就顯示購買失敗
				if (sellCrypto < amount) {
					model.addAttribute("userAssets", userAssets);
					model.addAttribute("resultMessage","餘額不足，售出失敗");
					return "userAsset";
				}
				//扣除購買貨幣價格剩下的貨幣
				Float sellCryptoAmount=sellCrypto-amount;			
				Account sellCryptoAccount=dao.findAccountByCryptoName(name);
				dao.sellCrypto(sellCryptoAmount,currentUser.getUserId(),sellCryptoAccount.getAccId());
				//轉換回去的usdt
				Account usdtAccount=dao.findAccountByCryptoName("USDT");
				Float totalUsdt=(amount*floatPrice)+usdt;
				dao.addUSDT(totalUsdt, currentUser.getUserId(),usdtAccount.getAccId());
				//加入購買明細
				TransactionDetail detail=new TransactionDetail();
				detail.setUserId(currentUser.getUserId());
				detail.setcNumber(sellCryptoAccount.getCryptoNumber());
				detail.setQuantity(amount);
				detail.setPrice(floatPrice);
				detail.setStatusId(2);	
				//更新資料
				dao.addTransactionDetail(detail);
				userAssets=dao.findAssetsByUserId(currentUser.getUserId());
				//購買成功!
				model.addAttribute("userAssets", userAssets);
				model.addAttribute("resultMessage","售出成功!");
				return "userAsset";
	}

	

}