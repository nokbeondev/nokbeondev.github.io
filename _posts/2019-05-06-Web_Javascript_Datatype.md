---
layout: post
title: "[Javascript] 데이터 타입"
comments: true
categories: Web
---

### 1. 콘솔로 확인하는 데이터 타입

아래의 예제와 같이 `typeof()`메소드를 이용하면 콘솔에서 해당 변수의 타입을 알 수 있다. 주의할 점은 아래의 `v2`변수처럼 **아무 것도 할당되지 않은 변수**의 타입은 `undefined`라는 것이다. 그리고 데이터 타입 간에는 우선 순위가 있음을 아래의 예제를 통해 알아볼 수 있다. 또한 함수도 변수 안에 할당될 수 있다.

```xml
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//
/**/
v1 = 1;
console.log(typeof(v1)); //자료형확인number

v1 = 'hello';
console.log(typeof(v1)); //자료형확인string

v1 = true;
console.log(typeof(v1)); //자료형확인boolean

v1 = function(){}
console.log(typeof(v1)); //function

v1 = {}
console.log(typeof(v1)); //object

//console.log(v2); //v2 is not defined
v2 = 'undefined';
console.log(v2 + ", typeof()=" + typeof(v2));

v1 = 1;
v2 = 2;
v3 = '10';
v4 = true;
console.log(v1+v2);//3
console.log(v1+v3);//number+string : '110' (string우선)
console.log(v3+v1);//string+number : '101' (string우선)

console.log(v1+v4);//number+boolean : 1+1 = 2(number우선)
console.log(v4+v1);

console.log(v3+v4);//10true

console.log(parseInt(v3) + v1); //11
console.log(parseInt(v3) + v4); //10+1 11

//-------------------//
f1=function(p){
	if(p%2 == 0){
	  return "even";		
	}else{
	  return "odd";	
	}
};

console.log( typeof(f1) );
r = f1(75);
console.log(r); //odd

f2=function(){
	console.log("f2함수입니다.");
};
f3=function(p){
	//p();
	console.log(p);
}
num=99;
f3(num); //99
f3(f2); //function(){
	    //console.log("f2함수입니다.");
        //};

f4 = function(p){
	p();
};
f4(f2);//f2함수입니다

f5 = function(p){
	for(i=0; i<1000000; i++){
		for(j=0; j<1000; j++){
		}
	}
	p();
};
//f5(f2);

f6=function(p){	
	return p+10;
}
console.log(f6(10));//20

var a; //변수선언
console.log( typeof(a) ); //undefined
console.log(f6(a));  //NaN

f7=function(p){
	if(typeof(p) == 'undefined'){	//if(p == undefined){
		console.log("매개변수에 해당하는 값이 없습니다.");
		return -1;
	}
	return p+10;
};
console.log(f7(a)); //-1

f8=function(a,b){
	return a/b;
};
console.log(f8(3, 4)+1); //0.75+1 -> 1.75
console.log(f8(3, 0)+1); //Infinity+1 -> Infinity
</script>
</head>
<body></body>
</html>
```

