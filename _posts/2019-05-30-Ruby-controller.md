---
layout: post
title: "[Ruby] 제어문 - 조건문, 반복문"
comments: true
categories: Ruby
---

### 1. 조건문

- if문 : ~은 만약 ~라면

```ruby
if 조건1

elsif 조건2

else

end
```

- unless문 : 만약 ~가 아니라면

unless if 같은 것은 없다.

```ruby
unless 조건절1

// 조건 1이 거짓일 때

else

// 조건 1이 참 일 때

end
```

### 2. 반복문

- for문

```ruby
for 변수 in 범위
	변수에 범위 값이 담겨서 사용 가능
end

for 변수 in 배열
	변수에 배열의 원소값이 담겨서 사용 가능
end
```

- 주의 : `...`과 `..`

```ruby
for i in 0...10
    puts i
end
```

	//결과
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    
```ruby
for i in 0..10
    puts i
end
```

	//결과
	1, 2, 3, 4, 5, 6, 7, 8, 9
