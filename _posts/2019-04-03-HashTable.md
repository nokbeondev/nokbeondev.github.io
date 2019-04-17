---
layout: post
title: "해쉬 테이블(Hash Table)"
comments: true
categories: Java_DataStructures
---

### 1. 개념
	F(key) -> HashCode -> Index -> Value

검색하고자하는 Key값을 입력 받아서 해쉬 함수를 돌려서 반환 받은 해쉬 코드를 배열의 인덱스로 환산하여 데이터로 접근하는 방식의 자료구조이다. 여기서 Key값은 문자열, 숫자, 파일 데이터 등 다양하게 받을 수 있다. 해쉬 함수는 Key값이 얼마나 큰지 상관없이 동일한 해쉬코드를 만들어 준다. 암호화폐의 블록체인에서도 사용자들의 공공장부를 비교할 때 해쉬코드를 이용한다.

해쉬함수는 Key값을 받아서 **정수**인 해쉬코드로 만들어준다. 이로 인해 속도가 매우 빠르다.

### 2. 구현
```java
import java.util.LinkedList;

class HashTable {
	class Node {
		String key;
		String value;
		public Node(String key, String value){
			this.key = key;
			this.value = value;
		}

		String value(){
			return value;
		}

		void value(String value){
			this.value = value;
		}
	}
	LinkedList<Node>[] data;

	HashTable(int size){
		this.data = new LinkedList[size];
	}

	/* 	아래는 해쉬코드를 만드는 함수
		해쉬 코드를 만드는 방법은 정의하기 나름이다.
		여기서는 문자열을 key로 받았을 때, 해당 문자들의 아스키 값을 구하고
		이를 모두 더하는 방법으로 해쉬 코드를 얻을 것이다.
	*/
	int getHashCode(String key){ 
		int hashcode = 0;
		for(char c : key.toCharArray()){
			hashcode += c;
		}
		return hashcode;
	}

	// 아래는 해쉬코드를 받아서 배열 방의 인덱스로 변환해주는 함수
	int convertToIndex(int hashcode){
		return hashcode % data.length;
	}

	Node searchKey(LinkedList<Node> list, String key){
		if(list == null) return null;
		for(Node node : list){
			if(node.key.equals(key)){
				return node;
			}
		}
		return null;
	}

	void put(String key, String value){
		int hashcode = getHashCode(key);
		int index = convertToIndex(hashcode);
		LinkList<Node> list = data[index];

		if(list == null){
			list.addLast(new Node(key, value));
		}else{
			node.value(value);
		}
	}

	String get(String key){
		int hashcode = getHashCode(key);
		int index = convertToIndex(hashcode);
		LinkedList<Node> list = data[index];
		Node node = searchKey(list, key);
		return node == null ? "Not found" : node.value();
	}
}

public class Test {
	public static void main(String[] args){
		HashTable h = new HashTable(3);
		h.put("sung", "She is pretty");
		h.put("jin", "She is a model");
		h.put("hee", "She is an angel");
		h.put("min", "She is cute");
		System.out.println(h.get("sung")); // 출력 : She is pretty
		System.out.println(h.get("jin"));  // 출력 : She is a model
		System.out.println(h.get("hee"));  // 출력 : She is an angel
		System.out.println(h.get("min"));  // 출력 : She is cute

		System.out.println(h.get("jae"));  // 출력 : Not found

		h.put("sung", "She is beautiful!!!"); // 덮어쓰면 업데이트 된다.
		System.out.println(h.get("sung")); 	  // 출력 : She is beautiful!!!
	}
}
```