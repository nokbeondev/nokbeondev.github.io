---
layout: post
title: "[JSP] Servlet과 JSP에서의 Request와 Response"
comments: true
categories: Web
---

### 1. 순서

- 사용자(프로그래머, 스마트폰, 컴퓨터, 기타 응용프로그램 등)로부터 요청을 `Servlet`으로 보냄
- Servlet에서 DAO 클래스 호출 (Ex. `CustomerDAOOracle`, `ProductDAOOracle`...)
- DAO 클래스에서 Servlet으로 결과 정보 반환
- DAO에서부터 온 반환 내용으로 응답할 결과를 만들라고 JSP에게 시킴
- JSP는 Servlet의 지시 대로 응답 내용 작성
- JSP가 응답내용 사용자에게 반환

### 2. 프로세스 상세 내용

![전체프로세스그림1](http://nokbeondev.github.io/img/JSP_WholeProcess1.JPG)

- Servlet에서 JSP에게 정보를 보내는 과정**(별표 부분)**
서블릿의 응답 결과를 `HttpServlet`의 `Request`의 `attribute`에 저장한다. 이 때 `request.setAttribute("obj 별칭", obj)` 메소드를 사용한다. `Request`가 가지고 있는 요소 중에 `param`도 있고 `attrbute`도 있다. `attribute`에 저장하여 JSP에게 보내는 이유는 다음과 같다.
`Reqeust`의 `attribute`와 `param`은 `Map`자료구조 형태이다. 당연히 둘 다 `key`와 `value`를 갖는다. 여기서 `param`은 `value`값에 **`String`만을 저장**할 수 있다. 또한 **SET 메소드가 없어서 개발자가 `param`의 값을 설정할 수 없다.**