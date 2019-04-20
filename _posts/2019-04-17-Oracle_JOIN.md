---
layout: post
title: "[Oracle] JOIN문과 USING"
comments: true
categories: Oracle
---

### 1. JOIN문 종류
먼저, JOIN문은 **오라클용 JOIN문**으로 사용하는 방법과 **표준화된 JOIN문(ANSI JOIN)**으로 사용하는 방법이 있다.(가독성과 기타 여러가지 효율성의 측면에서 **ANSI JOIN문으로 이용하는 것이 좋다.** 그렇다고 오라클용 JOIN문이 처리속도가 느리다는 것은 아니다.)

- 여기서 다룰 JOIN문들
	- INNER JOIN
	- NATURAL JOIN
	- SELF JOIN
	- LEFT OUTER JOIN
	- RIGHT OUTER JOIN
	- FULL JOIN


### 2. INNER JOIN
완전히 일치하는 데이터만 나오는 방식(일반적인 조인 방식)이다. INNER JOIN은 여러가지가 있는데 그 중 EQUI JOIN의 사용법(오라클용, 표준화용 두 가지 비교)은 아래와 같다.

```sql
SELECT employee_id, first_name, 
       employees.department_id, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

-- 오라클용 문법
SELECT employee_id, first_name, 
       e.department_id, department_name
FROM employees e, departments d  --테이블 별칭 
WHERE e.department_id = d.department_id;

--표준화된 JOIN(ANSI JOIN)
SELECT employee_id, first_name, 
       e.department_id, department_name
FROM employees e JOIN departments d  --테이블 별칭 
ON e.department_id = d.department_id;

/*
사원의 사번, 이름, 부서ID, 업무ID, 업무명을 출력하시오.(106)
*/
SELECT employee_id, first_name, e.department_id, department_name, e.job_id, job_title
FROM employees e JOIN departments d ON e.department_id = d.department_id
                 JOIN jobs j ON e.job_id = j.job_id;
/*
부서ID, 부서이름
부서가 속한 지역ID(location_id)
도시, 국가명을 출력하시오
*/
SELECT d.department_id, department_name
     , d.location_id
     , city
     , country_name
FROM departments d 
     JOIN locations l ON d.location_id = l.location_id
     JOIN countries c ON l.country_id = c.country_id;
```


### 3. NATURAL JOIN
두 개 이상의 테이블에서 데이터 자료형과 이름이 같은 컬럼을 기반으로 JOIN 할 수 있다.

```sql
SELECT employee_id, e.department_id, department_name
FROM employees e 
JOIN departments d ON e.department_id = d.department_id;

/*
네츄럴조인 사용할 때에는 주의해야한다.
employee 테이블과 department 테이블에 겹치는 것이 department_id와 manager_id가 있다.
이렇게 두 개 콜럼이상이 겹치면 이 모두가 동일해야(AND의 개념) 참조 가능하다.
또한 네츄럴조인은 별칭을 사용하지 않는다. (현업에서 잘 안 쓴다. 위험하다)
*/
SELECT employee_id, department_id, department_name
FROM employees
NATURAL JOIN departments; 
```

### 3. USING절
두 개 이상의 컬럼이 일치하는 경우 하나의 컬럼만 일치하도록 할 수 있다.
USING절에 별칭을 사용하면 안된다. 에러난다.

```sql
SELECT employee_id, department_id, department_name
FROM employees
JOIN departments
USING (department_id);
```
- JOIN에서 USING과 ON 사용하기

```sql
/*
일반 조건과 JOIN조건
사원의 급여가 5000보다 큰 사원을 대상으로
사번, 이름, 급여, 부서명을 출력하시오.
*/
-- 표준화된 JOIN (USING 사용)
SELECT employee_id, first_name, salary, department_name
FROM employees
JOIN departments
USING (department_id)
WHERE salary > 5000;

-- 표준화된 JOIN (ON 사용)
SELECT employee_id, first_name, salary, department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE salary > 5000;

-- 오라클 전용 문법 사용
SELECT employee_id, first_name, salary, department_name
FROM employees e, departments d
WHERE e.department_id =  d.department_id
AND salary > 5000;
```

- GROUP BY와 JOIN 함께 사용하기

```sql
/*
그룹화 JOIN
부서별 부서ID, 부서이름, 사원수를 출력하시오.
GROUP BY에서 사용한 컬럼과 그룹함수만 SELECT절에서 사용가능하다!!!
*/
SELECT department_id, department_name, COUNT(*)
FROM employees
JOIN departments USING (department_id)
GROUP BY department_id, department_name;
```

### 4. SELF JOIN
자기 자신과 JOIN을 하는 것이다.

- 예제 코드

```sql
/*
Self-JOIN
관리자보다 많은 급여를 받는 사원의 정보를 출력하시오.
출력할 사원의 정보 : 사번, 이름, 사원 급여, 관리자 번호, 관리자 이름, 관리자 급여
*/
SELECT e.employee_id 사번,
       e.first_name 사원명,
       e.salary 사원급여,
       e.manager_id 관리자번호,
       m.first_name 관리자이름,
       m.hire_date 관리자입사일자,
       m.salary 관리자급여
FROM employees e
JOIN employees m
ON e.manager_id = m.manager_id
WHERE e.salary > m.salary;
```

### 5. OUTER JOIN
기준이 되는 집합과 JOIN하는 집합의 연결이 성립되지 않더라도 그 결과를 추출한다.

- LEFT OUTER JOIN (OUTER는 생략 가능, default)
왼쪽 테이블이 기준이다.(FROM절에 있는 테이블이 왼쪽이다.)

- RIGHT OUTER JOIN
오른쪽 테이블이 기준이다.

- 예제 코드

```sql
/*
OUTER JOIN
 - LEFT OUTER JOIN (OUTER는 생략해서 사용 가능)
*/
SELECT employee_id, department_name
FROM employees e
LEFT OUTER JOIN departments d -- employees(왼쪽테이블)이 기준이 된다는 말
ON e.department_id = d.department_id; -- 107건 (부서 없는 애까지 나온다.)

/*
위의 내용을 INNER JOIN으로 해보기
*/
SELECT employee_id, department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id; -- 106건

/*
이번에는 부서 기준으로 출력 - RIGHT OUTER JOIN
*/
SELECT employee_id, department_name
FROM employees
RIGHT OUTER JOIN departments
USING (department_id);

/*
사원과 부서 모두를 기준으로 출력
즉, 부서없는 사원도 출력하고(사번 178인 애) 사원이 없는 부서도 출력한다.
*/
SELECT employee_id, department_name
FROM employees
FULL JOIN departments
USING (department_id); -- 123건
```
