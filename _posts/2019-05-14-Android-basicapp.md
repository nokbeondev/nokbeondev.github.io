---
layout: post
title: "[Android] 안드로이드 기초 첫 번째"
comments: true
categories: Android
---

### 1. 엑티비티

화면의 기본 단위를 Activity라고 한다. 그 중 MainActivity는 앱의 중심축 역할을 하는 화면을 의미한다.

### 2. Intent

데이터 전달 객체라고 이해하면 된다. 

```java
Button btnSend = findViewById(R.id.btn_send_id);

btnSend.setOnClickListener(new View.OnClickListener() {
	@Override
    public void onClick(View v) {
    // Intent : 데이터 전달 객체
	Intent intent = new Intent(MainActivity.this, TextResultActivity.class); // 전달할 데이터를 intent에 담음
	startActivity(intent); // 담고나서 intent에 담긴 엑티비티(화면) 시작!

    }
});
```
위와 같이 Intent객체에 출발 객체, 도착 객체를 인자로 넣고 `startActivity()`로 intent에 담긴 엑티비티를 시작한다. 즉, 전송 버튼을 누르면 해당 페이지로 이동한다.

### 3. onClick(), onLongClick()
클릭 할 때 실행되는 메서드이다. 사용자가 언제 클릭을 할지 모르니, 항상 감시를 하고 있어서 이벤트 감시자라고도 불린다. 길게 누르면 실행되는 것, 짧게 눌렀을 때 실행되는 것등 다양하다.

### 3. strings.xml
`activity_main.xml`에서 직접 text를 입력하기 보다는 `strings.xml`에 입력하는 것이 낫다. 예를 들면 페이스북 사용시에 스마트폰에서 영문모드, 한글모드를 물어보는 경우가 있다. 이런 경우 별도의 영문 혹은 한글 페이지 제작 없이 쉽게 전환하기 위해서 `strings.xml`에 구현하는 것이 낫다.

```xml
<resources>
    <string name="app_name">기본앱</string>
    <string name="hello">안녕 안드로이드!!!!!!!!</string>
    <string name="btn">버튼</string>
    <string name="btn_send">전송</string>
    <string name="btn_prev">이전</string>
</resources>
```



