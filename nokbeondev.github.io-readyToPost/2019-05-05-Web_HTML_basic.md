---
layout: post
title: "[HTML] 기초 용어 및 문법들 간단 정리"
comments: true
categories: Web
---

### 1. DOCTYPE 선언 이유

HTML은 버전 별로 지원하는 태그가 조금씩 다르다. 그래서 HTML이 어떤 버전으로 작성되었는지 미리 선언하여 **웹브라우저가 내용을 올바로 표시할 수 있도록 해주는 것**이 <!DOCTYPE>이다. <!DOCTYPE>는 태그가 아니며, HTML문서 제일 처음에 온다.(</DOCTYPE>가 없다.)

- 사용법
최상단에 위치한다.

```xml
<!DOCTYPE html><!--문서유형  -->
<html>
<head>
  <meta charset="UTF-8">
  <title>첫번째 HTML입니다</title>
</head>
<body>
 <h1>WELCOME!</h1>
 <h3>Nokbeondev's 첫 번째 HTML페이지입니다.</h3>
 <a href="http://www.naver.com">네이버</a>
 <a href="http://www.daum.net">다음</a>
</body>
</html>
```

### 2. 기본 문법들

- `<head>`, `<title>`, `<body>`
`<body>`는 페이지를 열 때에 브라우저에 표시되지만 `<head>`는 표시되지 않는다. 대신 페이지에 대한 metadata를 포함하는 일을 한다. `<title>`은 말 그대로 웹 브라우저의 상단에 제목으로 들어갈 내용을 설정한다.

- `<br>`
한 줄을 띄우는 역할을 한다.

- `<form>`
큰 틀을 만드는 데 사용한다. `<form>`은 입력된 데이터를 한 번에 서버로 전송한다. 전송한 데이터는 웹 서버가 처리하고, 결과에 따른 또 다른 웹 페이지를 보여준다.

