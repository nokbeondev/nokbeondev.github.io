---
layout: post
title: "[Java] 배열에서 그냥 지나치면 안되는 점"
---

### 1. 선언

- 배열은 **선언부**와 **생성부**가 있다.
 - 선언은 두 종료가 있는데 1번 방식이 컴파일 속도 면에서 미세하게 빠르다.
```java
타입[] 변수; // 1번 방식
```
```java
타입 변수[]; // 2번 방식
```
 - 참조할 배열 객체가 없으면 배열 변수는 `null` 값으로 초기화될 수 있다.
```java
타입[] 변수 = null; // 이 때, 변수에는 쓰레기 값이 들어간다.
```

### 2. 초기화
- 타입별 배열의 초기값
 - 기본 타입 (정수)
   - byte[] : 0
   - char[] : '\u0000' (유니코드로 null을 의미, char는 참조형이 아니라 Java의 null을 못 씀)
   - short[] : 0
   - int[] : 0
   - long[] : 0L
 - 기본 타입 (실수)
   - float[] : 0.0F
   - double[] : 0.0
 - 기본 타입 (논리)
   - boolean[] : false
 - 참조 타입
   - 클래스[] : null
   - 인터페이스[] : null

### 3. 다차원 배열에서 길이
- `length`를 이용한 길이에서 주의점
```java
int[][] scores = new int[2][3];
int len1 = scores.length;
int len2 = scores[0].length;
int len3 = scores[1].length;
System.out.println(len1); // 2가 출력된다.
System.out.println(len2); // 3이 출력된다.
System.out.println(len3); // 3이 출력된다.
```