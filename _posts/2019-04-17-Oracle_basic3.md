---
layout: post
title: "[Oracle] 기초 문법 3 - ORDER BY"
comments: true
categories: Oracle
---

### 1. 오름/내림 차순 정렬 (default)
정렬은 `ORDER BY`를 사용한다. 오름 차순 정렬에는 `ASC`를 사용하는데, 생략 가능하다. 내림 차순 정렬은 'DESC'를 사용한다.

- 정렬의 여러가지 예제

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
```











