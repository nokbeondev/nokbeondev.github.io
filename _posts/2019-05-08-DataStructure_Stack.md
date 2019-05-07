---
layout: post
title: "[자료구조] Stack"
comments: true
categories: Java_DataStructures
---

### 1. 개념
맨 마지막에 들어간 요소가 처음 나오는 구조이다. 프링글스 과자 통을 상상하면 된다.

### 2. 구현 (Java)

```java
import java.util.EmptyStackException;

class Stack<T>{
	class Node<T>{
		private T data;
		private Node<T> next;

		public Node(T data){
			this.data = data;
		}
	}

	private Node<T> top;

	public T pop(){
		if(top==null){
			throw new EmptyStackException();
		}

		T item = top.data;
		top = top.next;
		return item;
	}

	public void push(T item){
		Node<T> t = new Node<T>(item);
		t.next = top;
		top = t;
	}

	public T peek(){
		if(top == null){
			throw new EmptyStackException();
		}
		return top.data;
	}

	public boolean isEmpty(){
		return top == null;
	}
}

public class Test {
	public static void main(String[] args){
		Stack<Integer> s = new Stack<Integer>();
		s.push(1);
		s.push(2);
		s.push(3);
		s.push(4);
		System.out.println(s.pop());
		System.out.println(s.pop());
		System.out.println(s.peek());
		System.out.println(s.pop());
		System.out.println(s.isEmpty());
		System.out.println(s.pop());
		System.out.println(s.isEmpty());
	}
}
```
위 `Stack`을 구현하고 테스트한 결과는 아래와 같다.

	4
    3
    2
    2
    false
    1
    true
