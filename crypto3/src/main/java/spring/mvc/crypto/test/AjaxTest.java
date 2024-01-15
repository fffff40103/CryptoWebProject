package spring.mvc.crypto.test;

public class AjaxTest {
	/**
	 //動態設定表單裡面的按鈕案買入案件就變成確認買入
    let formTag=document.querySelector(".confirmForm");
	
    // 将值填充到模态框中
    document.getElementById("purchaseInfo").innerHTML = "The cryptoName: " + nameCrypto;
    document.getElementById("purchaseInfo2").innerHTML = "The price: " + priceCrypto;
    //test***************************************************
    //動態設定隱藏表單的value
    let nameInput=formTag.querySelector(".modalNameInput");
    nameInput.value=nameCrypto
    
    //動態設定隱藏表單的value
    let priceInput=formTag.querySelector(".modalPriceInput");
    priceInput.value=priceCrypto;
    
   	
    formTag.addEventListener("submit", function (event) {
        //*********************************************************
        //發起ajax請求
        // 显示模态框
        
      //動態拿到amount
        let amountInput=formTag.querySelector(".modalAmountInput");
        amountInput=amountInput.value;
        
        
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "./buy", true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
     	// 构建需要发送的数据
        let data = {
            // 你的购买数据
            "cryptoName": nameCrypto,
            "cryptoPrice":priceCrypto,
            "cryptoAmount":amountInput
        };
        console.log(data);
     	// 将数据转为 JSON 字符串
        let jsonData = JSON.stringify(data);
        xhr.send(jsonData);
     	//*********************************************************

      
    });
    
    $('#myModal').modal('show');


    

    
    
    //動態設定按鈕(買入、賣出)
   	let modalFooter=document.querySelector(".modal-footer")
   	let modalButtontrans=modalFooter.querySelector(".modalButtontrans")
   	modalButtontrans.innerHTML="買入";
    

 	
   	//把彈跳框取消
   	let modalCancel=document.querySelector(".modalCancelButton");
   	modalCancel.addEventListener("click",function(event){
   		event.preventDefault();
   		$('#myModal').modal('hide');
   		
   	});
   	**/
}
