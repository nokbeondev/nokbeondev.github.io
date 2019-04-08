---
layout: post
title: "[Java] String 클래스의 split()과 StringTokenizer 클래스"
---

### 1. 소스 예제로 보는 차이점
- String 클래스의 split()에서는 빈 문자열도 분리할 수 있다.
- StringTokenizer 클래스는 빈 문자열을 구분하여 분리할 수 없다.

```java
import java.util.StringTokenizer;

public class SplitToken {
	public static void main(String[] args) {
		String score = "90:80::60";
		String[] arr = score.split(":");
		for(String s : arr) {
			System.out.println("점수 : " + s);
		}
		System.out.println("----------------------");
		StringTokenizer st = new StringTokenizer(score, ":");
		while(st.hasMoreTokens()) {
			String s = st.nextToken();
			System.out.println("점수 : " + s);
		}
	}
}
```
	// 출력
    // String 클래스의 split()
    점수 : 90
	점수 : 80
	점수 : 
	점수 : 60
	----------------------
    // StringTokenizer 클래스
	점수 : 90
	점수 : 80
	점수 : 60