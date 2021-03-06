---
layout: post
title: "[Oracle] 기본 용어"
comments: true
categories: Oracle
---

### 1. Database가 관리되는 원리
다음과 같은 sqlplus, sql developer 등과 같은 툴을 이용하여 DB를 관리할 수 있다.
![DB관리원리그림](https://nokbeondev.github.io/img/Oracle_basic1.PNG)

### 2. 간단한 용어 정리
- SQL : 데이터베이스에서 데이터를 추가, 삭제, 관리하기 위해 만든 표준화된 언어

- SQL 문법 종류
	- query : 데이터 조회
	- DML : 데이터 조작어(추가, 수정, 삭제)
	- DDL : 데이터 정의어(객체 생성, 구조 변경, 객체 삭제)
	- DTL : 트랜잭션 완료, 복구하는데에 사용되는 명령어
	- DCL : 관리자 입장에서 계정을 추가, 변경, 삭제하는 명령어

- 객체의 종류
	- 테이블
	- 뷰
	- 인덱스
	- 시퀀스

- 스키마 : 객체들의 집합
- 계정 : 스키마들의 집합 **(단, 오라클은 계정별 스키마를 1개만 갖는다)**








