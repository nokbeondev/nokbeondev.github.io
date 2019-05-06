---
layout: post
title: "[JQuery] 로그인 예제로 가볍게 알아보는 JQuery"
comments: true
categories: Web
---

### 1. JQuery를 이용한 로그인 페이지

JQuery를 사용했을 때와 하지 않았을 때의 문법적인 차이점만 살펴본다. 먼저 JQuery를 사용할 때에는 `<head>` 안에 아래와 같은 코드를 작성하고 시작한다.

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jq/login.html</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function invalidCheck(){
	//dom트리에서 name속성값이 id인 객체찾기
	var inputIdObj = $("input[name=id]");
	//dom트리에서 name속성값이 pwd인 객체찾기
	var inputPwdObj = $("input[name=pwd]");
	
	if(inputIdObj.val().length > 10){	
		alert("ID는 최대10자리까지만 가능합니다.");
		inputIdObj.focus();
		return false;
	}	
	var rePwd1 = /\W/; //특수문자용 정규식만들기 /  /
	var rePwd2 = /\w/; //문자와숫자,_용 정규식
	//정규식확인하는 메서드 : test()
	if(!rePwd1.test(inputPwdObj.val())){
		alert("비밀번호는 특수문자를 포함하세요.");
		inputPwdObj.focus();
		return false;
	}
	if(!rePwd2.test(inputPwdObj.value)){
		alert("영문또는 숫자를 포함하세요.")
		inputPwdObj.focus();
		return false;
	}
	return true;
}
function init(){
	//dom트리에서 id속성값이 btLogin인 객체찾기
	var btLoginObj = $("#btLogin");
	var formObj = $("form");	
	formObj.submit(function(){
		if(invalidCheck()){
			var requestURL = "login.do";
			this.action=requestURL;
			this.method='post';
			this.submit();
		}
	});
}
//window의 load이벤트발생감시
//window.addEventListener("load", init);
//$(document).ready(init);
$(init);
</script>
</head>
<body>
<div>
<form>
ID : <input name="id"><br>
PWD : <input type="password" name="pwd"><br>
<button id="btLogin">로그인</button> &nbsp;&nbsp;
<button id="btSignup">가입</button>
</form>
</div> 
</body>
</html>
```


### 2. JQuery 사용하지 않은 로그인 페이지

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function invalidCheck(){
	//dom트리에서 name속성값이 id인 객체찾기
	var inputIdObj = document.querySelector("input[name=id]");
	//dom트리에서 name속성값이 pwd인 객체찾기
	var inputPwdObj = document.querySelector("input[name=pwd]");
	
	if(inputIdObj.value.length >10){
		alert("ID는 최대10자리까지만 가능합니다.");
		inputIdObj.focus();
		return false;
	}	
	var rePwd1 = /\W/; //특수문자용 정규식만들기 /  /
	var rePwd2 = /\w/; //문자와숫자,_용 정규식
	//정규식확인하는 메서드 : test()
	if(!rePwd1.test(inputPwdObj.value)){
		alert("비밀번호는 특수문자를 포함하세요.");
		inputPwdObj.focus();
		return false;
	}
	if(!rePwd2.test(inputPwdObj.value)){
		alert("영문또는 숫자를 포함하세요.")
		inputPwdObj.focus();
		return false;
	}
	return true;
}
function init(){
	//dom트리에서 id속성값이 btLogin인 객체찾기
	var btLoginObj = document.querySelector("#btLogin");	
	var formObj = document.querySelector("form");
	formObj.addEventListener("submit",function(){
		var requestURL = "login.do";
		this.action=requestURL;
		this.method='post';
		this.submit();
	});
	/* btLoginObj.addEventListener("click", function(e){		
		if(invalidCheck()){
			var requestURL = "login.do";
			//dom트리에서 form객체찾기
			var formObj = document.querySelector("form");
			formObj.action=requestURL;
			formObj.method='post';
			formObj.submit();//????
		}
		e.preventDefault();
	});	 */
}
//window의 load이벤트발생감시
window.addEventListener("load", init);
</script>
</head>
<body>
<div>
<form>
ID : <input name="id"><br>
PWD : <input type="password" name="pwd"><br>
<button id="btLogin">로그인</button> &nbsp;&nbsp;
<button id="btSignup">가입</button>
</form>
</div> 
</body>
</html>
```


