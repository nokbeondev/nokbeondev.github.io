---
layout: post
title: "[Java] private과 상속"
---

### 1. private 접근 제한자와 상속
```java
class A{
	int iv = 1;
	private int ia = 2; // 이런 경우 자식 클래스로 상속은 된다. 하지만 자식 클래스에서는 접근할 수 없다.
    public int getIa(){
    	return ia;
    }
    
}

class B extends A{
	int iv = 3;
	int ib = 4;
	void b() {
		System.out.println("b() 입니다.");
		System.out.println(iv + ", " + ib);
		System.out.println(ia); // 컴파일 에러!!
        System.out.println(getIa()); // 이렇게 Getter로 접근 가능!
	}
}

public class VariableTest {
	public static void main(String[] args) {
		B b = new B();
		System.out.println(b.ia); // 컴파일 에러!!
		System.out.println(b.ib);
		System.out.println(b.iv);

		A a = new A();
		System.out.println(a.ia); // 컴파일 에러!!
		System.out.println(a.iv);
		
	}
}
```
