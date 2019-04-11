---
layout: post
title: "[Java] Thread의 주요 메소드"
---

### 1. synchronized()
**공유객체**의 안정성을 보장하기 위해 쓰인다. (공유 객체가 아닌 다른 스레드와는 안정성 보장 못한다.)

### 2. wait()
**공유객체**를 사용하는 스레드를 일시 중지

### 3. notify()
지금 사용 중인 공유 객체에 의해서 일시 중지된 스레드 중 **하나**를 깨워준다.

### 4. notifyAll()
사용 중인 공유 객체에 의해 일시 중지된 **모든** 스레드를 깨운다. (단, 가장 먼저 wait된 스레드부터 깨운다. 큐 구조로 관리되기 때문)

### 5. 소스 코드 예제
- 공유 객체
```java
public class Share2 {
	int v;

	Share2() {
	}

	public void plus() {
		for (int i = 0; i < 10; i++) {
			synchronized (this) {// 동기화 처리하면 다른 객체에게 CPU를 뺏기지 않는다. 
								 //매개변수로 공유객체를 받는다
				this.notify(); //wait()를 풀어주는 메소드                 
				System.out.print(" before plus v = " + v);
				v++;
				System.out.println(", after plus v = " + v);
			}
		}
	}

	public 
	void minus() {
		for (int i = 0; i < 10; i++) {
			synchronized (this) {// 동기화 처리하면 다른 객체에게 CPU를 뺏기지 않는다. 
								 //매개변수로 공유객체를 받는다
				if(v == 0) {
					try {
						this.wait(); // 공유 객체를 사용하는 스레드를 일시 중지
					}catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
				System.out.print(" before minus v = " + v);
				v--;
				System.out.println(", after minus v = " + v);
			}
		}
	}
}
```
- 스레드 상속 받은 A 클래스
```java
public class A extends Thread {
	Share2 s = new Share2();

	A() {
	}

	A(Share2 s) {
		this.s = s;
	}

	public void run() {
		for (int i = 0; i < 10; i++)
			s.plus();
	}
}
```
- 스레드 상속 받은 B 클래스
```java
public class B extends Thread {
	Share2 s = new Share2();

	B() {
	}

	B(Share2 s) {
		this.s = s;
	}

	public void run() {
		for (int i = 0; i < 10; i++)
			s.minus();
	}
}
```
- 테스트 클래스
```java
public class ShareTest {
	public static void main(String[] args) {
		Share2 s = new Share2();
		A a = new A(s);
		B b = new B(s);
		a.start();
		b.start();
	}
}
```
