---
layout: post
title: "[Java] Object 클래스와 메소드"
comments: true
categories: Java
---

### 1. 자바의 최상위 부모 클래스
자바의 모든 클래스는 Object 클래스의 자식이거나 자손 클래스이다. 즉, 자바의 **최상위 부모 클래스**에 해당한다.

- Object 클래스 (최상위)
	- System 클래스
	- String 클래스
	- Number 클래스
		- Integer 클래스
	- 기타 등등...

### 2. 객체 비교
Object 클래스의 `equals()` 메소드는 비교 연산자인 `==`과 동일한 결과를 리턴한다. 두 객체가 동일한 객체라면 `true`를 리턴하고 아니면 `flase`를 리턴한다. (String 클래스의 `equals()` 메소드와 헷갈리면 안된다. Object 클래스의 자식인 String 클래스에서 **재정의**한 것이다.)