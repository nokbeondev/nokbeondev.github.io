---
layout: post
title: "[Java] String 클래스 선언 시 처리 순서"
comments: true
categories: Java
---

### 1. 소스 코드 예시를 통한 이해
```java
String s1, s2, s3, s4;
s1 = new String("KITRI");
s2 = new String("KITRI");
s3 = "KITRI";
s4 = "KITRI";
```
- 위의 소스 코드는 아래와 같이 작동한다.

![String작동그림](http://nokbeondev.github.io/img/StringClassOperate.JPG)

- 변수 s1과 s2는 **서로 다른 객체**를 가리킨다. 이 둘은 각각의 객체가 생성되고 그 생성된 객체들은 다른 장소에 있는 문자열을 참조한다. 반면 s3, s4는 미리 생성된 문자열을 참조하는 객체를 가리킨다. 즉, 두 방법은 확연히 다르다.