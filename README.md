# 簡易加密貨幣網站
該作品是因想提升自身撰寫程式語言的能力在外上課的一個驗證自己階段性能力的成果，
會持續重構程式碼，讓該作品看起來更易懂以及更簡潔，同時將途中遇到的問題做為未來工作的準備。
# 後端
Java是我在外上課主要編寫的程式語言，也是該作品主要使用的語言，該作品以Spring MVC作為後端的框架，
以MYSQL作為我的DBMS，開發工具則使用Eclipse，並使用Aop橫向切面的技術把業務邏輯以商務邏輯分離，
此外還使用了WebSocket通訊協定幫助我可以在過程中只建立一次連線，以提升開發的效率、節省電腦資源，
在資料庫方面使用了快速、安全的AES加密，並且使用了自定義的錯誤處理來處理全局的錯誤，讓使用這有更好的使用體驗，
根據操作可以分為以下幾個不同的步驟:
* User(使用者相關操作:登入、註冊)
* Market(查詢市場目前最新價格、市值、波動率等等)
* Staking(質押代幣，到期後取回本金+利息)
* Transfer(根據userId轉帳持有代幣)
* Asset(買入或賣出持有的加密貨幣)
* Detail(查看目前所有的操作紀錄)
* Profile(修改個人資料)
# User
此項目為單純的登入、註冊使用者資料
## API
| 說明 | 請求方法 | 路徑 | 參數 |
|-----|-----|-----|-----|
| 登入帳號頁面 | GET | /crypto/register |  |
| 註冊帳號頁面 | GET | /crypto/register |  |
| 註冊帳號 | POST | /crypto/register | username,password |
| 登入帳號 | POST | /crypto/login | username,password |
| 帳號登出 | GET | /crypto/logout |  |
* 參數說明:
  *  註冊帳號:username(String)為使用者的帳號，password(String)會再設定後用AES加密存入資料庫
  *  登入帳號:username(String)為註冊時使用者帳號，password(String)為註冊密碼原碼，輸入後會把它加密跟資料庫加密後密碼比對
# Market
此項目為顯示市場貨幣資訊包含貨幣名稱、貨幣價格、貨幣24小時漲幅、市值
## API
| 說明 | 請求方法 | 路徑 | 參數 |
|-----|-----|-----|-----|
| 市場頁面 | GET | /crypto/market |  |
# Staking
此項目為質押頁面，類似於傳統金融的定存，放著你的貨幣的到期時可以收回你的本金+利率
## API
| 說明 | 請求方法 | 路徑 | 參數 |
|-----|-----|-----|-----|
| 質押頁面 | GET | /crypto/staking|  |
| 市場頁面 | GET | /crypto/market |  |
| 質押設定 | POST | /crypto/staking | days,stakingAmount |
| 質押贖回設定 | POST | /crypto/redeem | |
* 參數說明:
  *  質押設定:days為質押天數(int)，stakingAmount(Float)為質押數量
# Transfer
此項目為貨幣轉帳，會根據使用者ID傳送目前持有的加密貨幣
## API
| 說明 | 請求方法 | 路徑 | 參數 |
|-----|-----|-----|-----|
| 轉帳頁面 | GET | /crypto/transfer|  |
| 轉帳設定 | POST | /crypto/transfer |  |
# Asset
此項目為顯示使用者資產，以及可以買入以買出加密或貨幣
## API
| 說明 | 請求方法 | 路徑 | 參數 |
|-----|-----|-----|-----|
| 使用者資產頁面 | GET | /crypto/asset|  |
| 購買貨幣 | POST | /crypto/buy | cryptoName,cryptoPrice,cryptoAmount |
| 售出貨幣 | POST | /crypto/sell | cryptoName,cryptoPrice,cryptoAmount |
* 參數說明:
  *  購買貨幣、售出貨幣:cryptoName(String)為預交易貨幣名稱，cryptoPrice(Float)為預交易價格，cryptoAmount(Float)為預交易數量
# Detail
此項目為顯示使用者操作紀錄(交易、質押、轉帳)，以及目前使用者盈虧
## API
| 說明 | 請求方法 | 路徑 | 參數 |
|-----|-----|-----|-----|
| 交易紀錄頁面 | GET | /crypto/userDetail|  |
# Profile
此項目為修改使用者資料
## API
| 說明 | 請求方法 | 路徑 | 參數 |
|-----|-----|-----|-----|
| 資料頁面 | GET | /crypto/userProfile| 
| 資料設定 | POST | /crypto/userProfile|username,password,confirmPassword、code |
* 參數說明:
  *  資料設定:username(String)為預設，password(String)為原本密碼，confirmPassword(String)為新密碼，code(String)為驗證碼，會傳送到信箱



