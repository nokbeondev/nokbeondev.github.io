---
layout: post
title: "[Ruby] 연산자"
comments: true
categories: Ruby
---

### 1. 개념

연산자란, 특정한 작업을 하기 위해서 사용하는 기호이다.

- 대입 연산자
- 산술 연산자
- 비교 연산자
- 논리 연산자

### 2. 각 연산자의 역할

1) 대입 연산자

	a = 1

변수에 값을 집어 넣기 위해 대입 연산자인 `=`을 쓴다.


2) 산술 연산자

- `+`
'a' + "b" #=> 'ab'
1 + 2 #=> 3

- `-`
1 - 2 #=> -1

- `*`
4 * 2.1 #=> 8.4
[1, 'h'] * 2 #=> [1, "h", 1, "h"]

- `**`
4`**`2 #=> 16

- `/`
5 / 2 #=> 2
11.0 / 3.0 #=> 3.66666666666666665 (정수와 실수를 구분한다)

- `%`
5 % 3 #=> 2

3) 비교 연산자

- a == b
같으면 true, 다르면 false

주의 : 'a'와 "a"는 같다. 따라서 'a' == "a" #=> true

그 밖에,

- `!=`, `<`, `>`, `<=`, `>=`, `&&`, `||`, `!`는 모두 `Java`와 동일






