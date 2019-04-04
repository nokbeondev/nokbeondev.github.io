---
layout: post
title: "[Java] Singleton 패턴"
---

### 1. 개념
단 하나의 객체만 만들도록 보장해야 하는 경우가 있다. 단 하나만 생성된다고 해서 이 객체를 싱글톤이라고 한다.

### 2. 소스코드 예시
###### Single 클래스
```java
package com.my.util;

public class Single {
	private static Single single1;
	private int iv;
	
	private Single() {
		
	}
	
	public static Single getInstance() {
		if(single1 == null) {
			single1 = new Single();
		}
		return single1;
	}
}
```

###### 구현 클래스
```java
import com.my.util.Single;

public class SingletonTest {
	public static void main(String[] args) {
		Single s, s1, s2;
		s = Single.getInstance();
		s1 = Single.getInstance();
		s2 = Single.getInstance();
		System.out.println(s);  // 결과 : com.my.util.Single@15db9742
		System.out.println(s1); // 결과 : com.my.util.Single@15db9742
		System.out.println(s2); // 결과 : com.my.util.Single@15db9742
	
		s.setIv(99); // 다른 사람이 넣은 정보를 
		System.out.println(s1.getIv()); // 다른 객체로 또 다른 사람이 확인할 수 있다. (결과값으로 99 출력)
		
	}
}
```