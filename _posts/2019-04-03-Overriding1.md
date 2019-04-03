---
layout: post
title: "[Java] 오버라이딩 예시1"
---

### 1. 오버라이딩을 통해 소스 코드 줄이기
```java
package inheritance;

class Shape {
	double area;

	void calcArea() {} // 구현하지 않은 메소드는 자식 클래스에서 구현하라는 의도
	void printInfo() {}
}

class Rectangle extends Shape {
	int width;
	int height;
//	double area;

	Rectangle() {

	}

	Rectangle(int width, int height) {
		this.width = width;
		this.height = height;
	}

	Rectangle(int size) {
		// this.width = size;
		// this.height = size;
		this(size, size);
	}

	void calcArea() { // 부모 메소드를 자식 쪽에서 재정의(오버라이딩)
		area = width * height;
	}

	void printInfo() {
		System.out.println("가로 : " + width + ", 세로 : " + height + ", 사각형 면적 : " + area);
	}
}

class Circle extends Shape {
	int radius;
//	double area;

	Circle(int radius) {
		this.radius = radius;
	}

	void calcArea() {
		area = Math.PI * Math.pow(radius, 2); // 원의 넓이
	}

	void printInfo() {
		System.out.println("반지름 : " + radius + ", 원의 면적 : " + area);
	}
}

public class ShapeTest {
	public static void main(String[] args) {
		Shape[] arr = new Shape[3];
		
		Rectangle r1, r2;
		r1 = new Rectangle(3, 4);
		arr[0] = r1; // 자식 타입의 객체가 부모 타입의 객체로 대입 -> 업 캐스팅
		r1.calcArea();
		r1.printInfo();

		r2 = new Rectangle(5);
		arr[1] = r2;
		r2.calcArea();
		r2.printInfo();

		Circle c1;
		c1 = new Circle(2);
		arr[2] = c1;
		c1.calcArea();
		c1.printInfo();	
	}
}
```
- 오버라이딩을 알고 있다면 구현 부분의 코드를 줄일 수 있다.

```java
	Rectangle r1, r2;
	r1 = new Rectangle(3, 4);
	arr[0] = r1; // 자식 타입의 객체가 부모 타입의 객체로 대입 -> 업 캐스팅
	r1.calcArea();
	r1.printInfo();

	r2 = new Rectangle(5);
	arr[1] = r2;
	r2.calcArea();
	r2.printInfo();

	Circle c1;
	c1 = new Circle(2);
	arr[2] = c1;
	c1.calcArea();
	c1.printInfo();
```
- 위의 부분을 아래 처럼 바꿀 수 있다.
- 아래의 calcArea(), printInfo()는 각 인덱스에 대입된 객체에 따라서 바뀐다. 대입된 객체 안에 구현된 해당 메소드의 내용으로 작동한다.

```java
	for(int i = 0; i < arr.length; i++) {
		arr[i].calcArea(); // 각 인덱스에 대입된 객체에 따라서 각각 오버라이딩 된 메소드가 호출이 될 것이다.
		arr[i].printInfo();
	}
```
- 결과는 아래와 같이 나온다.

		가로 : 3, 세로 : 4, 사각형 면적 : 12.0
		가로 : 5, 세로 : 5, 사각형 면적 : 25.0
		반지름 : 2, 원의 면적 : 12.566370614359172