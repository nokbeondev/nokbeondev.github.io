---
layout: post
title: "[JSP] Request와 Response 간의 전체적인 프로세스"
comments: true
categories: JSP_basic
---

### 1. 순서

- 사용자(프로그래머, 스마트폰, 컴퓨터, 기타 응용프로그램 등)로부터 요청을 Servlet으로 보냄
- Servlet에서 DAO 클래스 호출 (Ex. CustomerDAOOracle, ProductDAOOracle...)
- DAO 클래스에서 Servlet으로 결과 정보 반환
- DAO에서부터 온 반환 내용으로 응답할 결과를 만들라고 JSP에게 시킴
- JSP는 Servlet의 지시 대로 응답 내용 작성
- JSP가 응답내용 사용자에게 반환

### 2. 프로세스 상세 내용
