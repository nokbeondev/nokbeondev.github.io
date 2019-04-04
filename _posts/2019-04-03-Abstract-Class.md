---
layout: post
title: "[Java] 추상 클래스와 추상 메소드"
---

### 1. 추상 클래스 용도
설계자는 코더에게 클래스는 어떤 구조로 작성해야 한다는 것을 알려줄 필요성이 있다. **단순히 문서로 코더에게 전달한다면, 코더가 실수로 필드와 메소드 이름을 다르게 코딩할 수 있다.** 코더가 작성해야 할 클래스가 다수이고, 이 클래스들이 동일한 필드와 메소드를 가져야 할 경우, 설계자는 이 내용들을 추려내어 **추상 클래스로 설계 규격을 만드는 것**이 좋다.

### 2. 추상 메소드 오버라이딩
- 오버라이드 어노테이션 (@Override)
@Override를 메소드 위에 선언하면 컴파일러가 '아래 메소드가 오버라이드 하는 메소드'임을 알 수 있다. 컴파일러에게 체크해달라고 하는 일종의 안전장치이다. 어노테이션 없이도 실행은 되지만 컴파일러는 오버라이드된 메소드가 아닌 현재 생성하는 메소드로 알고 컴파일한다. 관례적으로 어노테이션(@)을 사용할 때에는 첫 글자는 대문자로 쓰고, @와 띄어쓰지 않는다.

```java
public abstract class Animal{
	public abstract void sound();
}
```

```java
public class Dog extends Animal {
	@Override
    public void sound(){
    	System.out.println("멍멍");
    }
}
```

- 오버라이드 어노테이션은 **자바 jdk 1.5 버전부터** 쓸 수 있다.