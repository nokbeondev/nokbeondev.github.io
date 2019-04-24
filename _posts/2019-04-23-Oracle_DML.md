---
layout: post
title: "[Oracle] DML"
comments: true
categories: Oracle
---

### 1. 종류
- CREATE
- INSERT
- UPDATE
- DELETE

### 2. 예제를 통해 CREATE 이해하기

- 선언하기

```sql
CREATE TABLE copy_t1
AS SELECT * FROM t1;
```

- 테이블/컬럼 복사하기1
	- 새로 만들 테이블 명 : copy_t4
	- 복사할 컬럼 : t4 테이블의 copy_t4
    
```sql
DESC copy_t1; -- copy_t1 테이블의 내용 확인
SELECT * FROM t1;
SELECT * FROM copy_t1;

-- 아래 부분 부터 복사관련 코드
CREATE TABLE copy_t4
AS SELECT t4b FROM t4;
SELECT * FROM t4;
```

- 테이블/컬럼 복사하기2

```sql
-- copy_t41에는 t4a컬럼만 복사되어 저장된다. 그리고 컬럼 별칭을 a로 설정
CREATE TABLE copy_t41
AS SELECT t4a a FROM t4; 
```


- 테이블 구조 복사하기 예제

```sql
/*
테이블 t4의 총 행 수는 2건이다.
이 테이블의 구조만 복사하여 copy_t42테이블에 붙여넣기 하시오.
(copy_t42 테이블의 행 수는 0)
*/

CREATE TABLE copy_t42
AS SELECT * FROM t4 WHERE 1 > 2; -- 일부러 비교 대상의 결과가 false인 경우를 WHERE절에 넣어서 구조만 가져오게 한다.
SELECT * FROM copy_t42;
```


### 3. 예제를 통해 INSERT 이해하기

테이블들의 제약 조건과 컬럼의 성격에 맞게 삽입해야한다. 

- INSERT 사용법 1

```sql
/*
CUSTOMER 테이블에 'i1', 'p1', n1'인 자료를 추가하시오
*/
DESC customer;-- 먼저 이 테이블의 구성요소와 자료형 등의 정보 확인
INSERT INTO customer(id, pwd, name) -- INSERT 방법 1 : 테이블 명 뒤에 현재 넣고 싶은 것들을 나열
VALUES ('i1', 'p1', 'n1'); -- 오류! 왜냐하면 이 테이블에의 gender에는 NULL이나 다른 정보가 들어가면 안되는 NOT NULL 제약조건이 포함되어 있기 때문
```

- INSERT 사용법 2

```sql
INSERT INTO customer -- INSERT 방법 2 : 테이블 명만 쓸 것이면 아래에 이 테이블의 열에 넣을 내용을 순서대로 나열해줌
VALUES ('i2', 'p2', 'n2', null, null, null);
```

- 컬럼의 기본값을 설정하기
`INSERT`로 정보를 넣지 않아도 기본값이 설정되어 있다면 자동으로 설정된 기본값이 채워진다.

```sql
-- gender 컬럼에 기본값 설정하기
ALTER TABLE customer
MODIFY gender CHAR(1) default 'M'; -- customer테이블의 구조 바꿈 (이 컬럼의 기본값을 'M'으로 설정함)

DESC customer; -- 테이블의 간단한 정보를 나타냄(열의 이름, 열의 타입, 자료명 등)

INSERT INTO customer(id, pwd, name)
VALUES ('i1', 'p1', 'n1');
SELECT * FROM customer; -- gender열에 아무것도 안 넣었지만 기본값이 'M'이므로 채워져있을 것임.

-- 이미 만들어진 테이블에 복붙
INSERT INTO copy_t4
SELECT t4b FROM t4;
```


### 4. 예제를 통해 UPDATE 이해하기

- 특정 데이터 수정하기

```sql
-- 데이터 수정하기 n1 -> na로 수정
UPDATE customer
SET name = 'na'
WHERE id = 'i1'; -- WHERE을 사용하지 않으면 전체가 수정된다.
SELECT * FROM customer;
```

- 특정 행의 두 가지 이상의 정보 수정하기

