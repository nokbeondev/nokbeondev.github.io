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

아래는 안드로이드의 대표 레이아웃의 종류이며 간단한 설명과 예시이다.

- AbsoluteLayout
화면에 보여질 뷰에 대해서 절대적인 위치(x, y)를 통해 나타내는 레이아웃이다. 그러나 디바이스마다 화면의 크기가 달라서 콘텐츠의 상대적인 위치가 달라질 수 있는 문제점이 있다. **현업에서 잘 쓰지 않는 레이아웃**이다.

- FrameLayout
아래의 그림과 같이 여러 장의 뷰(레이아웃과 같은 말)를 **순차적으로 쌓아 올리면서 배치**하는 기능을 갖는다. 이 기능 하나 뿐이다.
![프레임레이아웃그림](https://nokbeondev.github.io/img/framelayout.PNG)

- GridLayout(표 형태의 화면 구성 가능, 셀  병합 가능)
격자 무늬라는 뜻의 Grid의 이름 그대로, **격자 모양의 표에 child를 배치**한다. **셀의 위치와 크기를 다양하게 변형**할 수 있고 **셀끼리 병합**도 가능해, 응용 가능성이 많다. 아래는 이해를 돕는 예시 그림이다.
![그리드레이아웃그림](https://nokbeondev.github.io/img/gridlayout.PNG)

- LinearLayout
사각형 박스 형태의 디스플레이 화면에 요소들을 **일렬로 배치**할 수 있다.

- RelativeLayout
상대 레이아웃은 뷰를 담고 있는 부모 레이아웃이나 그 안에 들어있는 다른 뷰들과의 **상대적 위치**를 이용해 화면을 배치하는 레이아웃이다.

- table Layout
표만 만들 수 있고 셀 병합은 안된다.(상위 버전으로 올라가면서 사라짐, 사용 하지 않는 것을 권장)

### 3. AndroidManifest.xml
이 파일은 매우 중요한 파일이다. 앱을 깔고 스마트폰 등의 기기(안드로이드)에서 설치 시 가장 먼저 읽어 들이는 파일이다. 기기의 접근 권한을 설정하고 기능들을 정리한다. 설치시에만 확인하고 실행시 마다 확인하지는 않는다.

### 4. 몇 가지 기본 속성과 기능
- android:layout_weight="1:2"
공백의 비중을 1:2로 설정하는 것이다. `android:layout_weight="1"`로 간단하게 설정도 가능하다. 1:1로 공백의 비중을 나눠가지라는 말이다.

- gravity, layout_gravity
요소의 위치를 설정하는 기능이다. `gravity`는 해당 뷰 안의 콘텐츠의 위치에 영향을 준다. `layout_gravity`는 해당 뷰의 위치를 설정하는 기능이다.

- baselineAligned
위, 아래로 글자 선 맞춤을 설정한다.

```xml
<LinearLayout
	android:layout_width="match_parent"
	android:layout_height="wrap_content"
	android:baselineAligned="true"
	android:background="@color/colorPrimary">

	<TextView
	android:layout_width="wrap_content"
	android:layout_height="wrap_content"
	android:text="큰 글씨"
	android:textSize="30dp"
	android:padding="20dp"
	android:layout_margin="10dp"
	android:background="@color/colorAccent"/>

	<TextView
	android:layout_width="wrap_content"
	android:layout_height="wrap_content"
	android:text="중간 글씨"
	android:textSize="30dp"/>

	<TextView
	android:layout_width="wrap_content"
	android:layout_height="wrap_content"
	android:text="작은 글씨"
	android:textSize="20dp"
	android:layout_margin="5dp"
	android:background="#FF5722"/>
</LinearLayout>
```

- margin, padding


- visibility



