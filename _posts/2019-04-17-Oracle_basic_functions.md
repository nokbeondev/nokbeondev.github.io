---
layout: post
title: "[Oracle] 함수"
comments: true
categories: Oracle
---


**처리순서를 알고 있으면 SQL문을 이해하는데 큰 도움이 된다.**
	- 처리 순서 : FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
	- 처리 순서로 별칭(alias)를 사용할 수 있는 위치를 알 수 있다.(SELECT절에서 별칭이 선언되므로 ORDER BY절에서 별칭 사용 가능)



### 1. 대략적 분류
- 단일행 함수 : 행당 하나의 결과 반환 Ex) MOD(), NVL()
- 여러행 함수 : 행집합당 하나의 결과 반환 Ex) SUM(), AVG(), COUNT()

### 2. 숫자 함수
- MOD(3, 2) : 3을 2로 나눈 **나머지**
- ROUND(1234.567), ROUND(1234.567, 0) : **소숫점 이하 첫 째 자리에서** 반올림, 즉 **정수** 출력
- ROUND(1234.567, 2) : **소숫점 이하 둘 째자리까지** 출력, 즉 **소숫점 이하 셋 째자리에서** 반올림
- ROUND(1234.567, -2) : **소숫점 이상 둘 째자리**에서 반올림
- TRUNC(1234.567, 2) : **소수점 이하 둘 째까지 남기고** 버리는 함수
- TRUNC(1234.567, -2) : **소수점 이상 둘째짜리부터** 다 버리는 함수

```sql
SELECT MOD(3, 2), ROUND(1234.567), ROUND(1234.567, 2), ROUND(1234.567, -2),
        TRUNC(1234.567, 2), TRUNC(1234.567, -2)
FROM dual;
```

### 3. 문자 함수
- LENGTH() : 문자열의 **길이**를 얻어오는 함수
- LENGTHB() : 문자열의 **바이트 크기**를 계산하는 함수

```sql
SELECT LENGTH('HELLO'), LENGTH('오라클'), LENGTHB('HELLO'), LENGTHB('오라클')
FROM dual;
```


- 소문자로 변환 : LOWER()
- 대문자로 변환 : UPPER()
- 첫 문자만 대문자로 변환 나머지는 소문자 변환 : INITCAP()

```sql
SELECT LOWER('heLLO'), UPPER('heLLO'), INITCAP('heLLO')
FROM dual;
```

- CONCAT() : 두 개의 문자열을 연결 (문자열 연결 연산자 `||`와 비슷한 연결 함수)

```sql
SELECT CONCAT('HELLO', 'World')
FROM dual;
```

- SUBSTR('abcdefgh', 3, 4) : 부분 문자열 반환 (3번 인덱스부터 4개 반환)
**(주의점1 : 자바에서는 인덱스의 시작이 0부터, SQL은 1부터)**
**(주의점2 : 자바에서는 SUBSTR()의 사용법이 3번 인덱스부터 4번 인덱스까지 범위를 의미하고 SQL에서는 3번 인덱스부터 문자 4개까지 갯수를 의미한다.)**

- SUBSTR('ABCDEFG', 3) : 3번 인덱스부터 끝까지 출력
- SUBSTR('ABCDEFG', -3) : 끝에서부터 3번째까지

```sql
SELECT SUBSTR('HELLOOracle', 3, 4), SUBSTR('ABCDEFG',3),SUBSTR('ABCDEFG', -3)
FROM dual;
```


- INSTR() : 지정된 문자열의 위치를 반환한다.
- INSTR('HELLOOracle', a) : a라는 문자열이 어디 있는지
- INSTR('HELLOOracle', 'b') : 이 처럼 찾는 문자가 없으면 0
- INSTR('HELLOOracle', 'L') : 이 처럼 찾는 문자가 여러개 있으면 처음 발견된 위치값 리턴
- INSTR('HELLOOracle', 'L', 4) : 인덱스 4번을 스타트 지점으로 생각하고 해당 문자 찾기
- INSTR(UPPER('HELLOOracle'), 'L', 6) : 모두 대문자로 바꾸고 인덱스6부터 시작해서 해당 문자 위치
- INSTR(UPPER('HELLOOracle'), 'L', 1, 3) : 대문자로 바꾼 후 인덱스1번부터 시작해서 3번째 L에 해당하는 위치

```sql
SELECT INSTR('HELLOOracle', 'a'),
    INSTR('HELLOOracle', 'b'),
    INSTR('HELLOOracle', 'L'),
    INSTR('HELLOOracle', 'L', 4),
    INSTR(UPPER('HELLOOracle'), 'L', 6),
    INSTR(UPPER('HELLOOracle'), 'L', 1, 3)
FROM dual;
```

