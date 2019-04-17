---
layout: post
title: "[Oracle] 기초 문법 실습 예제"
---

### 1. 기초 예제
- 주의점 : `LIKE`는 패턴(`%`, `_` 등)을 써야하기 때문에 처리 속도가 떨어진다. 가급적 **함수를 사용하는 것이 낫다.**

```sql
-- 2019-04-16 실습
/* 
1. 급여가 10000이거나  14000인 사원들의 사번, 이름(first_name), 급여를 검색하시오.
*/
SELECT employee_id, first_name, salary
FROM employees
WHERE salary IN (10000, 14000);

/*
2. first_name에 대소문자구별없이('e', 'E')를 포함하는 모든 사원을 검색하시오.
*/
SELECT employee_id, first_name
FROM employees
WHERE UPPER(first_name) LIKE '%E%';

/*
3. first_name이 'J’로 시작하고 n문자를 포함하는 사원의 사번, 이름을 검색하시오.
예)
사번 	이름
---------------------
110 John
139 John
145 John
181 Jean
189 Jennifer
200 Jennifer
---------------------
*/
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'J%n%';

/*
4. 사원의 first_name의 3번째~4번째 문자가 'an'인 사원들을 출력하시오.
(LIKE연산자를 이용)
(LIKE연산자를 이용안함:INSTR함수를 이용)
(SUBSTR함수이용)
*/
-- (LIKE연산자를 이용) -- LIKE는 처리속도가 가장 떨어지므로 권장하지 않는다.
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE '__an%';

-- (LIKE연산자를 이용안함:INSTR함수를 이용)
SELECT employee_id, first_name
FROM employees
WHERE INSTR(first_name, 'an') = 3;

-- (SUBSTR함수이용)
SELECT employee_id, first_name
FROM employees
WHERE SUBSTR(first_name, 3, 2) = 'an';

/*
5.급여가 10000이상인 사원의 사번, 부서번호, 이름, 급여, 수당을 출력하시오.단, 부서번호가 30번부서이거나 90번인 사원만 검색한다.
*/
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE (salary >= 10000) AND department_id IN('30', '90');

/*
6.급여가 10000이상인 사원의 사번, 부서번호, 이름, 급여, 수당을 출력하시오.단, 부서번호가 30번,60번, 90번인 부서는 제외하고 사원을 검색한다.
*/
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE (salary >= 10000) AND department_id NOT IN('30', '60', '90');

/*
7. 각 사원의 사번과 근무년수를 출력하시오. 단, 근무년수는 소숫점이하자리는 버리고 장기 근속자부터 출력하시오.
*/
SELECT employee_id, TRUNC((SYSDATE - hire_date) / 365) "근무년수"
FROM employees
ORDER BY 근무년수 DESC;

/*
8.사원의 사번, 이름, 관리자번호(manager_id),  관리자여부를 출력하시오.
 관리자여부란, 관리자가 있는 사원은 ‘관리자있음’으로, 관리자가 없는 사원은 ‘관리자없음’으로 출력한다
*/
SELECT employee_id, first_name, manager_id, NVL2(manager_id, '관리자 있음', '관리자 없음')
FROM employees;

/*
9. 오늘 날짜 기준 각자의 생후일수를 출력하시오.
*/
SELECT ROUND(SYSDATE - TO_DATE('90/07/22'))
FROM dual;

/*
10. 각자의 출생일자에 해당하는 요일을 출력하시오.
*/
SELECT TO_CHAR(TO_DATE('90/07/22'), 'DAY')
FROM dual;
```