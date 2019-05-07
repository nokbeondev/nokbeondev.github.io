---
layout: post
title: "[자료구조] Queue"
comments: true
categories: Java_DataStructures
---

### 1. 개념
처음 들어간 요소가 처음으로 나온다. (FIFO : First In First Out)

### 2. 구현 (Java)

```java
import java.util.NoSuchElementException;

class Queue<T>{
	class Node<T>{
		private T data;
		private Node<T> next;

		public Node(T data){
			this.data = data;
		}
	}

	private Node<T> first;
	private Node<T> last;
	
	public void add(T item){
		Node<T> t = new Node<T>(item);

		if(last!=null){
			last.next = t;
		}
		last = t;
		if(first==null){
			first = last;
		}
	}

	public T remove(){
		if(first==null){
			throw new NoSuchElementException();
		}

		T data = first.data;
		first = first.next;
		if(first==null){
			last = null;
		}
		return data;
	}

	public T peek(){
		if(first==null){
			throw new NoSuchElementException();
		}
		return first.data;
	}

	public boolean isEmpty(){
		return first == null;
	}
}

public class Test {
	public static void main(String[] args){
		Queue<Integer> q = new Queue<Integer>();
		q.add(1);
		q.add(2);
		q.add(3);
		q.add(4);
		System.out.println(q.remove());
		System.out.println(q.remove());
		System.out.println(q.peek());
		System.out.println(q.remove());
		System.out.println(q.isEmpty());
		System.out.println(q.remove());
		System.out.println(q.isEmpty());
	}
}
```
위의 구현한 코드를 테스트한 결과는 아래와 같다.

	1
    2
    3
    3
    false
    4
    true


