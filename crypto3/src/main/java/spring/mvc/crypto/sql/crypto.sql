/*


1. 單獨貨幣資訊(cryptoInfo)
+------------+----------+----------+-----------+--------------------+
| cNumber    |  cName   |	price  |   cRate   |       cap          |
+------------+----------+----------+-----------+--------------------+
|    501     |   BTC    |  42000.2 |    2.72   |  $850.39B,991,320$ |
|    502     |   ETH    |  2300    |    8.76   |  $289.65B,728,802$ |
|    503     |   BNB    |  322.6   |    0.08   |  $49.05B,586,955$  |   
|    504     |   XRP    |  25.11   |    12.06  |  $44.28B,003,746$  |
|    505     |   USDT   |  30.52   |    3.5    |  $34.65B,555,290$  |
|    506     |   SOL    |  110.68  |    0.85   |  $44.28B,003,746$  |
+------------+----------+----------+-----------+--------------------+


2. 使用者
+------=--+----------+----------+
|  userId | userName | password |      
+---------+----------+----------+
|   101   | user123  | pass123  |       
|   102   | user456  | pass456  |  
|   103   | user789  | pass789  |      
+---------+----------+----------+

3. 帳戶(Account)
ps:帳戶id、帳戶使用者、帳戶資產、帳戶建造時間
+-------------+----------+------------------+
|     accId   |  userId  |   createionTime  |
+-------------+----------+------------------+
|    201      |   101    |                  |     
|    202      |   102    |                  |    
|    203      |   103    |                  |        
|    204      |   104    |                  |         
|    205      |   105    |                  |       
+-------------+----------+------------------+

4.購買明細(trx_detail)
ps:購買編號、購買帳戶、購買幣種、購買數量、當時購買價格、購買時間
+----------+----------+-----------+------------+------------+-----------------+
|  trxId   |  accId   |  cNumber  |  quantity  |    price   |   purchaseTime  |  
+----------+----------+-----------+------------+------------+-----------------+
|   301    |   201    |    501    |     10     |    41000   |  		          |
|   302    |   201    |    502    |     8      |    40100   |                 | 
|   303    |   202    |    503    |     5      |	25.12   |                 |
|   304    |   203    |    502    |     8      |	33.2    |                 |
|   305    |   203    |    504    |     20     |	100     |                 |
|   306    |   205    |    505    |     15     |	96      |                 |
+--------+----------+-----------+--------------+------------|-----------------|



5.轉帳交易資訊(trx_transfer)
----------建立trx_transfer
+--------+---------+---------+----------+--------+-----------+
|  trsId |   cNumber  |  price  |  accFrom |  accTo |  trxTime  |  
+--------+------------+---------+----------+--------+-----------+
|	401  |     502    |  2330.1 |    201   |   202  |           |
|	402  |	   503    |  242.5  |    201   |   203  |           |
|   403  |	   501    |  42000  |    202   |   201  |           |
+--------+------------+---------+----------+--------+-----------+

6.爬蟲資料(crawlerData)
----------建立crawlerData
+------------+------------+------------+----------+--------------------+
|   pNumber  |    pName   |	pPrice   |   pRate    |       pCap         |
+------------+------------+----------+------------+--------------------+
|      1     |     BTC    |  42000.2 |    2.72    |  $850.39B,991,320$ |
|      2     |     ETH    |  2300    |    8.76    |  $289.65B,728,802$ |
|      3     |     BNB    |  322.6   |    0.08    |  $49.05B,586,955$  |   
|      4     |     XRP    |  25.11   |    12.06   |  $44.28B,003,746$  |
|      5     |     USDT   |  30.52   |    3.5     |  $34.65B,555,290$  |
|      6     |     SOL    |  110.68  |    0.85    |  $44.28B,003,746$  |
+------------+------------+----------+------------+--------------------+



資料庫的建立: CREATE SCHEMA `crypto` DEFAULT CHARACTER SET utf8mb4 ;

 * */
-- 授權資料表
drop table if exists trx_detail;
drop table if exists trx_transfer;
drop table if exists account;
drop table if exists user;
drop table if exists cryptoInfo;
drop table if exists crawlerData;




create table if not exists user(
    userId int auto_increment primary key ,
    userName varchar(50) not null,
    password varchar(250) not null
   
);

alter table user auto_increment = 101;


create table if not exists account(
	accId int auto_increment primary key,
	userId int not null,
	createionTime datetime default current_timestamp,
	foreign key(userId) references user(userId)

);

alter table account auto_increment = 201;


create table if not exists cryptoinfo(
	cNumber int auto_increment primary key,
	cName varchar(50) not null,
	price float not null,
	rate float not null,
	cap varchar(50) not null
);

alter table cryptoinfo auto_increment = 501;



create table if not exists trx_detail(
	trxId int auto_increment primary key,
	accId int not null,
	cNumber int not null,
	quantity int not null,
	price float not null,
	purchaseTime datetime default current_timestamp,
	foreign key(accId) references account(accId),
	foreign key(cNumber) references cryptoinfo(cNumber)
);
alter table trx_detail auto_increment = 301;



create table if not exists trx_transfer(
	trsId int auto_increment primary key,
	cNumber int  not null,
	price float not null,
	accFrom int not null,
	accTo  int not null,
	trxTime datetime default current_timestamp,
	foreign key(cNumber) references cryptoinfo(cNumber),
	foreign key(accFrom) references account(accId),
	foreign key(accTo) references account(accId)
);
alter table trx_transfer auto_increment = 401;

create table if not exists crawlerData(
	pNumber int auto_increment primary key,
	pName varchar(50) not null,
	pPrice float not null,
	pRate float not null,
	pCap varchar(50) not null

)
