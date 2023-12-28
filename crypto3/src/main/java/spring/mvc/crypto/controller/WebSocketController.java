package spring.mvc.crypto.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import spring.mvc.crypto.handler.MyWebSocketHandler;


/*
 * 用來處理從客戶端傳送過來的請求，
 * */
@Controller
@RequestMapping("/crypto")
public class WebSocketController {
		
		@Autowired()
		MyWebSocketHandler myWebSocketHandler;
	    
		
		@RequestMapping("/websocket")
	    @ResponseBody
	    public String handleWebSocketMessage(@RequestParam("message") String message, WebSocketSession session) {
			// 處理WebSocket訊息
	        String response = "WebSocket Message: " + message;
	        
	     // 主動發送消息到指定目的地
	       
	        try {
				myWebSocketHandler.sendPeriodicMessages();
			} catch (IOException e) {
			
				e.printStackTrace();
			}
	        
	        return response;
	       
		}
		
}