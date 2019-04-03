---
layout: post
title: "[Java] Static 변수와 인스턴스 변수 주의점"
---

### 1. 호출에서 다른점 비교

- ###### 소스 코드를 통한 이해

```java
class A {
	int iv;
	static int sv;
}

public class StaticTest {
	public static void main(String[] args) {
		// System.out.println(A.iv); // 이렇게 사용 못 한다.(객체를 반드시 생성해줘야함)
		System.out.println(A.sv);

		A a1 = new A(); // 객체 생성
		System.out.println(a1.iv); // 0
		System.out.println(a1.sv); // 0; a1.sv에 대하여 warning이 뜬다.(클래스명을 직접 입력하여 호출하라는 경고)
		a1.iv++;
		a1.sv++;
		System.out.println(a1.iv); // 1
		System.out.println(a1.sv); // 1
		
		A a2 = new A();
		System.out.println(a2.iv); // 0
		System.out.println(a2.sv); // 1
	}
}
```
위와 같이 `a2` 변수를 따로 선언하면(객체를 새로 생성하면) 인스턴스 변수는 새롭게 생성된다. 하지만 `static`변수는 그대로 출력된다. 즉, `static` 변수는 **모든 클래스에서 공유**한다는 것을 알 수 있다.

### 2. Static 주의점
- static 메소드 내에서는 this를 쓸 수 없다.

```java
public class ClassName{
	//인스턴스 필드와 메소드
    int field1;
    void method(){}
    
    // static 필드와 메소드
    static int field2;
    static void method2() {}
    
    static void Method3(){
    	this.field1 = 10; // 컴파일 에러!!
        this.method1(); // 컴파일 에러!!
        
        field2 = 10; // 정상 작동
        method(); // 정상 작동
    }
}
```

- static 변수는 객체를 생성여부에 관계없이 사용할 수 있다.
- 인스턴스 변수는 객체 생성 없이 사용할 수 없다.

```java
public class Calculator {
	String color; // 인스턴스 변수 -> Calculator.color로 사용 불가능
    String double pi = 3.141592; // static 변수 -> Calculator.pi로 사용 가능
}
```