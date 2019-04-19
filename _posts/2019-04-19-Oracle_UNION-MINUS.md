---
layout: post
title: "[Oracle] UNION과 MINUS"
comments: true
categories: Oracle
---

### 1. 예제로 알아보는 UNION과 MINUS
```sql
/*
UNION 위, 아래의 열이 같아야한다. 위 아래의 합집합이라고 보면 된다.
즉, 중복되지 않게 나온다.

<조건>
SELECT된 컬럼 수, 자료형이 같아야함
NULL 값은 중복 검사에 포함된다.
기본 출력은 컬럼 순서로 오름 차순 된다.


*/
SELECT employee_id, job_id
FROM employees
UNION ALL-- 중복되는 컬럼을 하나의 컬럼에 표시한다.
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id;


/*
현재 직무가 이전 직무와 동일한 사원의 사번과 직무ID를 출력하시오. -- 176, 200
*/
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id;


/*
차집합 연산자 MINUS

한 번도 직무를 변경하지 않은 사원의 사번을 출력하시오.
*/
SELECT employee_id
FROM employees
MINUS
SELECT employee_id
FROM job_history
ORDER BY employee_id;

/*
직무를 변경한 사원들만 출력하시오
*/
SELECT employee_id, job_id
FROM job_history
MINUS
SELECT employee_id, job_id
FROM employees
ORDER BY employee_id;

/*
컬럼 수와 자료형 맞추기
*/
SELECT location_id "지역코드", department_name "부서명", TO_CHAR(NULL) "도시명"
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL), city -- 억지로 자료형과 컬럼수 맞추는 방법(NULL 이용)
FROM locations;

/*
UNION은 첫 테이블의 컬럼들로만 정렬 가능
*/
SELECT location_id "지역코드", department_name "부서명", TO_CHAR(NULL) "도시명"
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL), city -- 억지로 자료형과 컬럼수 맞추는 방법(NULL 이용)
FROM locations
ORDER BY 부서명, 도시명;
```
