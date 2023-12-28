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
	
	
	
	@Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(new MyWebSocketHandler(), "/websocket").setAllowedOrigins("*");
    }
}
