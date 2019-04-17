---
layout: post
title: "[Oracle] 기초 문법 - 단일행 함수2"
comments: true
categories: Oracle
---

### 1. 예제로 알아보는 오라클 기초 2
```sql
SELECT *
FROM employees;

/*
BETWEEN
급여가 2000보다 작거나 5000보다 큰 사원들의 사번, 입사 날짜, 급여를 출력하시오.
*/
SELECT employee_id, hire_date, salary
FROM employees
WHERE salary BETWEEN 2000 AND 5000;

/*
입사 날짜가 2006년도 이상 2008년도 이하인 사원들의 사번과 입사 날짜를 출력하시오.
*/
SELECT employee_id, hire_date
FROM employees
WHERE hire_date BETWEEN '06/01/01' AND '08/12/31';

/*
IN 연산자 : OR 연산을 대신한다.
업무ID가 'IT_PROG' 이거나 'ST_MAN'인 사원의 사번, 업무ID를 출력하시오.
*/
SELECT employee_id, job_id
FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'ST_MAN';


/*
IN은 OR를 대체하는 연산자이다. job_id가 'IT_PROG'이거나 'ST_MAN'인 것
업무ID가 'IT_PROG'이거나 'ST_MAN'이고
금여가 2000이상이고 5000이하인 사원의 사번, 업무ID, 급여를 출력하시오.
*/
SELECT employee_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'ST_MAN')
AND salary BETWEEN 2000 AND 5000;

/*
수당을 안 받는 사원을 출력하시오.
NULL은 비교연산자(<, >, =, <>)로 비교할 수 없다.
NULL은 IS NULL 또는 IS NOT NULL 연산자로 비교한다.
0과 NULL은 다르다. 여기서는 NULL인 경우만 해당된다.
수당이 0인 사람은 수당이 있긴한데 받지 않은 것이고,
수당이 NULL인 사람은 수당이라는 것 자체가 없는 것을 의미한다.
*/
SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct IS NULL;

/*
부서 배치를 받지 않은 사원을 출력하시오.
*/
SELECT employee_id, department_id
FROM employees
WHERE department_id IS NULL;

/*
LIKE 연산자 : 일치하는 문자 패턴을 검색
이름이 'S'로 시작하는 사원을 출력하시오.
    %패턴 : 예를 들어 'S%'라는 것은 S뒤에 0개 이상의 문자가 와도 된다. 
*/SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'S%';

/*
LIKE 연산자 : 일치하는 문자 패턴을 검색
    _패턴 : 예를 들어 이름이 S로 시작하면서 글자 수가 5개인 사원을 출력하시오.
*/
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'S____';

/*
세 번째 글자가 _(언더바)이고 글자수가 5개인 job_id를 출력하시오.
ESCAPE 연산자 : 해당 문자를 탈출시킨다.
    \패턴 : 백 슬레시 다음에 오는 문자를 패턴문자에서 벗어나게함.
*/
SELECT *
FROM jobs
WHERE job_id LIKE '__\___' ESCAPE '\';
```
```sql
/*
ORDER BY : 정렬
ASC : 오름차순 (default)
DESC : 내림차순
*/
SELECT employee_id, first_name, salary, hire_date
FROM employees
ORDER BY first_name ASC;

SELECT employee_id, first_name, salary, hire_date
FROM employees
ORDER BY first_name DESC;

/*
이름을 오름차순 정렬 후에 이름이 같은 경우, 급여가 높은 순으로 출력하시오.
*/
SELECT employee_id, first_name, salary
FROM employees
ORDER BY first_name, salary DESC;

/*
바로 위의 코드를 아래처럼 쓸 수 있다.
SELECT문에서 first_name의 col이 2번 째이므로,
ORDER BY문에서 숫자 2를 이용해서 표현 가능하다.(SQL에서 첫 번째 인덱스는 1부터 시작)
또한 salary의 별칭인 '급여'를 그대로 쓸 수도 있다.
즉, 위치값 혹은 별칭을 이용할 수 있다.
*/
SELECT employee_id, first_name, salary 급여
FROM employees
ORDER BY 2, 급여 DESC;

/*
'ST_MAN', 'IT_PROG' 외의 업무ID를 갖는 사원의 사번, 업무ID, 급여를 출력하시오.
단, 업무ID를 사전순으로, 동일 업무 담당자들은 급여가 높은 사원부터 출력하시오.
*/
SELECT employee_id, job_id, salary
FROM employees
WHERE job_id NOT IN ('ST_MAN', 'IT_PROG')
ORDER BY 2, 3 DESC;

/*
SELECT문에서 사용하지 않은 Col도 ORDER BY문에서 사용 가능하다.
아래는 department_id로 정렬을 해 보았다.
단, department_id에 NULL값을 가지고 있다면 맨 마지막에 온다.
*/
SELECT employee_id, job_id, salary
FROM employees
ORDER BY department_id ASC;

/*
함수
    1. 단일행 함수 : 행당 하나의 결과 반환 Ex) MOD(), NVL()
    2. 여러행 함수 : 행집합당 하나의 결과 반환 Ex) SUM(), AVG(), COUNT()
    
자료형
    1. 숫자형 : NUMBER
        a) 실수형 : NUMBER(총 길이, 소숫점 이하 길이)
        b) 정수형 : NUMBER(총 길이, 0)
    2. 문자형 : CHAR, VARCHAR2
        a) 고정 길이 문자형 : CHAR (길이가 고정되어있고 연산속도가 빠르다.)
        b) 가변 길이 문자형 : VARCHAR2 (메모리를 효율적으로 사용하지만 연산 속도가 느리다.)
    3. 날짜형 : DATE
*/

/*   
단일 함수
    a) 숫자 함수
        MOD() : 3을 2로 나눈 나머지
        ROUND(1234.567), ROUND(1234.567, 0) : 소숫점 이하 첫 째 자리 반올림
        ROUND(1234.567, 2) : 소숫점 이하 둘 째자리까지 출력, 즉 소숫점 이하 셋 째자리에서 반올림
        ROUND(1234.567, -2) : 소숫점 이상 둘 째자리에서 반올림
        TRUNC(1234.567, 2) : 소수점 이하 둘 째까지 남기고 버리는 함수
        TRUNC(1234.567, -2) : 소수점 이상 둘째짜리에서부터 다 버리는 함수
*/
SELECT MOD(3, 2), ROUND(1234.567), ROUND(1234.567, 2), ROUND(1234.567, -2),
        TRUNC(1234.567, 2), TRUNC(1234.567, -2)
FROM dual;

/*
단일 함수
    b) 문자 함수
        LENGTH() : 문자열의 길이를 얻어오는 함수
        LENGTHB() : 문자열의 바이트 크기를 계산하는 함수
*/
SELECT LENGTH('HELLO'), LENGTH('오라클'), LENGTHB('HELLO'), LENGTHB('오라클')
FROM dual;

/*
소문자로 변환 : LOWER()
대문자로 변환 : UPPER()
첫 문자만 대문자로 변환 나머지는 소문자 변환 : INITCAP()
*/
SELECT LOWER('heLLO'), UPPER('heLLO'), INITCAP('heLLO')
FROM dual;

/*
문자열 연결 연산자 ||와 비슷한 연결 함수
CONCAT() : 두 개의 문자열을 연결
*/
SELECT CONCAT('HELLO', 'World')
FROM dual;

/*
부분 문자열 반환 : SUBSTR('abcdefgh', 3, 4)
3번 인덱스부터 4개!
단, 자바에서는 인덱스의 시작이 0부터, SQL은 1부터!
(단, 자바에서는 3번 인덱스부터 4번 인덱스까지)
    SUBSTR('ABCDEFG', 3) : 3번 인덱스부터 끝까지 출력
    SUBSTR('ABCDEFG', -3) : 끝에서부터 3번째까지
*/
SELECT SUBSTR('HELLOOracle', 3, 4), SUBSTR('ABCDEFG',3),SUBSTR('ABCDEFG', -3)
FROM dual;

/*
INSTR() : 지정된 문자열의 위치를 반환한다.
INSTR('HELLOOracle', a) : a라는 문자열이 어디 있는지
INSTR('HELLOOracle', 'b') : 이 처럼 찾는 문자가 없으면 0
INSTR('HELLOOracle', 'L') : 이 처럼 찾는 문자가 여러개 있으면 처음 발견된 위치값 리턴
INSTR('HELLOOracle', 'L', 4) : 인덱스 4번을 스타트 지점으로 생각하고 해당 문자 찾기
INSTR(UPPER('HELLOOracle'), 'L', 6) : 모두 대문자로 바꾸고 인덱스6부터 시작해서 해당 문자 위치
INSTR(UPPER('HELLOOracle'), 'L', 1, 3) : 대문자로 바꾼 후 인덱스1번부터 시작해서 3번째 L에 해당하는 위치
*/
SELECT INSTR('HELLOOracle', 'a'),
    INSTR('HELLOOracle', 'b'),
    INSTR('HELLOOracle', 'L'),
    INSTR('HELLOOracle', 'L', 4),
    INSTR(UPPER('HELLOOracle'), 'L', 6),
    INSTR(UPPER('HELLOOracle'), 'L', 1, 3)
FROM dual;

/*
REPLACE('CARD', 'C', 'B') : 해당 문자열을 찾으면 대체 문자열로 바꾼다. C를 B로 바꿈
*/
SELECT REPLACE('CARD', 'C', 'B'),
    REPLACE('BCCARD', 'C', 'B')
FROM dual;

/*
LPAD(), RPAD() : 문자열의 길이를 늘인다.(왼쪽, 오른쪽 길이 늘리고 거기에 문자를 채울 수 있다.)
*/
SELECT LPAD('ORACLE', 10, '*')
FROM dual;

/*
RTRIM(), LTRIM() : 오른쪽, 왼쪽 공백 제거
TRIM() : 양쪽 공백 모두 제거
TRIM(LEADING 'O' FROM 'ORACLE') : 왼쪽 끝 모든 특정 문자 제거(왼쪽 끝부터 이어진 'O'가 제거된다.)
TRIM(TRAILING 'E' FROM 'ORACLEEEE') : 오른쪽 끝 특정 문자 제거(오른쪽 끝부터 이어진 'E'가 제거된다.)
TRIM(BOTH 'A' FROM 'AAORACLEAA') : 양쪽 끝의 특정 문자 제거(양쪽 끝에 이어진 'A'가 제거된다.)
*/
SELECT LTRIM('    ORACLE    11G    '),
        RTRIM('    ORACLE    11G    '),
        TRIM('    ORACLE    11G    '),
        TRIM(LEADING 'O' FROM 'OOORACLE'),
        TRIM(TRAILING 'E' FROM 'ORACLEEEE')
FROM dual;

/*
날짜 함수 : SYSDATE -> 인자가 없는 함수다. 오라클에서는 이런 경우 괄호를 사용하지 않는다.
*/
SELECT SYSDATE
FROM dual;

/*
날짜 연산 : +, -
날짜형 + 숫자, 날짜형 - 숫자
*/
SELECT SYSDATE - 1 어제, SYSDATE 오늘, SYSDATE + 1 내일
FROM dual;

/*
날짜형 끼리 더하기는 안되지만 빼기는 할 수 있다.
*/
SELECT SYSDATE - (SYSDATE - 10)
FROM dual;

/*
사원의 근무 일수를 출력하시오.
*/
SELECT employee_id, hire_date, ROUND(SYSDATE - hire_date)
FROM employees;

/*
두 날짜간의 월수를 반환 : MONTHS_BETWEEN()
서원의 근무 개월 수를 출력하시오.
*/
SELECT employee_id, hire_date,
        MONTHS_BETWEEN(SYSTEM, hire_date) 근무개월수
FROM employees;

/*
날짜에 월 추가 : ADD_MONTHS()
현재 날짜 기준으로 10개월 후의 날짜를 출력하시오.
*/
SELECT ADD_MONTHS(SYSDATE, 10)
FROM dual;

/*
지정된 날짜의 다음 요일을 출력하시오.
*/
SELECT SYSDATE, NEXT_DAY(SYSDATE, '일')
FROM dual;

/*
달의 마지막 날을 반환 : LAST_DAY()
*/
SELECT LAST_DAY(SYSDATE)
FROM dual;

/*
날짜 반올림 : ROUND()
현재의 시간이 오전이면 오늘이 나오고, 현재 시간이 오후면 내일이 된다.
*/
SELECT ROUND(SYSDATE), TRUNC(SYSDATE),
    ROUND(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'MONTH'),
    ROUND(SYSDATE, 'YEAR'), TRUNC(SYSDATE, 'YEAR')    
FROM dual;

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

/*
자료형 변환용 함수들
숫자형 -> 문자형
날짜형 -> 문자형
문자형 -> 숫자형
문자형 -> 날짜형

숫자형 -> 날짜형 (X) : 숫자 -> 문자 -> 날짜 이렇게는 가능
날짜형 -> 숫자형 (X) : 날짜 -> 문자 -> 숫자 이렇게는 가능
*/

/*
숫자를 문자로 형 변환
9패턴을 이용하여 세 자리마다 콤마를 찍어준다.
0패턴은 빈 자리를 채워준다.
L은 우리나라 통화 기호가 나온다.
*/
SELECT TO_CHAR(1234567, 'L9,999,990'),
    TO_CHAR(123, '0,000'),
    TO_CHAR(0, '9,999')
FROM dual;

/*
문자를 숫자로 형 변환 : TO_NUMBER()
숫자 형식이 세 자리마다 콤마가 있다면 9패턴으로 수정 후 더하기 연산한다.
*/
SELECT TO_NUMBER('123') + 10,
    TO_NUMBER('1,234', '9,999') + 10,
    TO_NUMBER('\1,234', 'L9,999')
FROM dual;

/*
날짜를 문자로 형변환 : TO_CHAR()
*/
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS')
FROM dual;

/*
문자를 날짜로 변환 : TO_DATE()
*/
SELECT SYSDATE, SYSDATE - TO_DATE('19/03/25') 수업일수,
        SYSDATE - TO_DATE('19/03/25 09:00:00', 'YY/MM/DD HH24:MI:SS') 수업일수
FROM dual;

/*
19/12/25의 요일을 출력하시오.
*/
SELECT TO_CHAR(TO_DATE(SYSDATE), 'DAY') -- 화요일
FROM dual;

SELECT TO_CHAR(TO_DATE(SYSDATE), 'DY') -- 화
FROM dual;

/*
NULL 관련 함수 : NVL(), NVL2(), NULLIF(), COALESCE()
NVL() : 인자의 자료형이 일치해야한다.
NVL2() : 두 번째 인자와 세 번째 인자의 자료형만 일치하면 된다.
*/
SELECT employee_id
FROM employees
WHERE department_id IS NULL;

SELECT employee_id 사번, NVL(TO_CHAR(department_id), '부서 없음') 부서
FROM employees;

SELECT employee_id, NVL2(department_id, '부서 있음', '부서 없음')
FROM employees;

/*
이름과 성의 길이가 같지 않으면 이름의 길이를 출력한다.
*/
SELECT first_name, last_name, NULLIF(LENGTH(first_name), LENGTH(last_name))
FROM employees;

/*

*/
SELECT employee_id 사원ID, manager_id 관리자ID, commission_pct 수당,
        COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), '수당 없고 관리자 없음')
FROM employees;

/*
수당을 받지 않는 사원은 급여를 2000을 인상한다.
그리고 수당을 받는 사원은 기존 급여에 수당을 추가한 급여로 계산한다.
*/
SELECT COALESCE((salary + (commission_pct * salary)), salary + 2000, salary)
FROM employees;

```
