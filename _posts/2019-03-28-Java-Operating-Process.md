---
layout: post
title: "[Java] java가 작동하는 원리"
comments: true
categories: Java
---

### 1. 작동 순서
	1) OOO.class 파일을 bin 폴더에서 찾는다.
    2) 바이트 코드 검증
    3) JVM에 로딩
    4) 인터프리트(0과 1로 재해석하는 단계) -> Class 영역에 저장
    5) 0과 1로 재해석된(인터프리트 된) 클래스 및 메서드, static 변수들 자동 초기화
    6) OOO 클래스의 main메소드를 자동호출(JVM에 의해)
    
### 2. 메모리 영역
![Java 메모리 영역](http://nokbeondev.github.io/img/Java-Memory.jfif)

- Class 영역
	- 클래스들이 선언되어 있다.
- Stack 영역(JVM 영역)
	- 메서드 내에 선언한 변수들이 저장되어 있다.(지역 변수, 매개 변수 등)
	- main 메서드가 호출되어야 Stack 영역에 쌓인다.
- Heap 영역
	- 객체가 생성되는 곳 (맴버 변수, 맴버 메서드 등)
	- **객체 생성과 동시**에 맴버 변수들 자동 **초기화**
	- 매서드의 **내용**까지는 객체 내에 **저장되지 않음**
	- 매서드의 **선언 부분**만 **Heap에 저장**
	- `new`를 사용하여 Heap에 객체 생성