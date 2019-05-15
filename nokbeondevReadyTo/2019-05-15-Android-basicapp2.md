---
layout: post
title: "[Android] 안드로이드 기초 두 번째"
comments: true
categories: Android
---

### 1. 들어가기 앞 서 간단한 네트워크 기본 상식

주소로 알아보는 url, uri, queryString, 프로토콜, 도메인

![네트워크](https://nokbeondev.github.io/img/networkaddress.PNG)

### 2. 버튼 클릭시 화면 전환
스마트폰에는 개발자가 만든 화면 외에도 기본적으로 가지고 있는 화면들이 많이 있다. 예를 들면 다이얼 창, 문자 전송 창 등이 대표적이다. 이런 기본 창을 가져오기 위해서는 아래와 같이 하면 된다.

```java
btnCall.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
        Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:010-1234-6789")); // 전달할 데이터를 intent에 담음
        startActivity(intent); // 담고나서 intent에 담긴 엑티비티(화면) 시작!
    }
});
```

여기서 `Intent` 밑에 스마트폰에 기본적으로 들어있는 화면 (문자 전송, 전화 걸기 등) 클래스 들어있다. 위에서 `tel:전화번호`에서 `tel`은 프로토콜을 나타낸다.



### 3. 대표적 레이아웃 종류

- AbsoluteLayout

- FrameLayout

- GridLayout(표 형태의 화면 구성 가능, 셀  병합 가능)

- LinearLayout

- RelativeLayout

- table Layout(표만 만들 수 있고 셀 병합은 안된다. 상위 버전으로 올라가면서 사라짐, 사용 하지 않는 것을 권장)
