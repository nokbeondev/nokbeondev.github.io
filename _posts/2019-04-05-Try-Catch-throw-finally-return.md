---
layout: post
title: "[Java] 예외 처리"
---

### 1. 처리 과정
```java
public class ExceptionTest {
	static int m(int i) {
		try {
			if(i < 10) {
				System.out.println("정상작동");
				return 1;
			}else {
				//return 0;
				throw new IllegalArgumentException("예외 내용"); // catch로 보낸다
			}
		}catch(IllegalArgumentException e){
			System.out.println(e.getMessage());
			return -1;
		}finally {
			System.out.println("finally");
		}

	}
	
	public static void main(String[] args) {
		System.out.println(m(11));
		System.out.println("END MAIN");
		System.out.println();
		System.out.println(m(2));
	}
}
```
	//출력
	예외 내용
	finally
	-1
	END MAIN
	
	정상작동
	finally
	1

- m(11)의 경우 : try -> else -> throw -> catch -> finally -> return -1 
- m(2)의 경우 : try -> if -> finally -> return 1

위와 같이 **return 되기 전**에 finally가 실행이된다.