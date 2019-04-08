---
layout: post
title: "[Java] Class 클래스"
---

### 1. Class가 필요한 이유
- ###### Java가 동작하는 두 가지 원리
	- Load Time Dynamic Load
		1) A.class 파일 찾기
        2) 바이트 검증
        3) JVM으로 로딩
        4) 0,1로 재해석 (재해석 후 static 변수 초기화)
        5) main() 호출

	- Run Time Dynamic Load
		- 실행 단계에 클래스를 부를 수 있다. 아래는 사용법이다.
```java
Class c = Class.forName(클래스명);
```