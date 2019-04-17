---
layout: post
title: "[Java] Up-Casting과 Down-Casting 그리고 instanceof 연산자"
comments: true
categories: Java
---

### 1. Up-Casting의 개념과 가능한 경우
자식 타입의 객체가 생성되어서 부모 타입으로 변경되는 것. 바로 위의 부모가 아니더라도 **상속 계층에서 상위 타입**이라면 Up-Casting이 일어날 수 있다.

### 2. Down-Casting
부모 타입을 자식 타입으로 변환하는 것. 그렇다고 모든 부모 타입을 자식 클래스 타입으로 변환할 수 있는 것은 아니다. 자식 타입이 부모 타입으로 자동 변환한 후, 다시 자식 타입으로 변환할 때 강제 타입 변환을 사용할 수 있다.

- Up-Casting된 것만 Down-Casting 할 수 있다.
		자식 클래스 변수 = (자식 클래스) 부모 클래스 타입;
        								(자식 타입이 부모 타입으로 변환된 상태)
                                        
### 3. instanceof 연산자
아래와 같이 사용하며, 어떤 객체가 어떤 클래스의 인스턴스인지 확인할 때에 쓰인다.

```java
boolean result = 객체 instanceof 타입
```