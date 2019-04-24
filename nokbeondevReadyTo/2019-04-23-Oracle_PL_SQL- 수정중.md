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

