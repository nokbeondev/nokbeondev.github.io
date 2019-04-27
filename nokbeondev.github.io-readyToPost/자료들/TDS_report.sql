
USE PEARL;
USE test1;

DELETE FROM unitdetails_copy; -- 데이터 초기화
DELETE FROM tempRcv; -- 데이터 초기화
DELETE FROM tablename1; -- 테이블 초기화
DELETE FROM RcvCount; -- 데이터 초기화
DELETE FROM tmpRcvVD; -- 데이터 초기화

DECLARE @rowNum INT;
SET @rowNum = 1; -- 반복문용 카운트 숫자
DECLARE @year INT;
DECLARE @month INT;
DECLARE @day INT;
DECLARE @rcvCount INT; -- 카운트된 Rcv수량을 담는 변수

INSERT INTO unitdetails_copy SELECT * FROM PEARL.dbo.MN_UnitDetails; -- PEARL의 MN_UnitDetails 테이블을 unitdetails_copy에 복사

SET @year = YEAR(DATEADD(d, -1, GETDATE())); -- 어제 날짜에서 년도, 월, 날짜 추출
SET @month = MONTH(DATEADD(d, -1, GETDATE()));
SET @day = DAY(DATEADD(d, -1, GETDATE()));

INSERT INTO tempRcv(CreatedDate, CustID) -- 어제 Rcv한 정보 날짜로 추출해서 tempRcv함수에 날짜 넣기
SELECT dCreateDate, iCustomerID
FROM unitdetails_copy
WHERE dCreateDate
BETWEEN DATETIMEFROMPARTS(@year, @month, @day, 0, 0, 0, 0) -- 어제 하루 전체 시간을 범위로 설정 (0시 ~ 23시59분)
AND DATETIMEFROMPARTS(@year, @month, @day, 23, 59, 59, 999);

INSERT INTO tmpRcvVD(CustID)
SELECT CustID
FROM tempRcv
WHERE CustID = 331 -- GPCA Customer Number
OR CustID = 336 -- CVE
OR CustID = 342 -- KW-OH
OR CustID = 343 -- KW-TX
OR CustID = 344 -- KW-IL
OR CustID = 345 -- KW-NJ
OR CustID = 346 -- KW-CA
OR CustID = 347 -- KW-ON
OR CustID = 352 -- XPO-GA
OR CustID = 171; -- VD

DELETE FROM RcvCount; -- 데이터 초기화
INSERT INTO RcvCount SELECT COUNT(*) FROM tmpRcvVD; -- tmpRcvVD에 있는 행의 숫자가 곧 Rcv된 VD의 수량이므로 RcvCount테이블에 수량 넣어준다

SELECT @rcvCount = RcvCount FROM RcvCount; -- Rcv수량 담기

SET @year = DATEPART(YY, GETDATE()); -- INT였던 @YY를
SET @year = CONVERT(NVARCHAR, @year); -- NVARCHAR로 캐스팅
SET @month = DATEPART(MM, GETDATE());
SET @month = CONVERT(NVARCHAR, @month);
SET @day = DATEPART(DD, GETDATE()-1);
SET @day = CONVERT(NVARCHAR, @day);

WHILE @rowNum <= @rcvCount -- 전 날 Rcv된 수량만큼 반복

BEGIN
   INSERT INTO tablename1(number1, SAMEXID)
   VALUES(@rowNum, 'T'
   + RIGHT(@year, 2)
   + RIGHT('00' + @month, 2)
   + RIGHT('00' + CONVERT(NVARCHAR, @day), 2)
   + RIGHT('0000' + CONVERT(NVARCHAR, @rowNum), 4)) -- 순차적으로 증가하는 SAMEXID (문자열)
   SET @rowNum += 1;
END

SELECT * FROM tablename1;