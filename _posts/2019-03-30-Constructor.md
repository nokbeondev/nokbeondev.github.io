---
layout: post
title: "[Java] 생성자"
comments: true
categories: Java
---

### 1. 개념
생성자는 `new` 연산자와 같이 사용되어, 클래스로부터 객체를 생성할 때 호출되어 객체의 초기화를 담당한다. `new` 연산자에 의해 생성자가 성공적으로 실행되면 Heap 영역에 객체가 생성되고 객체의 주소가 리턴된다.

- Java에서 생성자와 관련된 특징
	1) 자바에는 소멸자가 없다.
    2) 클래스 선언 시 기본 생성자가 자동 생성되고, 개발자가 생성자를 명시하면, 기본 생성자는 사라진다.

### 2. 다른 생성자 호출(this())
- 생성자 오버로딩이 많아지면 생성자 간의 중복된 코드가 발생할 수 있다. 이런 경우에 필드 초기화 내용은 한 생성자에만 집중적으로 작성하고 나머지 생성자는 초기화 내용을 가지고 있는 생성자를 호출하는 방법으로 개선할 수 있다.
- 아래 예시 소스 코드 참고
	1) this()를 사용하지 않는 경우 (중복 코드)
```java
	Car(String model){ // 중복 코드
    	this.model = model;
        this.color = "은색";
        this.maxSpeed = 250;
    }
    Car(String model, String color){ // 중복 코드
    	this.model = model;
        this.color = color;
        this.maxSpeed = 250;    
    }
    Car(String model, String color, int maxSpeed){ // 중복 코드
    	this.model = model;
        this.color = color;
        this.maxSpeed = maxSpeed;
    }
```
	2) this()사용하여 중복 코드를 줄인다.    
```java
public class Car{
	// 필드
	String company = "아우디 자동차";
    String model;
    String color;
    int maxSpeed;
    // 생성자
    Car(){
    }
    Car(String model){
    	this(model, " 은색", 250);
    }
    Car(String model, String color){
    	this(model, color, 250);
    }
    Car(String model, String color, int maxSpeed){
    	this.model - model;
        this.color = color;
        this.maxSpeed = maxSpeed;
    }
}
```


