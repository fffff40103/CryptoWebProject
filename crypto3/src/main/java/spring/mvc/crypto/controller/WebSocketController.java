package spring.mvc.crypto.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import spring.mvc.crypto.handler.MyWebSocketHandler;
import spring.mvc.crypto.model.dao.CryptoDao;
import spring.mvc.crypto.model.entity.CryptoCurrency;


/*
 * 用來處理從客戶端傳送過來的請求，
 * */
@Controller
@RequestMapping("/crypto")
public class WebSocketController {
		
		@Autowired()
		MyWebSocketHandler myWebSocketHandler;
	    
		
		
		@RequestMapping("/send")
	    @ResponseBody
	    public String handleWebSocketMessage() {
	        
	     // 主動發送消息到指定目的地
			
	        try {
				myWebSocketHandler.sendPeriodicMessages();
			} catch (IOException e) {
			
				e.printStackTrace();
			}
	      
	        return "ok";
	       
		}
		
		
}