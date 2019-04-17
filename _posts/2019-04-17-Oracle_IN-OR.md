---
layout: post
title: "[Oracle] IN()과 OR의 사용 비교"
---

### 1. IN()을 사용한 경우
```sql
-- 1번 경우
SELECT 'NULL을 찾음'
FROM dual
WHERE NULL IN(NULL, 0, 1, 2);

-- 2번 경우
SELECT '1을 찾음'
FROM dual
WHERE 1 IN(NULL, 0, 1, 2);
```
### 2. OR을 사용한 경우
```sql
-- 3번 경우
SELECT 'NULL을 찾음'
FROM dual
WHERE NULL = NULL OR NULL = 0 OR NULL = 1 OR NULL = 2;

-- 4번 경우
SELECT '1을 찾음'
FROM dual
WHERE 1 = NULL OR 1 = 0 OR 1 = 1 OR 1 = 2;

```
### 3. 차이점
비교 대상이 NULL인 경우(1, 3번 경우) `NULL`값이 있음에도 못 찾는다. 하지만 비교 대상이 `NULL`이 아닌 경우(2번, 4번 경우) 잘 찾는다. 이렇게 비교 대상의 값이 `NULL`인 경우는 IN연산자로 비교하면 안된다. 이런 경우는 `IS`연산자를 사용해야한다.

```sql
SELECT 'NULL을 찾음'
FROM dual
WHERE NULL IS NULL OR NULL = 0 OR NULL = 1 OR NULL = 2;
```

### 4. 예제를 통한 실습
- 틀린 예시 (부서 없는 사원은 나타나지 않는다.)
```sql
-- 사원 중 부서ID가 30, 90, 부서없는 사원들을 모두 출력하시오.
SELECT employee_id, department_id
FROM employees
WHERE department_id IN (30, 90, NULL);
```

- 정답
```sql
-- 사원 중 부서ID가 30, 90, 부서없는 사원들을 모두 출력하시오.
SELECT employee_id, department_id
FROM employees
WHERE department_id = 30 OR department_id = 90 OR department_id IS NULL;
```