---
layout: post
title: "[Oracle] SUB QUERY 사용하기"
comments: true
categories: Oracle
---

### 1. SUB QUERY 개념
- MAIN QUERY (OUTER QUERY) : 전체 쿼리를 의미
- SUB QUERY (INNER QUERY) : MAIN QUERY 안 쪽에 위치함
(SUB QUERY 결과가 MAIN QUERY에서 사용된다.)

- SUB QUERY의 종류
    - 단일행 반환하는 SUB QUERY : `=`, `-`, `<`, `>`, `<>` 등과 같은 일반 비교연산자를 쓰면된다.
    - 여러행 반환하는 SUB QUERY : `IN`, `ANY`, `ALL`, `EXISTS` 등과 같은 연산자를 쓰면된다.

- SUB QUERY 위치
    - `SELECT`절
    - `FROM`절
    - `WHERE`절

- SUBQUERY의 일반적인 관례
Column이 먼저오고 그 다음에 SUBQUERY가 온다.

- QUERY에 쓰이는 연산자
	- `ANY` 연산자 : SUBQUERY로 검색해서 나온 값들 중에 하나와 비교해서 해당된다면
	- `ANY`보다 크다 : SUBQUERY로 검색해서 나온 값들 중에 그 최솟값보다 크다.
	- `ANY`보다 작다 : SUBQUERY로 검색해서 나온 값들 중에 그 최댓값보다 작다.
	- `= ANY` : `IN`과 같은 연산
	- `ALL` 연산자 : 모든 값과 비교
		- `ALL`보다 크다 : 최댓값보다 크다.
		- `ALL`보다 작다 : 최솟값보다 작다.
		- `ANY`나 `ALL` 페어와이징을 못 한다.(두 개 이상 연결해서 연산 불가)

### 2. 예제를 통한 이해
```sql
/*
사원의 최대 급여를 출력하시오.
*/
SELECT MAX(salary)
FROM employees;

/*
사원의 최대 급여를 받는 사원의 사번, 이름, 급여를 출력하시오.

<풀이>
1) 최대 급여를 계산
2) 최대 급여와 같은 급여를 받는 사원을 검색
*/
SELECT employee_id, first_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

/*
성이 'Abel'인 사원의 급여보다 많은 급여를 받는 사원의 성과 급여를 출력하시오.
(단일행 반환하는 SUB QUERY)
<풀이>
1) 성이 Abel인 사원의 급여 찾기
2) 그 급여보다 많은 급여를 받는 사원을 찾기
*/
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Abel');

/*
부서별 평균 급여보다 많은 급여를 받는 사원의 사번, 부서ID, 급여를 출력하시오.
(여러행 반환하는 SUB QUERY)

<풀이>
1) 부서별 평균 급여 계산하는 SUBQUERY
2) 위에서 계산한 평균 급여보다 큰 급여 찾기
*/

-- 아래 같은 페어와이징 불가! - 오류!
SELECT department_id, employee_id, salary
FROM employees
WHERE department_id, salary > ANY 
                (SELECT department_id, AVG(salary) 
                FROM employees
                GROUP BY department_id);


-- 부서별 평균급여 계산 모범 답안

SELECT e.department_id, e.employee_id, e.salary, avgsal
FROM employees e
JOIN (SELECT department_id, AVG(salary) avgsal
FROM employees
GROUP BY department_id) avge
ON e.department_id = avge.department_id
WHERE e.salary > avge.avgsal;

/*
업무ID가 'IT_PROG'인 사원의 최소급여보다 큰 급여를 받는 사원들의 사번, 이름, 업무ID, 급여를 출력하시오.
*/
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary >ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG');

/*
관리자가 없는 사원(최고 경영자)을 출력하시오.
*/
SELECT employee_id, manager_id, first_name, last_name
FROM employees
WHERE manager_id IS NULL;

/*
부하 직원이 없는 사원들을 출력하시오.
*/
SELECT employee_id, first_name
FROM employees
WHERE employee_id IN 
    (SELECT DISTINCT manager_id
    FROM employees)
ORDER BY employee_id;

/*
성이 'Davies'인 사원과 같은 부서에 근무하면서 부서평균급여보다 많은 급여를 받는 사원의 사번, 성, 이름, 급여를 출력하시오.
상호연관 SUB QUERY의 처리 순서 : OUTER QUERY -> INNER -> OUTER -> INNER
*/
SELECT employee_id, last_name, first_name, salary
FROM employees e
WHERE salary >
    (SELECT AVG(salary) FROM employees emp
    WHERE department_id = e.department_id)
AND department_id = (SELECT department_id FROM emp WHERE last_name = 'Davies');

/*
사번, 이름, 부서ID, 부서명, 부서 소속 도시를 출력하시오.
*/
SELECT employee_id, first_name, e.department_id,
    (SELECT department_name FROM departments 
    WHERE department_id = e.department_id) 부서명,
    (SELECT city FROM locations
    WHERE location_id = (SELECT location_id
                        FROM departments
                        WHERE department_id = e.department_id)) 도시명
FROM employees e;
```

