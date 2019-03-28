---
layout: post
title: "[Java] 향상된 for문"
---

### 1. 목적 및 특징
 - 자바 5부터 배열 및 컬렉션 객체를 좀 더 쉽게 처리할 목적으로 향상된 for문을 제공한다.
 - 향상된 for문은 반복 실행을 하기 위해 카운터 변수와 증감식을 사용하지 않는다.
 - 배열 및 컬렉션 항목의 개수만큼 반복하고 자동적으로 for문을 빠져나간다.
 - **표현**, **처리 속도** 면에서 향상
 - 무조건 **전체 요소 반복** 시에만 사용한다. (부분적 반복은 안된다.)

### 2. 사용법 및 작동 원리
 - 사용 예시
```java
int[] scores = {50,60,34,65,45};
int sum = 0;
for(int sc : scores){
	sum = sum + sc;
}
```
![향상된 for문](http://nokbeondev.github.io/img/EnhancedLoop.png)