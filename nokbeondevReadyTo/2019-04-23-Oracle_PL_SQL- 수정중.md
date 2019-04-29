---
layout: post
title: "[Oracle] PL/SQL"
comments: true
categories: Oracle
---

### 1. 개념
본래 SQL이란 부조화된 질의언어이다. 여기에 **절차적 언어의 요소**를 더하여 데이터의 처리를 좀 더 향상시킨 기능이 PL/SQL(Procedural Language extension to SQL)이다.

### 2. PL/SQL의 구성
- DECLARE PART(선언부) : PL/SQL에서 모든 변수, 상수, 커서 등을 선언하는 부분
- BEGIN PART(실행부) : SQL에 선택처리, 반복처리 등을 포함한실제로직이 표현되는 부분
- EXCEPTOPN PART(예외 처리부) : 실행부의 로직의 처리 중 에러 또는 비정상적인 상황이 발생할 경우 이를 처리하기 위한 작업을 기술하는 부분

### 3. 변수

- 스칼라 타입 변수
| TYPE | 설 명 |
|--------|--------|
|   NUMBER   |   정수나 실수     |
|   CHAR     |   고정길이의 문자  |
|   VATCHAR2 |   가변길이의 문자  |
|   DATE     |   날짜와 시간     |
|   BOOLEAN  |   TRUE, FLASE 값 |

- 참조 타입 변수
| TYPE | 설 명 |
|--------|--------|
|   %TYPE     |   특정 컬럼의 데이터 타입 참조 |
|   %ROWTYPE  |   특정 행의 데이터 타입 참조   |

- 예제 코드
	- 주의점 : 오라클의 '같다' 연산은 `=`, 대입 연산자는 `:=`

```sql
SET SERVEROUTPUT ON; -- sqlplus 명령어 : DBMS 출력 설정
DECLARE 
    num1 NUMBER;
    str VARCHAR2(10);
BEGIN 
    num1 := 9;
    str := 'HELLO';
    DBMS_OUTPUT.put_line('num1=' || num1);
END;
```


### 4. 선택 처리문

