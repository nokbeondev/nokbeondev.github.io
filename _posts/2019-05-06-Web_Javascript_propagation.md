---
layout: post
title: "[Javascript] Propagation"
comments: true
categories: Web
---

### 1. 이벤트 전파와 전파를 막는 방법
하위 요소에서 발생된 이벤트는 상위 요소로 자동 전파된다.(**이벤트 버블**) 이벤트 버블을 막으려면 `event.stopPropagation()`를 호출한다.

아래 코드에서 보면 div1이 `<a>`태그를 감싸고 있으므로 div1이라는 `<div>`가 `<a>`의 상위 요소이다. 따라서 링크 클릭 시 링크의 배경색이 노란색으로 변해야하고 링크 페이지로 이동해야하며, div1 영역이 회색으로 변해야한다. 하지만 `event.preventDefault()`에 의해 링크로 이동하지 않고 `event.stopPropagation()`에 의해 상위 요소인 div1의 배경색이 바뀌지 않는다. 단, `<a>`영역이 아닌 div1 영역을 클릭 시에는 배경색이 회색으로 변한다.

### 2. 예제 소스 코드
```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>propagation.html</title>
<script>
  window.addEventListener("load", function(){
	  var aObj = document.querySelector("a");
	  /* aObj.addEventListener("click", function(){
		  alert("링크가 클릭되었습니다");
	  }); */
	  aObj.addEventListener("click", function(event){
		  alert("링크가 클릭되었습니다");
		  this.style.backgroundColor='yellow'; // 링크 클릭 시 바탕색이 노란색으로 변함
		  event.preventDefault(); //기본 이벤트 처리를 막는다. 즉, 해당 페이지로 이동이 막힌다.
		  event.stopPropagation(); //이벤트 전파를 중지한다.
	  });
	  document.querySelector("#div1").addEventListener("click", function(){
		  this.style.backgroundColor='gray'; // div1 영역을 클릭 시에 바탕색이 회색으로 변함
	  });
  });
</script>
</head>
<body>
<div id="div1">
  <a href="http://nokbeondev.github.io">My TomcatServer</a>
</div>
</body>
</html>
```