- REPLACE('CARD', 'C', 'B') : 해당 문자열을 찾으면 대체 문자열로 바꾼다. C를 B로 바꿈

```sql
SELECT REPLACE('CARD', 'C', 'B'),
    REPLACE('BCCARD', 'C', 'B')
FROM dual;
```

- LPAD(), RPAD() : 문자열의 길이를 늘인다.(왼쪽, 오른쪽 길이 늘리고 거기에 문자를 채울 수 있다.)

```sql
SELECT LPAD('ORACLE', 10, '*')
FROM dual;
```

- RTRIM(), LTRIM() : 오른쪽, 왼쪽 공백 제거
- TRIM() : 양쪽 공백 모두 제거
- TRIM(LEADING 'O' FROM 'ORACLE') : 왼쪽 끝 모든 특정 문자 제거(왼쪽 끝부터 이어진 'O'가 제거된다.)
- TRIM(TRAILING 'E' FROM 'ORACLEEEE') : 오른쪽 끝 특정 문자 제거(오른쪽 끝부터 이어진 'E'가 제거된다.)
- TRIM(BOTH 'A' FROM 'AAORACLEAA') : 양쪽 끝의 특정 문자 제거(양쪽 끝에 이어진 'A'가 제거된다.)

```sql
SELECT LTRIM('    ORACLE    11G    '),
        RTRIM('    ORACLE    11G    '),
        TRIM('    ORACLE    11G    '),
        TRIM(LEADING 'O' FROM 'OOORACLE'),
        TRIM(TRAILING 'E' FROM 'ORACLEEEE')
FROM dual;
```

### 4. 날짜 함수

- 날짜 함수 : SYSDATE -> 인자가 없는 함수다. 오라클에서는 이런 경우 괄호를 사용하지 않는다.

```sql
SELECT SYSDATE
FROM dual;
```

- 날짜 연산 : `+`, `-`
- 날짜형 `+` 숫자, 날짜형 `-` 숫자

```sql
SELECT SYSDATE - 1 어제, SYSDATE 오늘, SYSDATE + 1 내일
FROM dual;
```

- 날짜형 끼리 더하기는 안되지만 빼기는 할 수 있다.

```sql
SELECT SYSDATE - (SYSDATE - 10)
FROM dual;

-- 사원의 근무 일수를 출력하시오.
SELECT employee_id, hire_date, ROUND(SYSDATE - hire_date)
FROM employees;
```


- MONTHS_BETWEEN() : 두 날짜간의 월수를 반환

```sql
-- 사원의 근무 개월 수를 출력하시오.
SELECT employee_id, hire_date,
        MONTHS_BETWEEN(SYSTEM, hire_date) 근무개월수
FROM employees;
```


- ADD_MONTHS() : 날짜에 월 추가

```sql
-- 현재 날짜 기준으로 10개월 후의 날짜를 출력하시오.
SELECT ADD_MONTHS(SYSDATE, 10)
FROM dual;
```

- NEXT_DAY() : 다음 요일 출력

```sql
-- 지정된 날짜의 다음 요일을 출력하시오.
SELECT SYSDATE, NEXT_DAY(SYSDATE, '일')
FROM dual;
```


- LAST_DAY() : 달의 마지막 날을 반환

```sql
SELECT LAST_DAY(SYSDATE)
FROM dual;
```

- ROUND() : 날짜 반올림

현재의 시간이 오전이면 오늘이 나오고, 현재 시간이 오후면 내일이 된다.
```sql
SELECT ROUND(SYSDATE), TRUNC(SYSDATE),
    ROUND(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'MONTH'),
    ROUND(SYSDATE, 'YEAR'), TRUNC(SYSDATE, 'YEAR')    
FROM dual;
```

- 연도 출력 예제들

```sql
/*
입사년도가 2006년인 사원을 출력하시오.
여러가지 방법이 있다.
*/
SELECT *
FROM employees
WHERE hire_date >= '06/01/01' AND hire_date <= '06/12/31';
-- WHERE hire_date BETWEEN '06/01/01' AND '06/12/31';
-- WHERE hire_date LIKE '06%';

/*
2006년에 입사한 사원들의 입사 연도와 월만 출력하시오.
06/01/13인 경우 06/01만 출력
*/

SELECT employee_id, hire_date, TRUNC(hire_date, 'MONTH'),
        SUBSTR(TRUNC(hire_date, 'MONTH'), 1, 5)
FROM employees
WHERE hire_date >= '06/01/01' AND hire_date <= '06/12/31';
-- WHERE hire_date BETWEEN '06/01/01' AND '06/12/31';
-- WHERE hire_date LIKE '06%';

SELECT 'TEST'
FROM dual
WHERE SYSDATE > '01/02/03';
```
