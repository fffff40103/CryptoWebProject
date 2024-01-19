package spring.mvc.crypto.handler;

import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.util.HtmlUtils;
import org.springframework.scheduling.annotation.Scheduled;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import spring.mvc.crypto.model.dao.CryptoDao;
import spring.mvc.crypto.model.entity.CompareData;
import spring.mvc.crypto.model.entity.CrawlerCurrency;
import spring.mvc.crypto.model.entity.CryptoCurrency;
import spring.mvc.crypto.service.CryptoService;

@Component("myWebSocketHandler")
public class MyWebSocketHandler extends TextWebSocketHandler {

	enum Prop {

		TYPE("type"), CONTENT("content");

		private String name;

		private Prop(String name) {
			this.name = name;
		}

		public String getName() {
			return name;
		}

	}

	private final Logger logger = LoggerFactory.getLogger(getClass());
	// 這個集合就是在記錄已經跟websocket建立連線的客戶端，用CopyOnWriteArraySet就可以確保每次要修改之前都
	// 會複製一份，只會修改副本，才不會發生異常
	private final Set<WebSocketSession> sessions = new CopyOnWriteArraySet<>();
	private final Gson gson = new Gson();

	@Autowired
	private CryptoDao cryptoDaoMysql;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 當連線建立時傳送的消息
		logger.info("Server connection opened");

		// 把建立的客戶端連線都加到WebSocketSession方便管理
		sessions.add(session);

		// List<CryptoCurrency> myCryptos=cryptoDaoMysql.findLatestCryptos();
		// JsonObject initialMessageObject = getJsonMessage("initial", myCryptos);
		// session.sendMessage(new TextMessage(gson.toJson(initialMessageObject)));
		System.out.println("連線已建立");

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		logger.info("Server connection closed: {}", status);
		sessions.remove(session);
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String request = message.getPayload();
		logger.info("Server received: {}", request);

		JsonObject messageObject = getJsonMessage("response",
				String.format("response from server to '%s'", HtmlUtils.htmlEscape(request)));
		logger.info("Server sends: {}", messageObject);
		session.sendMessage(new TextMessage(gson.toJson(messageObject)));
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		logger.info("Server transport error: {}", exception.getMessage());
	}

	private void sendMessageToClient(WebSocketSession session, String message) throws IOException {
		JsonObject messageObject = getJsonMessage("response", message);
		session.sendMessage(new TextMessage(gson.toJson(messageObject)));
	}

	private void sendMessageToAllClients(String message) throws IOException {
		for (WebSocketSession session : sessions) {
			sendMessageToClient(session, message);
		}
	}

	private JsonObject getJsonMessage(String type, Object content) {
		JsonObject messageObject = new JsonObject();
		messageObject.addProperty(Prop.TYPE.getName(), type);
		messageObject.addProperty(Prop.CONTENT.getName(), content.toString());
		return messageObject;
	}

	/**
	 * 排程程式，從資料庫取出資料，傳送給前端
	 */

	@Scheduled(fixedRate = 6000) // 每10秒從資料庫撈出來最新的10筆資料
	public String sendPeriodicMessages() throws IOException {
		System.out.println("連線個數:" + sessions.size());
		List<CrawlerCurrency> cryptoCurrencies = cryptoDaoMysql.findLatestCryptos();
		List<CryptoCurrency> cryptoRanking = cryptoDaoMysql.findTopFiveRanking();
		List<CompareData> cryptoCompareData=cryptoDaoMysql.findPrecedingLastTenData();
		for (WebSocketSession session : sessions) {
			if (session.isOpen()) {
				/*會傳兩種資料，websocket連線網頁依據條件決定接收哪筆資料*/
				JsonObject compareObject=new JsonObject();
				compareObject.addProperty(Prop.TYPE.getName(),"compare");
				compareObject.add(Prop.CONTENT.getName(), gson.toJsonTree(cryptoCompareData));
				logger.info("Server sends: {}", compareObject);
				session.sendMessage(new TextMessage(gson.toJson(compareObject)));
				
				JsonObject cryptoObject = new JsonObject();
				cryptoObject.addProperty(Prop.TYPE.getName(), "cryptos");
				cryptoObject.add(Prop.CONTENT.getName(), gson.toJsonTree(cryptoCurrencies));
				logger.info("Server sends: {}", cryptoObject);
				session.sendMessage(new TextMessage(gson.toJson(cryptoObject)));
				
				JsonObject rankingObject = new JsonObject();
				rankingObject.addProperty(Prop.TYPE.getName(), "ranking");
				rankingObject.add(Prop.CONTENT.getName(), gson.toJsonTree(cryptoRanking));
				logger.info("Server sends: {}", rankingObject);
				session.sendMessage(new TextMessage(gson.toJson(rankingObject)));
			}
		}
		return "嗨";
	}

}