- `<div>`와 `<span>`
둘 다 공간 분할 하는 데에 사용한다. `<div>`는 Block형식이고 `<span>`은 inline형식이다.
```xml
<!-- 영역: div -크기설정가능, 자동줄바꿈
            span -크기설정불가(컨텐트크기만큼만 자동설정됨),자동줄바꿈안됨,
                 -상하마진은 무시됨(0).
-->
 <div style="border:1px solid;background-color:yellow;
             width:100px;
             padding:10px;
             margin:20px;">
 DIV1
   <ol>
	   <li>ONE</li>
	   <li>TWO</li>
	   <li>THREE</li>
   </ol>
 </div> 
 <div style="border:1px dotted;background-color:green;color:orange;">
 DIV2
   <ol>
     <li>ONE</li>
     <li>TWO</li>
     <li>THREE</li>
   </ol>
 </div>
 <span style="border:1px solid;background-color:yellow;
              width:100px;
              padding:10px;
              margin:20px;">SPAN1</span>
 <span style="border:1px dotted;background-color:green;color:orange;">SPAN2</span>
 <div> 
  <a href="http://www.google.com" style="width:1000px;border:1px solid;">구글</a>
  <a href="http://www.naver.com">네이버</a>
 </div>
 <div>
  <img src="https://movie-phinf.pstatic.net/20190417_250/1555465284425i6WQE_JPEG/movie_image.jpg"
       width="100px"
       height="100px" 
       alt="어벤져스: 엔드게임">
  <img src="images/pororo.jpg"
       style="width:100px; height:100;"
       alt="뽀로로 극장판">       
 </div>
```
위의 코드는 아래와 같이 브라우저에 표현된다. `<span>`의 경우 상하마진이 무시된다. 즉, 컨텐츠의 크기가 크면 위 아래 행과 겹친다. `<div>`는 블록을 쌓는 형태이고 `<span>`은 한 줄에 나란히 나열하는 형태이다.
![div와span설명그림](https://nokbeondev.github.io/img/Web_html_span_div.JPG)

- `<input>` (HTML5에 추가된 `input` 타입의 속성값들)

```xml
<div>
    <h3>HTML5에 추가된 input type속성값들</h3>
    <form>
      <input type="number" value="5" max="10" min="1" step="2"><br>
      <input type="date"><br>
      <input type="email"><br>
    </form>
  </div>
  <div>
    <h3>HTML5에 추가된 input태그의 속성들</h3>
    <form>
      <input placeholder="입력하세요"><br>
      <input> <input autocomplete="off"><br>
      <input autofocus placeholder="자동포커스받기">
    </form>
  </div>
```
위의 코드는 아래와 같이 웹 브라우저에서 표현된다. 아래 그림처럼 위, 아래 화살표 클릭으로 2씩 증가/감소 할 수 있는 기능, 날짜 정하는 기능, 이메일 형식만 입력받을 수 있는 기능, 입력하는 박스에 '입력하세요'라는 문구를 넣을 수 있는 기능, 자동 포커스 받을 수 있는 기능 등이 있다.
![input설명그림](https://nokbeondev.github.io/img/Web_html_input.JPG)

- `<select>`, `<option>`
- `<textarea>`
여러 줄을 입력할 수 있는 text 박스가 생성된다.

- `&nbsp;`
한 칸을 띌 때 쓰인다.


```xml
<!-- form.html
 입력양식태그   
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div>
  <form>
    <!-- input type="text"와 같음 -->
    <input style="width:50px" 
           value="html"
           maxlength="10"> 
    <br>
    <input style="width:200px" type="password"><br>
    <input type="checkbox" name="c">ONE&nbsp;&nbsp;
    <input type="checkbox" name="c">TWO&nbsp;&nbsp;
    <input type="checkbox" name="c">THREE<br>
    
    <input type="radio" name="r">남&nbsp;&nbsp;&nbsp;
    <input type="radio" name="r">여<br>
    
    <select>
      <option>서울</option>
      <option>경기</option>
      <option>부산</option>
    </select><br>
    <textarea rows="5" cols="100">여러줄 입력란</textarea>
  </form>
  </div>
  
  <div>
    <h3>HTML5에 추가된 input type속성값들</h3>
    <form>
      <input type="number" value="5" max="10" min="1" step="2"><br>
      <input type="date"><br>
      <input type="email"><br>
    </form>
  </div>
  
  <div>
    <h3>HTML5에 추가된 input태그의 속성들</h3>
    <form>
      <input placeholder="입력하세요"><br>
      <input> <input autocomplete="off"><br>
      <input autofocus placeholder="자동포커스받기">      
    </form>
  </div>
</body>
</html>
```


```xml
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic.html</title>
</head>
<body>
 <!-- 제목태그:h1~h6 -->
 <!-- 단락:p -->
 <p>With HTML you can create your own Website.<br>
This tutorial teaches you everything about HTML.<br>
HTML is easy to learn - You will enjoy it.</p>
  <!-- 줄바꿈:br -->
 
 <p>두번째 단락</p>  
  <!-- 목록: 순서없는 목록ul
            순서있는 목록ol
         하위요소: li
  -->
 <ul>
   <li>ONE</li>
   <li>TWO</li>
   <li>THREE</li>
 </ul>
 
 <ol>
   <li>ONE</li>
   <li>TWO</li>
   <li>THREE</li>
 </ol>
 
 <!-- 표 :table
      머릿말: thead
      바디: tbody
      꼬릿말: tfoot
      행 : tr
      헤더열: th
      열 : td
 -->
 <!-- <table border="1" width="800"> -->
 <table style="border:1px solid; width:800px; height:100px;">
   <thead>
     <tr><th width="150">과목</th><th>강의실</th><th>시수</th></tr>
   </thead>
   <tbody>
     <tr><td>수학</td><td>101</td><td>5</td></tr>
     <tr><td>영어</td><td>201</td><td>3</td></tr>
     <tr><td>사회</td><td>301</td><td>1</td></tr>
     <tr><td rowspan="2">과학</td><td>401</td><td>4</td></tr>
     <tr>                         <td>402</td><td>4</td></tr>
   </tbody>
   <tfoot>
     <tr><td colspan="3">연락처:114, 담당자:이길동, 주소:대치동</td></tr>
   </tfoot>
 </table>
 
 <!-- 영역: div -크기설정가능, 자동줄바꿈
            span -크기설정불가(컨텐트크기만큼만 자동설정됨),자동줄바꿈안됨,
                 -상하마진은 무시됨(0).
  -->
 <div style="border:1px solid;background-color:yellow;
             width:100px;
             padding:10px;
             margin:20px;">
 DIV1 
   <ol>
	   <li>ONE</li>
	   <li>TWO</li>
	   <li>THREE</li>
   </ol>
 </div> 
 <div style="border:1px dotted;background-color:green;color:orange;">
 DIV2
   <ol>
     <li>ONE</li>
     <li>TWO</li>
     <li>THREE</li>
   </ol>
 </div>
 
 <span style="border:1px solid;background-color:yellow;
              width:100px;
              padding:10px;
              margin:20px;">SPAN1</span>
 <span style="border:1px dotted;background-color:green;color:orange;">SPAN2</span>
  
 <div> 
  <a href="http://www.google.com" style="width:1000px;border:1px solid;">구글</a>
  <a href="http://www.naver.com">네이버</a>
 </div>
 
 <div>
  <img src="https://movie-phinf.pstatic.net/20190417_250/1555465284425i6WQE_JPEG/movie_image.jpg"
       width="100px"
       height="100px" 
       alt="어벤져스: 엔드게임">
  <img src="images/pororo.jpg"
       style="width:100px; height:100;"
       alt="뽀로로 극장판">       
 </div>
 
  
</body>
</html>

```















