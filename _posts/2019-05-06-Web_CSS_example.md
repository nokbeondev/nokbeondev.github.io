---
layout: post
title: "[CSS] 예제 몇 개로 CSS 맛보기 "
comments: true
categories: Web
---

### 1. 예제로 살펴보는 다양한 기능들

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css/exam.html</title>
<style>
div>ul {list-style: none; padding-left: 0px; }
div>ul>li{display:inline;}
div>ul a{text-decoration: none; }
div>ul a:hover {background-color: yellow;}/*마우스 커서가 올라갔을 때 노란색*/
#s21, #s22 {display:none;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
 //window객체의 load이벤트핸들러 작성하기
 //$(document).ready(function(){});
 $(function(){
	 //dom트리에서 id가 s1인 객체찾기	 
	 var $s1Obj = $("#s1");
	 
	 //객체의 change이벤트핸들러 작성하기
	 //$s1Obj.addEventListener("change",function(){});
	 $s1Obj.change(function(){
		 var sido = $s1Obj.val();
		 //dom트리에서 아이디값이 s21인 객체
		 var $s21Obj = $("#s21");
		 
		 //dom트리에서 아이디값이 s22인 객체
		 var $s22Obj = $("#s22");
		 
		 $s21Obj.hide();//$s21Obj.style.display='none';
		 $s22Obj.hide();
		 
		 //객체의 value속성값이 '서울'인 경우		 
		 if(sido=='서울'){
			 //dom트리에서 아이디값이 s21인 객체찾아 
			 //화면에 보여주기
			 $s21Obj.show();//$s21Obj.style.display='inline';
		 }else if(sido=='경기'){
		 	//객체의 value속성값이 '경기'인 경우
		 	//dom트리에서 아이디값이 s22인 객체찾아
		 	//화면에 보여주기
			 $s22Obj.show();
		 }
	 });
	 
	 //dom트리에서 input태그중 type속성이 checkbox인 객체들 찾기
	 /* var arr = 
		 document.querySelectorAll("div input[type=checkbox]");
	 var allObj = arr[0]; //all
	 allObj.addEventListener("click",function(){
		 console.log(allObj.checked);
		 arr[1].checked = allObj.checked;//ONE
		 arr[2].checked = allObj.checked;//TWO
		 arr[3].checked = allObj.checked;//THREE
	 }); */
	 var arr = $("div input[type=checkbox]");
	 var allObj = arr[0];
	 console.log(allObj); //자바스크립트용 객체 allObj.checked
	 console.log( $(allObj) ); //제이쿼리용 객체
	                     //attr(), append(), click()다양한 함수사용가능하다
	 $(allObj).click(function(){
		 var c = $(allObj).prop("checked");
		 for(var i=1; i<arr.length; i++){
			 $(arr[i]).prop("checked", c);
		 }
	 });
	 //$("div>div>button:first-child")
	 var btArr = $("div>div>button");
	 $(btArr[0]).click(function(){		 
		 $("#area2").html("<a href=''>테스트</a>");
	 });
	 $(btArr[1]).click(function(){
		 $("#area2").html('');
	 });
 });
</script>
</head>
<body>
<div>
  <ul>
    <li><a href="http://www.daum.net">다음</a></li>
    <li><a href="http://www.naver.com">네이버</a></li>
    <li><a href="http://www.google.com">구글</a></li>
  </ul>
</div>

<div>
  <select id="s1">
    <option>선택하세요</option>
    <option>서울</option>
    <option>경기</option>
  </select>
  <select id="s21">
    <option>구로구</option>
    <option>은평구</option>
    <option>중구</option>
  </select>  
  <select id="s22">
    <option>안양시</option>
    <option>수원시</option>
    <option>부천시</option>
  </select>
</div>
<div>
 <div>
   <input type="checkbox"><span>ALL</span>
 </div>
 <div>
   <ul>
     <li><input type="checkbox"><span>ONE</span></li>
     <li><input type="checkbox"><span>TWO</span></li>
     <li><input type="checkbox"><span>THREE</span></li>
   </ul>
 </div>
</div>
<div>
  <div>영역1
    <button>영역2내용 바꾸기</button>
    <button>영역2내용 지우기</button>
  </div>
  <div id="area2">영역2</div>
</div>
</body>
</html>
```
### 2. 간단히 화면 구성하기
아래의 그림과 같이 영역의 색, 특성 등을 설정할 수 있다.

![화면구성설명그림](https://nokbeondev.github.io/img/Web_CSS1.JPG)

아래는 소스코드이다.
```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css/first.html</title>

<style>
/*
Cascade Style Sheet:CSS is the language for describing the presentation of Web pages, including colors, layout, and fonts. 
 1)head의 하위태그로 style태그를 활용
 2)각태그의 style속성을 활용:inline style
 
 선택자 {프로퍼티명:값;.......}
*/
div {
  border:1px solid;
  width:300px;
  background-color: yellow;
  color:red;
  font-weight:bold;
  font-size: 20px;
  font-style: italic;
}

#div2{
  /* display:none; */
  display:inline;
}

</style>
<link rel="stylesheet" 
      type="text/css" 
      href="basic.css"/>
</head>
<body>
<div style="background-color:green">
DIV1
</div>

<div id="div2">
DIV2
</div>
</body>
</html>
```
