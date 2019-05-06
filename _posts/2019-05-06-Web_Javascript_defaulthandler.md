---
layout: post
title: "[Javascript] Defaulthandler와 막는 함수"
comments: true
categories: Web
---

### 1. default 이벤트 처리와 막는 방법
`<a>`, `<submit>`태그는 default이벤트 처리가 존재한다. `<a>`태그는 click 이벤트에 대한 처리가 내장되어있다. 사용자 정의 이벤트 처리후 default 이벤트 처리가 진행된다. default 이벤트 처리를 안 하려면 사용자 정의 이벤트 처리용 함수에 매개 변수로 이벤트를 설정하고 함수 안에서 `event.preventDefault()`를 호출한다

`<form>`태그에 `action`으로 경로를 설정하고 그 안에 버튼을 만들면 클릭 시 바로 이동한다.
```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>defaulthhandler.html</title>
<script>
  window.addEventListener("load", function(){
	  var aObj = document.querySelector("a");
   
    /*aObj.addEventListener("click",function(){
		  alert("링크가 클릭되었습니다");
	  }); */
      
	  aObj.addEventListener("click", function(e){		  
		  alert("링크가 클릭되었습니다");
		  e.preventDefault(); // 클릭된 링크로 이동하지 않는다.
	  });

	  /*
	  var formObj = document.querySelector("form");
	  formObj.addEventListener("submit", function(){
		 alert("submit이벤트가 발생되었습니다"); 
	  });*/
      
	  
	  var submitBtObj = 
		  document.querySelector("input[type=submit]");
	  submitBtObj.addEventListener("click", function(event){
		 alert("서브밋버튼이 클릭되었습니다"); 
		 event.preventDefault(); // 지정된 경로로의 이동을 막는다.
	  });
  });
</script>
</head>
<body>
<div>
  <a href="http://nokbeondev.github.io">My TomcatServer</a>
</div>
<div>
  <form action="http://nokbeondev.github.io">
    <input name="a" value="abcde"><br>
    <input type="submit" value="전송"><br> <!--클릭 시 자동으로 위 action에 지정된 경로로 이동한다. -->
    <button>전송2</button>    
  </form>
  <button>일반버튼</button> <!-- form 태그 밖에 있는 버튼은 별다른 설정 없이는 작동하지 않는다.-->
</div>

</body>
</html>
```