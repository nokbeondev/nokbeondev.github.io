---
layout: post
title: "[Servlet] Servlet API 2.5 버전의 체계 표준"
comments: true
categories: Web
---

### 1. Servlet 체계 표준이 필요한 이유
Tomcat, 레진, 웹로직, 제우스 등 다양한 서버 제공 업체가 존재한다. 하지만 서로 체계가 다르다. 따라서 개발자 입장에서 다양한 서비스를 쉽게 이용하기 위해서는 배포되는 디렉토리 구조 정도는 똑같아야한다. 루트 기준으로 내부 구조를 같게 형성하기 위한 약속이 존재한다.

- WEB-INF
	- web.xml
	- lib
	- classes
		- control
		- ...
		- ...

위와 같은 체계 표준이 약속으로 정해져있다. 위의 예시는 Servlet API 2.5 버전의 체계 표준이다. 3.0 이상 버전에서는 @(annotation)으로 표기한다.