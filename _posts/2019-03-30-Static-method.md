---
layout: post
title: "[Java] 정적 멤버와 static"
comments: true
categories: Java
---

### 1. 저장되는 장소
- static 변수는 class 영역(JVM 영역)에 저장
	**(Static 변수는 class 영역(JVM 영역)에 저장되어서 프로그램이 종료될 때까지 메모리를 차지한다.)**
- non-static 변수는 Heap 영역에 저장

### 2. 초기화 시점
- static 변수 : **클래스 로드 후** 자동 초기화
- non static 변수 : **객체 생성 시** 자동 초기화

### 3. 호출 예시
```java
	public class CallByMethod{
    	public static void a(){        
        };
        public void b(){
        };
        public static void main(String[] args){
        	a(); // static 끼리 호출 가능
            CallByMethod test = new CallByMethod();
            test.b(); // b()는 객체 생성 후 호출
        }
    }
```
- ###### static 메소드는 static 메소드만 호출 가능