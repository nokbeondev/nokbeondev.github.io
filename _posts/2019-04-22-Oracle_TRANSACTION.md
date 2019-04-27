---
layout: post
title: "[Oracle] 트랜젝션 개념과 Database 관계"
comments: true
categories: Oracle
---

### 1. 개념과 기본적인 용어들
트랜젝션이란 작업 단위를 의미한다. 그리고 이를 이해하기 위해 네 가지 특성을 알아야한다. 아래와 같다.

- 트랜젝션의 네 가지 특성
	- 원자성
	- 일관성
	- 고립성(독립성)
	- 지속성

### 2. DB의 내용이 변경되는 시기

![트랜젝션설명그림](https://nokbeondev.github.io/img/Oracle_transaction.JPG)

위의 그림처럼 프로그래머 A가 sqldeveloper 혹은 sqlplus를 통해 세션에서 작업을 할 때, 실제 DB에 있는 정보를 추가, 수정, 삭제하는 것이 아니다. 그 DB의 스냅샷을 조작한 것이라고 생각하면 된다. (sqldeveloper, sqlplus 등의 조작 환경을 세션이라고 한다.)

예를 들어 자세히 살펴보면 아래와 같다.
- 서로 다른 두 세션이 있다
-> A는 sqlplus로 작업했다(DML 작업)
-> 그 후 B가 sqldeveloper로 A가 작업한 테이블을 SELECT으로 출력했다.
-> No Rows Selected! 라는 문구가 나올 것이다.
-> DB의 보안성 문제 때문에 여러 사람이 정보 수정을 함부로 하는 것을 막아놨다.(트랜젝션 단위로 Lock이 걸린다.)
-> sqlplus가 닫히거나, 세션에서 COMMIT 혹은 ROLLBACK 명령어를 사용하면 DB를 수정할 수 있다.

위의 경우에서, 결국 A는 DB를 직접 수정한 것이 아닌, DB의 스냅샷을 수정한 것이다. B도 마찬가지로 본인의 스냅샷을 실행한 것이다. 서로 다른 세션에서 작업할 경우 별도의 명령어나 세션의 정상적인 종료 없이 DB를 수정할 수 없다.

- DB의 수정 시기
	- sqlplus 닫힐 때
	- COMMIT 명령어 사용
	- ROLLBACK 명령어 사용


### 3. 트랜젝션 관점에서 DDL과 DML의 차이
- DDL : 트랜젝션이 자동으로 완료된다.
- DML : 트랜젝션을 수동으로 완료시켜야 한다.