```sql
-- id가 i1인 고객의 pwd를 'p1'에서 'pwd'로, name을 'na'에서 'nam'으로 수정하기
UPDATE customer
SET pwd = 'pwd', name = 'nam'
WHERE id = 'i1';
SELECT * FROM customer;
```
- 기존의 정보 추가, 보완하기

```sql
-- id가 i1인 고객의 name을 기존 이름에서 '1'을 더해서 수정하시오
-- 예시 : 'nam' -> 'nam1'
UPDATE customer
SET name = name || '1'
WHERE id = 'i1';
SELECT * FROM customer;
```

- `WHERE` 조건에 해당하는 데이터가 없는 경우
결국에는 수정이 안된다.

```sql
-- 해당하는 행을 못 찾은 경우
UPDATE customer
SET name = name || '1'
WHERE id = '999999'; -- id에 이런 데이터는 없다.
SELECT * FROM customer;
-- 위와 같은 경우 0개의 행이 업데이트 되었다는 결과가 나온다.
-- 즉, 수정 안된다.
```

### 5. 예제를 통해 DELETE 이해하기
- `FROM`절을 생략할 수 있다.
- `DELETE FROM`와 `TRUNCATE`는 다르다. `DELETE FROM`의 경우에는 실제 DB를 수정하는 것이 아닌, 스냅샷을 수정하는 것이고 `TRUNCATE`의 경우 DDL의 하나로써 트랜젝션이 자동으로 완료되므로 DB를 직접 수정하게 된다.

```sql
DELETE FROM customer
WHERE id = 'i1';
SELECT * FROM customer;
```

### 6. 테이블을 만들고 예제를 통해 실습하기

- 상품 테이블 만들기 (product)


	상품 테이블에 다음 자료를 추가하시오.
	- 상품번호, 상품명, 가격, 제조 일자
	- M001, 아이폰9, 1000, 18/03/01
	- M002, 아이폰8, 800, 15/07/23
	- M003, 갤S8, 500, 16/01/13
	- C001, 부가티, 4000, 19/08/05
	- C002, 모닝, 300, 18/09/04

- 상품 테이블 데이터 추가

```sql
DESC product; -- 일단 이 테이블 정보를 확인
INSERT INTO product
VALUES('M001', '아이폰9', '1000', '18/03/01');

INSERT INTO product
VALUES('M002', '아이폰8', '800', '15/07/23');

INSERT INTO product
VALUES('M003', '갤S8', '500', '16/01/13');

INSERT INTO product
VALUES('C001', '부가티', '4000', '19/08/05');

INSERT INTO product
VALUES('C002', '모닝', '300', '18/09/04');

```

- 상품 테이블 예제

```sql
-- 'M002' 상품의 가격을 10% 인상 하시오.
UPDATE product
SET prod_price = prod_price * 1.1
WHERE prod_no = 'M002';
SELECT * FROM product;

-- 상품 번호가 'M'으로 시작하는 모바일 상품들의 가격만 10% 감소하시오.
UPDATE product
SET prod_price = prod_price * 0.9
WHERE prod_no LIKE 'M%';
SELECT * FROM product;
```

- 주문 테이블 만들기(orderInfo)


	- 주문 번호, 주문자ID, 주문 일자, 주문 상품 번호, 수량
	- 1, i1, 19/04/02, M001, 3
	- 1, i1, 19/04/02, M002, 1
	- 1, i1, 19/04/02, M003, 2
	- 2, i1, 19/04/20, C001, 1
	- 3, i1, 오늘날짜, M002, 10
	- 3, i1, 오늘날짜, M003, 4

- 주문 테이블 예제

