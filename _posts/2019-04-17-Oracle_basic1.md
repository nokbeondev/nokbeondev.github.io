---
layout: post
title: "[Oracle] 기초 문법 1 - SELECT, FROM, WHERE과 비교 연산자, 산술/논리 연산자, 별칭"
comments: true
categories: Oracle
---

### 1. 예제로 알아보는 SELECT와 FROM
- SELECT의 처리 순서
FROM -> JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

- SELECT의 문법 순서
SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY
- 예제 코드

```sql
SELECT employee_id, first_name, hire_date, salary
FROM employees;

-- 모든 사원의 사번, 성명, 직무ID, 부서ID를 출력하시오.
SELECT employee_id, first_name, last_name, job_id, department_id
FROM employees;

-- 모든 사원의 모든 Column을 출력하시오.
SELECT *
FROM employees;

-- 직무 정보를 모두 출력하시오.
SELECT *
FROM jobs;
```

### 2. 예제로 알아보는 산술 연산자와 문자열 연결 연산자
- 산술 연산자
Oracle에서 `null`을 산술 연산에 참여시키면 결과는 `null`이 나온다. 기본적인 산술연산인 덧셈, 뺄셈, 곱셈, 나눗셈은 있지만 나머지 연산자가 없다. (나머지 연산자가 없는대신 `MOD()`함수 이용)


```sql
SELECT employee_id, salary, salary * 12
FROM employees;
```

- 문자열 연결 연산자 : ||
문자열 : **작은 따옴표** 이용  ex) 'hello'

```sql
SELECT employee_id, first_name, last_name,
        first_name || 'Steven' ||last_name
FROM employees;
```

### 3. 예제로 알아보는 논리 연산자
- 논리 연산자 : AND, OR, NOT

```sql
/*
급여가 2000이상이고 5000이하인 사원들의 사번, 입사 날짜, 급여를 출력하시오.
*/
SELECT employee_id, hire_date, salary
FROM employees
WHERE salary >= 2000 AND salary <= 5000;

/*
급여가 2000보다 작거나 5000보다 큰 사원들의 사번, 입사 날짜, 급여를 출력하시오.
*/
SELECT employee_id, hire_date, salary
FROM employees
WHERE salary < 2000 OR salary > 5000;

/*
논리 연산자 : AND, OR, NOT
급여가 2000이상이고 5000이하가 아닌! 사원들의 사번, 입사 날짜, 급여를 출력하시오.
*/
SELECT employee_id, hire_date, salary
FROM employees
WHERE NOT(salary >= 2000 AND salary <= 5000);

/*
업무ID가 'IT_PROG'이거나 'ST_MAN'이고
금여가 2000이상이고 5000이하인 사원의 사번, 업무ID, 급여를 출력하시오.
*/
SELECT employee_id, department_id, salary
FROM employees
WHERE (job_id = 'IT_PROG' OR job_id = 'ST_MAN')
    AND (salary >= 2000 AND salary <= 5000);
```


### 4. 예제로 알아보는 조건문 WHERE과 비교 연산자
비교 연산자에는 `<`, `>`, `<=`, `>=`, `=`('같다' 연산자는 `=` 하나만 표시), `<>`('같지 않다' 연산자) 등이 있다. 그 외에도 `BETWEEN` `AND`, `IN`, `LIKE`, `IS NULL` 연산자들 모두 비교 연산자이다.

- WHERE, BETWEEN, AND 예제

```sql
/*
사번이 홀수인 사원의 사번과 급여를 출력하시오.
MOD()함수는 오라클에서 제공하는 나머지 구해주는 함수이다.
*/
SELECT employee_id, salary
FROM employees
WHERE MOD(employee_id, 2) = 1;

/*
사원의 입사일자가 2006년 이후인 사원의 사번과 입사 날짜를 출력하시오.
*/
SELECT employee_id, hire_date
FROM employees
WHERE hire_date >= '06/01/01';

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
```

- OR, IN, IS NULL 예제

```sql
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
```

- LIKE 예제

```sql
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

- 문자 비교 예제

```sql
/*
이름이 F 이후의 글자로 시작하는 사원
*/
SELECT employee_id, first_name
FROM employees
WHERE first_name >= 'F';
```

- 대체 인용 연산자 q[]
예를 들어 작은 따옴표를 출력하고 싶은 경우 사용된다.

대괄호 안의 내용을 출력할 수 있다. 여기서 q를 대체 인용 연산자라고 한다. 
	
    Department's Manager ID

위와 같은 's를 출력해야하는 경우가 있다. 이런 경우에 대체 인용 연산자를 사용하면 된다.

```sql
SELECT department_name || q'[Department's Manager ID : ] ' || manager_id
FROM departments;
```

### 5. HEADING 변경하기 (별칭주기) AS

```sql
SELECT employee_id AS 사번
FROM employees;

SELECT employee_id 사번
FROM employees;

-- 공백을 포함한 별칭을 줄 때에 큰 따옴표 사용
SELECT employee_id "사원 번호" 
FROM employees;

-- 대소문자 구분하고 싶을 때도 큰 따옴표 사용
SELECT employee_id "EmpId"
FROM employees;
```