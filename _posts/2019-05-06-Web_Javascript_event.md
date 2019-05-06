---
layout: post
title: "[JavaScript] 클릭 이벤트 처리"
comments: true
categories: Web
---

### 1. 이벤트 처리하기 예제

- `document.querySelector()`와 `document.querySelectorAll()`
`document.querySelector()`는 하나 이상의 선택자를 포함한 DOMString을 매개변수로 받아 첫 번째 요소를 반환한다. 결과가 없으면 `null`을 반환한다. 매개 변수로 받은 선택자가 유효하지 않은 경우 `SYNTAX_ERR`를 발생한다.
`document.querySelectorAll()`는 `NodeList`형태로 반환한다. 나머지는 동일하다.

- `addEventListener("OOO", function(){})`
클릭 이벤트가 발생 했을 때 수행되야하는 내용을 구현한다. (중괄호 안에)


```xml
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
값1:<input><br>
값2:<input><br>
<button>+</button><br>
결과:<label></label>
<script>
var btObj = document.querySelector("button");
btObj.addEventListener("click", function(){
//첫번째input입력값과 두번째input입력한값
//연산
  var arr = document.querySelectorAll("input");
  var str1 = arr[0].value; 
  var str2 = arr[1].value;
  var result = parseInt(str1) + parseInt(str2);
  var labelObj = document.querySelector("label");
  labelObj.innerText = result;
});
</script>
</body>
</html>
```

위의 결과는 아래와 같이 나온다.


![이벤트설명그림](https://nokbeondev.github.io/img/Web_html_event.JPG)