```sql
-- 주문 자료 추가하시오
DESC orderInfo; --일단 주문 테이블 확인
DESC order_line;

-- 부모의 customer의 id와 자식인 orderInfo의 id가 서로 참조되도록 FK가 설정되어 있다.
-- 따라서 부모 테이블의 id에 'i1'이라는 데이터가 없으면 INSERT 할 수 없다. 오류!
-- 따라서 부모 테이블에 i1을 넣어줘야한다. (아래 처럼)
INSERT INTO customer(id, pwd, name)
VALUES ('i1', 'p1', 'n1');
SELECT * FROM customer;

INSERT INTO orderInfo
VALUES(1, 'i1', '19/04/02');
INSERT INTO order_line
VALUES(1, 'M001', 3);

INSERT INTO orderInfo
VALUES(1, 'i1', '19/04/02'); -- 중복
INSERT INTO order_line
VALUES(1, 'M002', 1);

INSERT INTO orderInfo
VALUES(1, 'i1', '19/04/02'); -- 중복
INSERT INTO order_line
VALUES(1, 'M003', 2);

INSERT INTO orderInfo
VALUES(2, 'i1', '19/04/20');
INSERT INTO order_line
VALUES(2, 'C001', 1);

INSERT INTO orderInfo
VALUES(3, 'i1', SYSDATE);
INSERT INTO order_line
VALUES(3, 'M002', 10);

INSERT INTO orderInfo
VALUES(3, 'i1', SYSDATE);
INSERT INTO order_line
VALUES(3, 'M003', 4);

SELECT * FROM orderInfo;
SELECT * FROm order_line;
```
- 작성된 테이블을 이용하여 다양한 예제 풀어보기

```sql
/*
주문 번호, 주문자 ID, 주문 일자
주문 상품 번호, 수량을 출력으시오
*/
SELECT order_no, order_id, order_dt, order_prod_no, order_quantity
FROM orderInfo oi
JOIN order_line
USING (order_no);

/*
주문 번호, 주문자 ID, 주문자 이름, 주문자 성별, 주문 일자,
주문상품번호, 상품명, 상품 가격, 수량, 주문 예상 금액(가격 * 수량)을 출력하시오.
*/

SELECT oi.order_no, id, c.name, gender,
       oi.order_dt,
       prod_no, prod_name, prod_price,
       ol.order_quantity,
       TO_CHAR(prod_price * order_quantity, '9,999,990') 주문예상금액 -- 오라클에서는 9, 자바에서는 #
FROM orderInfo oi
JOIN order_line ol ON oi.order_no = ol.order_no
JOIN customer c ON oi.order_id = c.id
JOIN product p ON ol.order_prod_no = p.prod_no;


/*
주문 번호별 주문 총 상품 수량(주문 수량의 합), 주문 상세 건 수(LINE 테이블의 행 수)를 출력하시오.
*/

SELECT order_no, SUM(order_quantity), COUNT(ROWNUM)
FROM order_line
GROUP BY order_no;

/*
주문자ID별 주문 총 상품 수량, 주문 상세 건 수를 출력하시오.
*/

SELECT order_id, SUM(order_quantity), COUNT(*)
FROM orderInfo NATURAL JOIN order_line
GROUP BY order_id;

/*
상품 번호별 주문 총 상품 수량, 주문 상세 건 수를 출력하시오.
*/

SELECT order_prod_no, prod_name, prod_price, SUM(order_quantity), COUNT(*)
FROM order_line NATURAL JOIN product
GROUP BY order_prod_no, prod_name, prod_price;

/*
주문되지 못한 상품의 상품 번호를 출력하시오
*/
SELECT prod_no
FROM product
MINUS
SELECT order_prod_no
FROM order_line;

/*
주문되지 못한 상품의 상품 번호, 상품명, 상품 가격, 제조 일자를 출력하시오.
*/

SELECT *
FROM product
WHERE prod_no IN (SELECT prod_no
                  FROM product
                  MINUS
                  SELECT order_prod_no
                  FROM order_line);

-- 위 보다 더 줄인 코드 (중복 제거까지 해서 퍼포먼스를 높일 수 있다.)
SELECT *
FROM product
WHERE prod_no NOT IN(SELECT DISTINCT order_prod_no
                     FROM order_line);

SELECT * FROM order_info;

/*
주문 삭제
주문번호가 3번인 주문 기본정보를 삭제하시오.
*/
DELETE orderInfo
WHERE order_no = 3; -- 오류! 왜냐하면 order_no는 FK로 다른 테이블과 묶여있다!

/*
주문되지 않은 상품들을 삭제하시오.
(C002가 주문되지 않았음)
이런 경우에는 삭제가 가능하다, 왜냐하면 주문이 아직 안 들어갔기 때문에 다른 테이블에서 참조하지 않는다.
*/

-- 마지막에 지금까지 수정한 스냅샷을 DB에 직접 반영한다.
commit;

```
























