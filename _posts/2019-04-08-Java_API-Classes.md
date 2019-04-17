---
layout: post
title: "[Java] 기본 API 클래스 중 중요한 것들"
comments: true
categories: Java
---

### 1. trim()

```java
String tel1 = "   02";
String tel2 = "123   ";
String tel3 = "   1234   ";

String tel = tel1.trim() + tel2.trim() + tel3.trim(); // 공백이 제거된다.
System.out.println(tel);
```
	// 출력
    021231234
    
### 2. 문자열 연결 연산자 `+` 사용시 주의점
`String`과 `int`를 `+` 연산자로 연결하면 연결된 결과는 문자열이다.(`String`이 하나라도 있다면 연결된 모든 값을 `String`으로 인식)
```java
System.out.println(1 + "2"); // "12"가 출력된다.
System.out.println(1 + 2 + "3"); // "123"이 출력된다.
```
