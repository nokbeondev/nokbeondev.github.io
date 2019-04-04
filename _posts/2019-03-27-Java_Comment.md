---
layout: post
title: "[Java] Document 주석"
---

### 1. 개념
- ###### 자바 API 도큐먼트 문서에 포함되는 도큐먼트 주석
- ###### 도큐먼트 주석은 javacdoc.exe 명령어로 API 도큐먼트를 생성하는데 사용

### 2. 사용
- ###### 아래와 같이 도큐먼트 주석을 사용하고 명령어를 입력하면 doc파일이 자동 생성되고 HTML에 소스코드에 대한 메서드, 변수 등의 설명이 정리된다.
- ###### Eclipse에서 사용하기
 - ###### file의 Export클릭 -> Java 폴더 -> javadoc 클릭 후 Next버튼을 계속 누르면 된다.
 - ###### Eclipse의 workspace 폴더의 해당 프로젝트 폴더 아래 있는 doc폴더에 index.html파일이 생성되는데 이를 인터넷을 열면 된다.


```java
/**
자바 도큐먼트 주석
*/

public class Document{
	public static void main(String[] args){
    	int val1; // val1에 대한 설명
        int val2; // val2에 대한 설명
    }
}
```