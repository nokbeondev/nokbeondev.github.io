---
layout: post
title: "[JSP] JSP 요청 프로세스"
comments: true
categories: JSP_basic
---

### 1. 요청 프로세스

![요청프로세스그림](https://nokbeondev.github.io/img/JSP_requestProcess.JPG)

JSP에서 어떤 명령이 요청되면 먼저 해당 jsp의 클래스파일을 찾는다. 없다면 해당 java파일을 찾는다. 이 마저도 없으면 해당 프로젝트의 경로에 새롭게 생성한다. 나머지는 위의 그림과 같다.

