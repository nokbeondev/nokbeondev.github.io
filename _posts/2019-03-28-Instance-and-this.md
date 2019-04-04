---
layout: post
title: "[Java] 인스턴스 멤버와 this"
---

### 1. 소스 코드 예시
```java
public class Car{
	// 필드
    String model;
    int speed;
    
    // 생성자
    Car(String model){
    	this.model = model;
    }
}
```

- this는 생략 가능하지만, 위의 경우 `model`변수가 필드와 생성자 내부에서 동일한 이름으로 사용되고 있다. 따라서 이런 경우에는 생략해서는 안된다. (가독성을 위해서라도 웬만하면 생략하지 않는 것이 좋다.)