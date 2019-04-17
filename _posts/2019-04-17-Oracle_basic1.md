---
layout: post
title: "[Oracle] 기초 문법"
---

### 1. 예제로 알아보는 오라클 기초 1
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

/*
SELECT 처리 순서
<----------------SELECTION----------------->|<--PRESENTATION--->|
 FROM -> JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/

/*
산술 연산자 : + - * / (나머지 연산자 없음)
*/
SELECT employee_id, salary, salary * 12
FROM employees;

/*
문자열 연결 연산자 : ||
문자열 : 작은 따옴표 이용  ex) 'hello'
*/
SELECT employee_id, first_name, last_name,
        first_name || 'Steven' ||last_name
FROM employees;

/*
HEADING 변경하기(별칭주기) AS
*/
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

/*
모든 사원의 급여와 수당, 총급여를 출력하시오.
총급여는 (급여 * 12) + (급여 * 12 * 수당)

Oracle에서 null을 산술 연산에 참여시키면 결과는 null이 나온다.
*/
SELECT employee_id, salary, commission_pct,
    (salary * 12) + (salary * 12 * commission_pct)
FROM employees;

/*
nvl(a, b) 함수 : a값(첫 번째 인자값)이 null이면 b를 반환한다. a가 null이 아니면 a를 반환한다.
*/
SELECT employee_id 사번,
    salary 급여,
    commission_pct 수당,
    (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) 총급여
FROM employees;

/*
작은 따옴표를 출력하고 싶다면
q'[내 이름은 '손흥민'입니다.]'
대괄호 안의 내용을 출력할 수 있다. 여기서 q를 대체 인용 연산자라고 한다.
*/
SELECT department_name || 'Departments Manager ID : ' || manager_id
FROM departments;

/*
사원들의 부서 ID를 출력하시오 (107건)
*/
SELECT employee_id, department_id
FROM employees;

/*
사원들의 부서ID를 출력하시오.
단, 부서ID를 중복없이 출력하시오. - distinct
*/
SELECT distinct department_id
FROM employees;

/*
사원들의 부서ID, 업무ID를 출력하시오(107건)
distinct 바로 다음에 오는 col만 인식하여 부서ID만 중복되지 않게 출력
distinct를 사용하되 맨 앞에 한 번만 사용한다.
*/
SELECT distinct department_id, job_id
FROM employees;

/*
행제한 : WHERE
비교 연산자
<, >, <=, >=, =('같다' 연산자는 = 하나만 표시), <>('같지 않다' 연산자)
그 외에도 BETWEEN AND, IN, LIKE, IS NULL 연산자들 모두 비교 연산자이다.
*/
SELECT *
FROM employees
WHERE employee_id < 200;

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
이름이 F 이후의 글자로 시작하는 사원
*/
SELECT employee_id, first_name
FROM employees
WHERE first_name >= 'F';

/*
논리 연산자 : AND, OR, NOT
급여가 2000이상이고 5000이하인 사원들의 사번, 입사 날짜, 급여를 출력하시오.
*/
SELECT employee_id, hire_date, salary
FROM employees
WHERE salary >= 2000 AND salary <= 5000;

/*
논리 연산자 : AND, OR, NOT
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