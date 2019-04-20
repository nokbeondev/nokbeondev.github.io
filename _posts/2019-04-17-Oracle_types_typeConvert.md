---
layout: post
title: "[Oracle] 자료형"
comments: true
categories: Oracle
---

### 1. 대표적인 자료형 종류
- 숫자형 : NUMBER
	- 실수형 : NUMBER(총 길이, 소숫점 이하 길이)
	- 정수형 : NUMBER(총 길이, 0)
- 문자형 : CHAR, VARCHAR2
	- 고정 길이 문자형 : CHAR (길이가 고정되어있고 연산속도가 빠르다.)
	- 가변 길이 문자형 : VARCHAR2 (메모리를 효율적으로 사용하지만 연산 속도가 느리다.)
- 날짜형 : DATE

### 2. 자료형 변환
- 숫자형 -> 문자형
- 날짜형 -> 문자형
- 문자형 -> 숫자형
- 문자형 -> 날짜형
- 숫자형 -> 날짜형 (X) : 숫자 -> 문자 -> 날짜 이렇게는 가능
- 날짜형 -> 숫자형 (X) : 날짜 -> 문자 -> 숫자 이렇게는 가능
- 패턴을 이용한 숫자를 문자로 형 변환
	- 9패턴을 이용하여 세 자리마다 콤마를 찍어준다.
	- 0패턴은 빈 자리를 채워준다.
	- 앞에 L을 붙이면 우리나라 통화 기호(원화표시)가 나온다.

```sql
SELECT TO_CHAR(1234567, 'L9,999,990'),
    TO_CHAR(123, '0,000'),
    TO_CHAR(0, '9,999')
FROM dual;
```

- TO_NUMBER() : 문자를 숫자로 형 변환
(숫자 형식이 세 자리마다 콤마가 있다면 9패턴으로 수정 후 더하기 연산한다.)

```sql
SELECT TO_NUMBER('123') + 10,
    TO_NUMBER('1,234', '9,999') + 10,
    TO_NUMBER('\1,234', 'L9,999')
FROM dual;
```


- TO_CHAR() : 날짜를 문자로 형변환

```sql
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS')
FROM dual;
```


- TO_DATE() : 문자를 날짜로 변환

```sql
SELECT SYSDATE, SYSDATE - TO_DATE('19/03/25') 수업일수,
        SYSDATE - TO_DATE('19/03/25 09:00:00', 'YY/MM/DD HH24:MI:SS') 수업일수
FROM dual;
```

- 요일 출력 함수

```sql
-- 19/12/25의 요일을 출력하시오.
SELECT TO_CHAR(TO_DATE(SYSDATE), 'DAY') -- 화요일
FROM dual;

SELECT TO_CHAR(TO_DATE(SYSDATE), 'DY') -- 화
FROM dual;
```

- NULL 관련 함수 : NVL(), NVL2(), NULLIF(), COALESCE()
- NVL() : 인자의 자료형이 일치해야한다.
- NVL2() : 두 번째 인자와 세 번째 인자의 자료형만 일치하면 된다.

```sql
SELECT employee_id
FROM employees
WHERE department_id IS NULL;

SELECT employee_id 사번, NVL(TO_CHAR(department_id), '부서 없음') 부서
FROM employees;

SELECT employee_id, NVL2(department_id, '부서 있음', '부서 없음')
FROM employees;
```

- NULLIF(a, b) : a와 b이 같으면 a출력, 다르면 b출력

```sql
-- 이름과 성의 길이가 같지 않으면 이름의 길이를 출력한다.
SELECT first_name, last_name, NULLIF(LENGTH(first_name), LENGTH(last_name))
FROM employees;
```

- COALESCE(a1, a2, a3, a4,... aN) : a1 부터 aN까지 첫음으로 null 이 아닌 값을 리턴. 모든 값이 null 이면 null 리턴


```sql
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