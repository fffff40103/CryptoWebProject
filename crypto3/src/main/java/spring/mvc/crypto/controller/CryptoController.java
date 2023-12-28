package spring.mvc.crypto.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.crypto.model.dao.CryptoDao;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.model.entity.User;
import spring.mvc.crypto.service.CryptoService;

@Controller
@RequestMapping("/crypto")
public class CryptoController {
	
	//連接CryptoDaoMySQL類別
	@Autowired
	private CryptoDao dao;
	
	@Autowired
	private CryptoService service;
	

	//登入頁面
	@GetMapping("/login")
	public String loginPage(HttpSession session) {
		return "login";
	}
	
	//接收及驗證帳號密碼
	@PostMapping("/login")
	public String login(@RequestParam("username") String username,
						@RequestParam("password") String password,
						HttpSession session,Model model
										) {
		
		Optional<User> userOpt=dao.findUserByUsername(username);
		if(userOpt.isPresent()) {
			User user=userOpt.get();
			System.out.println(user.getPassword());
			//使用加密過的密碼跟使用者輸入的密碼來做驗證，如果一致就放行
			if(user.getPassword().equals(password)) {
				
				session.setAttribute("user", user);
				return "redirect:./userAsset";
			}else {
				//密碼錯誤不放行
				session.invalidate();
				model.addAttribute("message","Password or username doesn't exist");
				return "login";
			}
		}else {
			//帳號不存在，不放行
			session.invalidate();
			model.addAttribute("message","Password or username doesn't exist");
			return "login";
		}	
	}
	
	//登出
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	        session.invalidate();
		return "redirect:./login";
	}
	
	//到註冊頁面
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
				model.addAttribute("message","✔️Register successfully");
				User newUser=new User();
		
			
				newUser.setPassword(password);
				newUser.setUsername(username);
				dao.addUser(newUser);
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
	
	//網站首頁
	@GetMapping("/index")
	public String homePage() {
		return "index";
	}
	
	//交易操作頁面
	@GetMapping("/transaction")
	public String userAsset() {
		return "transaction";
	}
	
	//使用者持有資產頁面
	@GetMapping("/userAsset")
	public String userPage() {
		return "userAsset";
	}
	
	//共同質押頁面
	@GetMapping("/staking")
	public String stakingPage() {
		return "staking";
	}
	
	//市場行情頁面
	@GetMapping("/market")
	public String market() {
		return "market";
	}
	
	//定期去網站爬最新資料，把最新資料更新到資料庫
	@GetMapping("/getCryptoInfo")
    public String getCryptoData(Model model) throws IOException {
		//這樣爬到網站最新資訊
        List<CryptoCurrency> cryptoCurrencies = dao.findAllCryptos();
        model.addAttribute("cryptoCurrencies", cryptoCurrencies);
        return "market";
    }
	
}