- `ROWNUM`과 `ROWID`를 사용하기
	- `ROWNUM` : 행 번호
	- `ROWID` : 행 고유의 값

```sql
/*
!!!!!!!!!!!!!!!!중요함!!!!!!!!!!!!!!!!!!!!!!
INLINE VIEW -> 웹에서 페이징 처리할 때 많이 쓰인다.
의사 컬럼 (pseudo column : 이미 내장되어있는 컬럼)
ROWNUM : 행 번호, ROWID : 행 고유 값
*/
SELECT ROWNUM, ROWID, region_id
FROM regions
WHERE region_id >= 3;

SELECT ROWNUM, employee_id, first_name
FROM employees;

SELECT ROWNUM, employee_id, first_name
FROM employees
ORDER BY first_name; -- ROWNUM이 정렬된 것을 다시 이름순으로 정렬했으므로 ROWNUM의 순서는 뒤죽박죽

SELECT ROWNUM, employee_id, first_name
FROM (SELECT ROWNUM, employee_id, first_name
      FROM employees
      ORDER BY first_name); -- 위의 절차 후 다시 ROWNUM을 메긴경우
```

- 예제를 통해 `ROWNUM` 제대로 이해하기
먼저 아래의 코드는 정상적으로 작동할 것이다.

```sql
/*
이름순으로 정렬된 사원의 1행 ~ 5행까지 검색하시오
*/
SELECT ROWNUM, employee_id, first_name
FROM (SELECT ROWNUM, employee_id, first_name
      FROM employees
      ORDER BY first_name)
WHERE ROWNUM BETWEEN 1 AND 5;
```

하지만 아래처럼 6행~10행을 출력하려고하면 아무 것도 출력되지 않는다.     
    
```sql
/*
이름순으로 정렬된 사원의 6행 ~ 10행까지 검색하시오
*/
SELECT ROWNUM, employee_id, first_name
FROM (SELECT ROWNUM, employee_id, first_name
      FROM employees
      ORDER BY first_name
      )
WHERE ROWNUM BETWEEN 6 AND 10; -- 이렇게 하면 하나도 출력 안 된다.
```

처리 순서를 잘 알아야한다. `ROWNUM`이 발급되는 시점은 SELECTION이 완전히 끝났을 때이다. SELECTION이 끝나지 않은 시점에서 `WHERE`에서의 `ROWNUM`은 1(default)이다. 따라서 위의 예제처럼 `ROWNUM`을 1부터 시작하면 `WHERE`절에 들어가서 첫 행을 취해 올 수 있다. 자동으로 1씩 증가하며 원하는 행까지 모두 취해 올 수 있다.

그러나 `ROWNUM`을 2 이상의 숫자로 시작하면 `WHERE`절에 들어가도 현재의 `ROWNUM`인 1과 다르기 때문에 `ROWNUM`이 증가하지도 못하고 해당 행도 못 찾아온다.

	SELECT 처리 순서
	FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

아래처럼 해본다. 한 번 더 INNERVIEW로 감싸고 `ROWNUM`에게 r이라는 별칭을 준다. 그리고 r값으로 6~10을 얻어낸다.

```sql
SELECT r, employee_id, first_name
FROM (SELECT ROWNUM r, employee_id, first_name
      FROM (SELECT ROWNUM, employee_id, first_name
            FROM employees
            ORDER BY first_name
            )
     )
WHERE r BETWEEN 6 AND 10;
```
