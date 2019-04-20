---
layout: post
title: "[Oracle] 그룹 함수와 GROUP BY"
comments: true
categories: Oracle
---

	SELECT 처리 순서
	FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY


### 1. 그룹함수 
- 종류 : SUM(), AVG(), COUNT(), MAX(), MIN()
- 주의 : COUNT()에 별표기호로 카운트를 하면 `NULL`까지 모두 카운트한다.

### 2. GROUP BY

```sql
SELECT SUM(salary) 총급여합,
       SUM(salary) 총수당, -- NULL값 무시
       AVG(salary) 총급여평균, -- NULL값 무시
       AVG(commission_pct) 평균수당1, -- NULL값 무시
       COUNT(commission_pct) "수당 받는 사원 수",
       COUNT(*) "총사원 수", -- NULL포함 카운트
       COUNT(department_id) "사원이 속한 부서 수" -- NULL 값 제외하고 카운트
FROM employees;

SELECT MAX(salary) "최대 급여", MAX(hire_date) "최근 입사 일자",
       MIN(salary) "최소 급여", MIN(hire_date) "최장기 입사 일자"
FROM employees;

/*
부서별 사원 수를 출력하시오.
*/
SELECT department_id 부서코드, COUNT(*) 사원수
FROM employees
GROUP BY department_id;

/*
부서별 사원수, 총급여, 최소 급여, 최대 급여값을 출력하시오.
*/
SELECT department_id, SUM(salary), MIN(salary), MAX(salary)
FROM employees
GROUP BY department_id;

/*
부서별 사원수, 총급여, 최소 급여, 최대 급여값을 출력하시오.
*/
SELECT department_id, job_id, COUNT(*), SUM(salary), MIN(salary), MAX(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id DESC;

/*
GROUP BY절에서 사용한 컬럼과 그룹함수만 SELECT절에서 사용할 수 있다.
*/
SELECT job_id, COUNT(*)
FROM employees
GROUP BY department_id;
```

### 2. GROUP BY
전체가 아닌 특정 그룹으로 묶어 데이터를 집계할 수도 있다. 이때 사용되는 구문이 바로 `GROUP BY` 절이다. 그룹으로 묶을 컬럼명이나 표현식을 `GROUP BY` 절에 명시해서 사용하며 `GROUP BY` 구문은 `WHERE`와 `ORDER BY`절 사이에 위치한다. 그룹 함수(SUM, COUNT, AVG, MIN, MAX...)는 `GROUP BY` 이후에 처리한다.

- 예제 코드

```sql
/*
각 부서별 사원 수가 5명 이상인 부서의 부서ID, 사원 수를 출력하시오.
*/
SELECT department_id, COUNT(*)
FROM employees
WHERE COUNT(*) >= 5;
```

### 3. HAVING
`HAVING`절은 `GROUP BY`절 다음에 위치해 `GROUP BY`한 결과를 대상으로 다시 필터를 거는 역할을 수행한다. 즉 `HAVING` 필터 조건 형태로 사용한다. 

- 예제 코드

```sql
/*
그룹에 대한 조건 : HAVING
*/
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 5;

/*
처리 순서 : FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
업무ID에 'REP'문자를 갖는 사원들을 대상으로
업무별 총 급여를 출력하시오
단, 총 급여가 13000보다 큰 업무ID만 출력한다.
출력 시 총 급여가 큰 업무부터 출력한다.
*/
SELECT job_id, SUM(salary) 총급여 -- 별칭 지정
FROM employees
WHERE job_id LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 7000 -- 처리 순서에 의해 HAVING 절에서는 별칭 못 쓴다.
ORDER BY 총급여 DESC; -- SELECT 다음에 처리되므로 별칭 사용 가능하다.
```
