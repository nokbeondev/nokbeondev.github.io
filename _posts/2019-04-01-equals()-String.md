---
layout: post
title: "[Java] String 비교시 주의점 - equals()와 == 연산자"
---

### 1. equals()와 ==의 차이점

- ###### 기본적으로 이 둘 모두 좌우의 값을 비교하고 boolean으로 반환한다.
- ###### 차이점
	1) 비교하는 대상이 다르다.
    `equals()`는 비교하는 **대상의 내용 자체**를 비교하지만, `==` 연산자는 비교하고자 하는 대상의 **주소값**을 비교한다.
    ```java
    	String a = "aaa";
        String b = a;
        String c = new String("aaa");
    ```
    a, b, c 모두 "aaa"라는 내용이지만 **주소값**은 다르다.
	![String의equals](http://nokbeondev.github.io/img/String-equals-picture.PNG)
    아래는 출력값이다.
    ```java
    	System.out.println(a.equals(b)); // true
        System.out.println(a==b); // true
        System.out.println(a==c); // false
        System.out.println(a.equals(c)); // true
        System.out.println(b.equals(c)); // ture
        System.out.println(b==c); // false
    ```
    
