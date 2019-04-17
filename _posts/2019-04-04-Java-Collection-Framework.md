---
layout: post
title: "Java Collection Framework 구성도"
comments: true
categories: Java_DataStructures
---

### 1. 개념
- ###### Collection Framework
 Collection Framework는 다른 말로는 **컨테이너**라고도 부른다. 즉 **값을 담는 그릇**이라는 의미이다. 그런데 그 값의 성격에 따라서 컨테이너의 성격이 조금씩 달라진다. 자바에서는 다양한 상황에서 사용할 수 있는 다양한 컨테이너를 제공하는데 이것을 Collection Framework라고 부른다.

### 2. 구성도

![자바콜렉션프레임워크그림](http://nokbeondev.github.io/img/java-util-collection.gif)

### 3. 중요

![자바콜렉션프레임워크그림중요한것모음](http://nokbeondev.github.io/img/JavaCollectionFramework.png)

- List와 Set 계열의 차이점
	- List는 중복 저장 허용, 순차 저장 허용
	- Set은 중복 저장 불가능, 순차 누적 불가능
	- Map에서는 key는 중복 불가, key는 순차 저장 불가, 값은 중복 허용

- ArrayList와 Vector
	- ArrayList는 Java 1.2부터 제공된다. Vector는 Java 1.0부터 제공된다.
	- ArrayList가 추가, 삭제할 때에 속도가 더 빠르다.
	- ArrayList는 쓰레드에 동기화가 안되어있고 Vector는 쓰레드에 동기화처리가 되어있다. 빠르기가 다른 이유이다.
	- 사용법은 거의 비슷하고 메소드도 비슷하다.

- HashMap과 HashTable
	- HashMap은 Java 1.2부터 제공되고 HashTable은 Java 1.0부터 제공된다.
	- HashMap은 쓰레드에 동기화가 안되어있고 HashTable은 쓰레드에 동기화처리가 되어있어서 HashMap이 더 빠르다.

- System.out.println(input);
	- input의 **toString()메소드가 자동호출** 된다.(단, input 이 **참조형**인 경우에 한 함)

- 예제 소스를 통한 이해(ArrayList와 HashSet)

```java
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;

public class CollectionTest {
	static void test(Collection c ) {
		c.add(new String("hello"));
		c.add(new Integer(2));
		c.add(new Boolean(false));
		c.add(new Integer(2));
		System.out.println("요소개수 : " + c.size());
		System.out.println(c);
	}
	
	public static void main(String[] args) {
		System.out.println("ArrayList에 저장");
		Collection c = new ArrayList();
		test(c);
		System.out.println("---------------------------");
		System.out.println("HashSet에 저장");
		c = new HashSet();
		test(c);
	}
}
```

	//출력
	ArrayList에 저장
	요소개수 : 4
	[hello, 2, false, 2] // 순서대로 저장
	---------------------------
	HashSet에 저장
	요소개수 : 3
	[2, false, hello] // 순서 없이 저장

### 4. 출처
Java Collection Framework - 생활코딩
[https://opentutorials.org/course/1223/6446](https://opentutorials.org/course/1223/6446)