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


3.帳戶(Account)
+-------------+--------------+
|    accId    |  cryptoNumber|
+-------------+--------------+
|    201      |     501      |
|    202      |     502      |               
|    203      |     503      |     
|    204      |     504      |   
|    205      |     505      |  
+-------------+--------------+
4.user_ref_account(使用者關聯帳戶)
+----------+----------+------------+
|  userId  |   accId  | accBalance |
+----------+----------+------------+
|  101     |   201    |  4223.5    |
|  102     |   202    |  5524.5    |
|  103     |   203    |  3348      |
+----------+----------+------------+


5.購買明細(trx_detail)
ps:購買編號、購買帳戶、購買幣種、購買數量、當時購買價格、購買時間
+----------+----------+------------+------------+------------+------------------+
|  trxId   |  userId   |  cNumber   |  quantity  |    price   |   purchaseTime  |  
+----------+-----------+------------+------------+------------+-----------------+
|   301    |    101    |    501     |     10     |    41000   |  		        |
|   302    |    102    |    502     |     8      |    40100   |                 | 
|   303    |    103    |    503     |     5      |	  25.12   |                 |
|   304    |    104    |    502     |     8      |	  33.2    |                 |
|   305    |    105    |    504     |     20     |	  100     |                 |
|   306    |    106    |    505     |     15     |	  96      |                 |
+--------+----------+---------------+------------+------------+-----------------+

6.轉帳交易資訊(trx_transfer)
----------建立trx_transfer
+--------+------------+---------+----------+--------+-----------+
|  trsId |   cNumber  |  price  |  userFrom|  userTo|  trxTime  |  
+--------+------------+---------+----------+--------+-----------+
|	401  |     502    |  2330.1 |    101   |   102  |           |
|	402  |	   503    |  242.5  |    103   |   101  |           |
|   403  |	   501    |  42000  |    104   |   05   |           |
+--------+------------+---------+----------+--------+-----------+



7.爬蟲資料(crawlerData)
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
drop table if exists staking_detail;
drop table if exists crawlerData;
drop table if exists compareData;
drop table if exists user_ref_account;
drop table if exists user;
drop table if exists account;
drop table if exists cryptoInfo;
drop table if exists status_detail;



create table if not exists cryptoinfo(
	cNumber int auto_increment primary key,
	cName varchar(50) not null,
	price float not null,
	rate float not null,
	cap varchar(50) not null
);

alter table cryptoinfo auto_increment = 501;

create table if not exists user(
    userId int auto_increment primary key ,
    userName varchar(50) not null,
    password varchar(250) not null
   
);

alter table user auto_increment = 101;


create table if not exists account(
	accId int auto_increment primary key,
	cryptoNumber int not null,
	foreign key(cryptoNumber) references cryptoinfo(cNumber)

);

alter table account auto_increment = 201;

create table if not exists user_ref_account(
    userId INT,
    accId INT,
    accBalance float not null,
    PRIMARY KEY (userId, accId),
    FOREIGN KEY (userId) REFERENCES user(userId),
    FOREIGN KEY (accId) REFERENCES account(accId)
);


create table if not exists status_detail(
	statusId int primary key,
    statusFor varchar(50) not null
);

create table if not exists trx_detail(
	trxId int auto_increment primary key,
	userId int not null,
	cNumber int not null,
	quantity int not null,
	price float not null,
    statusId int not null,
	purchaseTime datetime default current_timestamp,
	foreign key(userId) references user(userId),
	foreign key(cNumber) references cryptoinfo(cNumber),
    foreign key(statusId) references status_detail(statusId)
   
);
alter table trx_detail auto_increment = 301;

create table if not exists trx_transfer(
	trsId int auto_increment primary key,
	cNumber int  not null,
    quantity int not null,
	price float not null,
	userFrom int not null,
	userTo  int not null,
    
	transferTime datetime default current_timestamp,
	foreign key(cNumber) references cryptoinfo(cNumber),
	foreign key(userFrom) references user(userId),
	foreign key(userTo) references user(userId)
   
);

alter table trx_transfer auto_increment = 401;

create table if not exists staking_detail(
	stakingId int primary key auto_increment,
    userId int not null,
    quantity FLOAT not null,
    stakingApr Float not null,
	stakingDays int not null,
    stakingTime timestamp not null,
    redeemTime timestamp not null,
    isRedeem int not null,
    
    foreign key(userId) references user(userid)
);
alter table staking_detail auto_increment = 601;

create table if not exists crawlerData(
	pNumber int auto_increment primary key,
	pName varchar(50) not null,
	pPrice float not null,
	pRate float not null,
	pCap varchar(50) not null

);

create table if not exists compareData(
	compareNumber int auto_increment primary key,
	compareName varchar(50) not null,
	comparePrice float not null,
	compareRate float not null,
	compareCap varchar(50) not null

);




insert into user(userName,password)
values("abc123","JqKLj+4Aw3DnndH0MHUQkg==");


insert into cryptoinfo(cName,price,rate,cap)
values("BTC",42325.2,2.6,"805.67b"),
("ETH",2270.72,2.64,"294.95b"),
("USDT",1.0006,0.07,"94.98b"),
("BNB",305,0.1,"64.25b"),
("SOL",72.765,-8.16,"40.10b"),
("BTC",42325.2,2.6,"42b"),
("BTC",42325.2,2.6,"42b"),
("BTC",42325.2,2.6,"42b"),
("BTC",42325.2,2.6,"42b"),
("BTC",42325.2,2.6,"42b");


insert into account (cryptoNumber)
values(501),
(502),(503),(504),(505),(506),(507),(508),(509),(510);

INSERT INTO user_ref_account(userId,accId,accBalance)
values(101,201,10),
(101,202,0),
(101,203,10000),
(101,204,0),
(101,205,0),
(101,206,0),
(101,207,0),
(101,208,0),
(101,209,0),
(101,210,0);

insert into status_detail(statusId,statusFor)
values(1,"Buy"),
(2,"Sell"),
(3,"Transfer"),
(4,"Receive");

INSERT INTO staking_detail(userId,quantity,stakingApr,stakingDays,stakingTime,redeemTime,isRedeem)
values(101,1,5,1,"2024-01-27 03:25:02","2024-01-27 04:25:02",1),
(101,1,5,1,"2024-01-27 03:25:02","2024-01-27 04:25:02",0),
(101,3,5,1,"2024-01-27 03:25:02","2024-01-27 04:25:02",0);


