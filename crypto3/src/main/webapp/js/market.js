

   //把WebSocket連線包成一個function
		webSocketConnection();
		
		function webSocketConnection(){
			$(function() {
				$.ajax({
					//利用ajax方式請求資料(在controller也要建立相同網址)
			        url: 'http://localhost:8080/crypto2/mvc/crypto/send',
			        success: function ( data ){
						console.log(data);
			        }
			    });
			});
			
			//連線是用websocket建立，相較於一般http，websocket連線可以只建立一次，不用中斷
			var socket = new WebSocket('ws://localhost:8080/crypto2/mvc/websocket');
			
			//連線建立後的訊息(只發一次)
			socket.onopen = function(event) {
			    console.log('WebSocket連線已建立');
			    console.log(event)
		
			};
			
			//只要伺服器端有新的消息，就會傳給客戶端渲染
			socket.onmessage=function(event){
					//將資料反序列化
				    let message = JSON.parse(event.data);
					let cryptos=message.content;
					console.log(cryptos);
					let allDivs=document.querySelectorAll(".uniquePrice");
					let count=0;
					allDivs.forEach((div)=>{
						
						//得到每個貨幣的名稱、價錢、漲跌幅、市值
						div.querySelector(".name").innerText=cryptos[count].name;
						let name=div.querySelector(".name").innerText=cryptos[count].name;
						div.classList.add(name);
						
						div.querySelector(".price").innerText=cryptos[count].price+"$";
						let price=div.querySelector(".price").innerText=cryptos[count].price+"$";
						
						div.querySelector(".rate").innerText=cryptos[count].rate+"%";
						
						let rate=cryptos[count].rate;
						if(rate<0){
							div.querySelector(".rate").style.color="red";
						}else{
							div.querySelector(".rate").style.color="green";
						}
						
						div.querySelector(".value").innerText=cryptos[count].value;
						let value=div.querySelector(".value").innerText=cryptos[count].value;
						
						count++;
				
					})
				
					
					
			
		   };
		   //連線關閉時會建立的消息(只有一次)
			socket.onclose = function() {
			    console.log('WebSocket連線已關閉');
			};
		}  