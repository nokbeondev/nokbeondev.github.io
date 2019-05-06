---
layout: post
title: "[HTTP] 사용자로부터의 요청, 전달 방식, DOM Tree"
comments: true
categories: Web
---

### 1. 사용자의 요청과 정보 전달 방식

사용자로부터 요청이 들어오면, Post 방식 혹은 Get 방식으로 정보 전달이 이루어진다.

1) method
2) header
3) body content(message body)

위의 세 가지 정보 전달 방법 중에 Post 방식은 **body content에 담겨** 전달되는 방식이다. **많은 양의 데이터 전송**이 가능하며 **get 방식보다 보안에 강하다.** Get 방식은 **URL에 담겨** 전송된다. body content 영역을 사용하지 않는다. **URL 뒤에 쿼리 스트링으로 전달 내용이 붙어서 간다.** 그래서 상대적으로 보안에 약할 수 밖에 없다.

### 2. DOM Tree
렌더링 엔진이 **위에서 아래, 좌에서 우**의 형태로 DOM 트리를 형성하면 자바스크립트가 참조하여 작동한다. 렌더링 엔진은 각 객체들이 id 식별자를 부여하고 자바스크립트는 그 것을 이용하여 객체를 찾아 간다. (이런 이유로 id 속성값은 중복되면 안된다.)