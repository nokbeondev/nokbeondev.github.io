---
layout: post
title: "[Oracle] 기초 문법 2 - NVL(), DISTINCT"
comments: true
categories: Oracle
---

### 1. NVL()의 개념과 예제

NVL(a, b) 함수 : a값(첫 번째 인자값)이 `null`이면 b를 반환한다. a가 `null`이 아니면 a를 반환한다.
```sql
SELECT employee_id 사번,
    salary 급여,
    commission_pct 수당,
    (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) 총급여
FROM employees;
```

### 2. DISTINCT의 개념과 예제
DISTINCT는 바로 다음에 오는 컬럼만 인식하여 그 컬럼이 중복되는 것을 막는다.

```sql
/*
사원들의 부서ID를 출력하시오.
단, 부서ID를 중복없이 출력하시오. - distinct
*/
SELECT distinct department_id
FROM employees;

/*
사원들의 부서ID, 업무ID를 출력하시오(107건)
*/
SELECT DISTINCT department_id, job_id
FROM employees;
```













