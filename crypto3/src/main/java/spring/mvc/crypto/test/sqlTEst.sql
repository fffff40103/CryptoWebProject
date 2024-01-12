SELECT 
    cryptoinfo.cNumber, cryptoinfo.cName, cryptoinfo.price, cryptoinfo.rate, cryptoinfo.cap
FROM user_ref_account
JOIN account ON user_ref_account.accId = account.accId
JOIN cryptoinfo ON account.cryptoNumber = cryptoinfo.cNumber
WHERE user_ref_account.userId = 101;



SELECT userId,cryptoinfo.cName,accBalance
From user_ref_account 
Join account on user_ref_account.accId=account.accId
Join cryptoinfo on account.cryptoNumber=cryptoinfo.cNumber
where userId=101;
