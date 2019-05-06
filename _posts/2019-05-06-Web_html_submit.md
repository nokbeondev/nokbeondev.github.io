---
layout: post
title: "[HTML] HTML5에 추가된 전송방법"
comments: true
categories: Web
---

### 1. 예제로 이해하기
네이버 서버로 전송하기. 전송 후에 네이버 페이지로 이동한다.

```xml
  <div>
    <h3>HTML5에 추가된 전송방법</h3>
    <form action="http://www.naver.com" 
          id="f1">
       <input name="t1">
    </form>
    <button form="f1">전송</button>   
  </div>
```