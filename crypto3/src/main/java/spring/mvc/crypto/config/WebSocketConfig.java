<<<<<<< HEAD
package spring.mvc.crypto.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;



import spring.mvc.crypto.handler.MyWebSocketHandler;

@Configuration//一個spring的配置項
@EnableWebSocket//標註讓websocket支持
@EnableScheduling
//這是註冊websocket處理器的地方
public class WebSocketConfig implements WebSocketConfigurer {
	
	
	@Autowired
	private MyWebSocketHandler myWebSocketHandler;
	
	@Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        //這段程式碼表示webSocket連接的端點為/websocket
		//myWebSocketHandler規定了所有連接過來的端點處理的方法
		//setAllowedOrigins("*")允許所有來源連接至此websocket
		registry.addHandler(myWebSocketHandler, "/websocket").setAllowedOrigins("*");
    }
}
=======
package spring.mvc.crypto.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;



import spring.mvc.crypto.handler.MyWebSocketHandler;

@Configuration//一個spring的配置項
@EnableWebSocket//標註讓websocket支持
@EnableScheduling
//這是註冊websocket處理器的地方
public class WebSocketConfig implements WebSocketConfigurer {
	
	
	@Autowired
	private MyWebSocketHandler myWebSocketHandler;
	
	@Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        //這段程式碼表示webSocket連接的端點為/websocket
		//myWebSocketHandler規定了所有連接過來的端點處理的方法
		//setAllowedOrigins("*")允許所有來源連接至此websocket
		registry.addHandler(myWebSocketHandler, "/websocket").setAllowedOrigins("*");
    }
}
>>>>>>> branch 'master' of https://github.com/fffff40103/CryptoWebProject.git
