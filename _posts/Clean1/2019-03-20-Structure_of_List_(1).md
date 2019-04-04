---
layout: post
title: "Structure of List (1) - 정적배열, 동적배열"
---

### 1. 정적 배열
- ###### 배열의 시간 복잡도(배열 크기 N, 인덱스 넘버를 무조건적으로 활용할 경우)
 - ###### 검색
일반적으로 O(1)로 최적의 효율 주소값을 몰라도 인덱스 넘버로 한 번에 접근 가능하기 때문.

 - ###### 갱신
일반적으로 O(1)로 최적의 효율

 - ###### 삽입
삽입하는데 걸리는 시간은 O(1)이지만, 삽입 시 이미 있던 데이터를 전부 밀어야함. 즉, O(n)

 - ###### 삭제
삭제하는데 걸리는 시간은 O(1)이지만, 삭제 시 이미 있던 데이터를 전부 밀어야함. 즉, O(n)

- ###### 인덱스 넘버를 활용할 수 없는 경우에는 검색과 갱신의 시간복잡도 O(n)


### 2. 동적 배열
- ###### Java에는 ArrayList라는 자료구조가 있다.
- ###### 배열의 크기를 한 번 정하면 프로그래밍 중에 수정할 수 없는 정적배열의 한계를 극복
- ###### List는 메모리가 허용하는 한 계속해서 배열의 크기를 변경할 수 있다.
- ###### 사용법
 - ###### 생성
ArrayList를 사용하려면 먼저 ArrayList 객체를 만들어야함.
```java
ArrayList<Integer> numbers = new ArrayList<>();
```
ArrayList는 `java.util.ArrayList`에 포함되어 있으므로 먼저 `java.util.ArrayList`를 Import
```java
import java.util.ArrayList;
```

 - ###### 추가
맨 뒤에 하나씩 추가하는 방법
```java
numbers.add(10);
numbers.add(20);
numbers.add(30);
```
특정 index에 추가하는 방법
```java
numbers.add(1,50); // 기존에 index = 1에 있던 20부터 뒤로 한 칸씩 밀린다.
```
내부의 배열이 꽉 찼는데 새로운 데이터가 추가되면, 기존 배열보다 2배 긴 새 배열을 만들어 기존 데이터를 새로운 배열로 복제

 - ###### 삭제
특정 index에 위치한 데이터 삭제
```java
numbers.remove(2); // 함수 인풋으로 index
```
 - ###### 가져오기
특정 index에 위치한 엘리먼트 가져올 때, 내부에서 배열을 사용하기 때문에 ArrayList는 매우 빠르게 작동
```java
numbers.get(2); // 인풋은 index
```
 - ###### 반복
ArrayList를 탐색할 때는 Iterator를 사용이다.
Iterator는 객체지향에서 주로 사용하는 반복 기법이다. Iterator를 쓰려면 Iterator객체를 만들어야 한다.
```java
Iterator it<Integer> = numbers.iterator();
```
Iterator 객체로 numbers객체에 저장된 값을 하나씩 순회할 수 있다.
```java
while(it.hasNext()){
	   System.out.println(it.next());
}
```
`it.next()`메소드는 호출될 때마다 엘리먼트를 순서대로 리턴합니다. 만약 더 이상 순회할 엘리먼트가 없다면 `it.hasNext()`는 false를 리턴해 while문은 종료된다. Iterator는 엘리먼트를 삭제/추가할 때도 쓸 수 있다.
```java
while(it.hasNext()){
	   int value = it.next(); // 순차적으로 리턴
       if(value == 30){
       	it.remove();
       }
}
```
`it.remove()`는 `it.next()`를 통해서 반환된 numbers의 엘리먼트를 삭제한다.
아래는 Iterator보다 조금 더 편리하게 엘리먼트를 순회하는 방법이다.
```java
for(int value : numbers){
	   System.out.println(value);
}
```