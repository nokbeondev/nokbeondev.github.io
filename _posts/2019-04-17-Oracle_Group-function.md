---
layout: post
title: "[Oracle] 기초 문법 - 그룹화 함수1"
---

### 1. 예제로 알아보는 기초 문법
- 처리순서를 알고 있으면 SQL문을 이해하는데 큰 도움이 된다.
	- 처리 순서 : FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
	- 처리 순서로 별칭(alias)를 사용할 수 있는 위치를 알 수 있다.(SELECT절에서 별칭이 선언되므로 ORDER BY절에서 별칭 사용 가능)

```sql
-- 그룹함수 : SUM(), AVG(), COUNT()
-- 주의 : COUNT()에 *로 카운트를 하면 NULL까지 모두 카운트한다.
SELECT SUM(salary) 총급여합,
       SUM(salary) 총수당, -- NULL값 무시
       AVG(salary) 총급여평균, -- NULL값 무시
       AVG(commission_pct) 평균수당1, -- NULL값 무시
       COUNT(commission_pct) "수당 받는 사원 수",
       COUNT(*) "총사원 수", -- NULL포함 카운트
       COUNT(department_id) "사원이 속한 부서 수" -- NULL 값 제외하고 카운트
FROM employees;

-- 그룹함수 : MAX(), MIN()
SELECT MAX(salary) "최대 급여", MAX(hire_date) "최근 입사 일자",
       MIN(salary) "최소 급여", MIN(hire_date) "최장기 입사 일자"
FROM employees;

/*
SELECT 처리 순서
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/

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

/*
그룹 함수(SUM, COUNT, AVG, MIN, MAX...)는 GROUP BY 이후에 처리
*/

/*
각 부서별 사원 수가 5명 이상인 부서의 부서ID, 사원 수를 출력하시오.
*/
SELECT department_id, COUNT(*)
FROM employees
WHERE COUNT(*) >= 5;

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
