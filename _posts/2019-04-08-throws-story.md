---
layout: post
title: "[Java] throws와 예외 처리 이야기"
comments: true
categories: Java
---

### 1. throws의 역할과 생겨난 계기
![throw설명그림](http://nokbeondev.github.io/img/throws.JPG)

위와 같이 본사에서는 접근이 가능한데, 지사에서는 접근 제한이 걸려있다면 지사가 DB에 접근할 수 있는 방법은 **RMI 방식**을 이용하는 것이다.
	- RMI(Rmote Method Invocation) : 각 객체간, 컴퓨터 간 메소드 호출할 수 있게 해주는 기술

- 본사 쪽 메소드 `s()` 호출 했고 여기서 예외가 발생했다면 당연히 본사 console에 오류 메시지가 나온다.
- 지사에서 RMI로 `s()` 호출 했고 똑같이 예외가 발생한다면 이 때에도 본사 console에 오류 메시지가 나온다. 이럴 때 필요한 것이 `throws`다.

- 지사에서 호출 했으니 throws를 통해 호출한 위치로 처리를 떠넘긴다. 떠넘기게 되면 catch를 통해 지사에서 예외처리가 가능하다. 
	- 메소드 내에서 예외처리 하려면 `try-catch`
	- 호출한 곳에서 예외처리 하려면 `throws-catch`

- 따라서 본사와 지사 모두 오류 확인하려면 본사 메소드에서 catch를 통해 오류 출력하고 그 후 그 안에서 throws를 통해 지사에 보내고 지사 메소드의 catch에서 오류를 출력한다.
```java
void s(){
	try{
    	~~
    }catch( ~ ) {
    	"오류 출력"
        throws // 본사에서 오류 출력 후 지사로 보낸다. -> 지사의 catch가 받아서 지사에서 오류 출력
    }
}
```
- 사용자 정의 예외처리를 만들고 싶으면 Exception을 상속 받아야한다.