/**
 * 
 */

 
 console.log(document.querySelector(".hour"));
	console.log(document.querySelector(".minute"));
	console.log(document.querySelector(".second"));
	//算出時間差
	function getTimeDifference(targetTime) {
		let now = new Date();
		let timeDifference = Math.abs(targetTime - now);
		return timeDifference;

	}

	function updateTime() {
		//設定目標天數
		let targetDate = new Date('04/19/2024 17:34:50');

		//取得現在與目標天數的天數差換成毫秒
		let timeDifference = getTimeDifference(targetDate);

		//得到毫秒後除1000=秒，再除60=分鐘，再除60=小時，再除24=一天
		let days = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
		document.querySelector(".day").innerHTML = days + "<span>D</span>";

		//拿到上面天數的餘數，然後除1000=秒，再除60=分鐘，再除60=小時
		let hours = Math.floor((timeDifference % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60))

		document.querySelector(".hour").innerHTML = hours + "<span>H</span>";

		//拿到上面天數的餘數，然後除1000=秒，再除60=分鐘
		let minutes = Math.floor((timeDifference % (1000 * 60 * 60))
				/ (1000 * 60));
		document.querySelector(".minute").innerHTML = minutes
				+ "<span>M</span>";

		//拿到上面天數的餘數，然後除1000=秒
		let seconds = Math.floor((timeDifference % (1000 * 60)) / (1000));
		document.querySelector(".second").innerHTML = seconds
				+ "<span>S</span>";
	}
	let timeInterval = setInterval(updateTime, 1000);