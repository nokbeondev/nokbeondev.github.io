---
layout: post
title: "Merge Sort (합병정렬) - 오름차순"
comments: true
categories: Java_DataStructures
---

### 1. 개념
- 일반적인 방법으로 구현했을 때 이 정렬은 안정 정렬에 해당한다. 분할 정복 알고리즘의 하나 이다.
- 합병 정렬의 단계들
	- 분할(Divide) : 입력 배열을 같은 크기의 2개의 부분 배열로 분할한다.
	- 정복(Conquer) : 부분 배열을 정렬한다. 부분 배열의 크기가 충분히 작지 않으면 순환 호출을 이용하여 다시 분할 정복 방법을 적용한다.
	- 결합(Combine) : 정렬된 부분 배열들을 하나의 배열에 합병한다.
- 합병 정렬의 과정
	- 추가적인 리스트 필요
	- 각 부분 배열을 정렬할 때도 합병 정렬을 순환적으로 호출하여 적용
	- 실질적으로 정렬되는 시점은 2개의 리스트를 합병하는 단계
	- 합병 정렬 그림으로 이해하기
![합병정렬 개념도](http://nokbeondev.github.io/img/merge-sort-concepts.png)

- 합병 정렬의 특징
	- 단점
		- 레코드를 배열로 구성하려면 임시 배열이 필요하다.
		- 레코드들의 크기가 크면 이동 횟수가 많아져서 매우 큰 시간적 낭비를 초래한다.
	- 장점
		- 안정적인 정렬 방법 : 데이터의 분포에 영향을 덜 받는다. 즉, 입력 데이터가 무엇이든 정렬되는 시간은 동일하다. (O(nlog2 n))
		- 만약 레코드를 Linked List로 구성하면, 링크 인덱스만 병경되므로 데이터의 이동은 무시할 수 있을 정도록 작아진다. (In-place sorting으로 구현 가능)
		- 따라서 크기가 큰 레코드를 정렬할 경우에 Linked List를 사용하면 합병 정렬은 퀵 정렬(혹은 다른 어떤 정렬)보다 효율적이다.

### 2. 구현
```java
public class Test {
	private static void mergeSort(int[] arr){
		int[] tmp = new int[arr.length];
		mergeSort(arr, tmp, 0, arr.length - 1);
	}

	private static void mergeSort(int[] arr, int[] tmp, int start, int end){
		if(start < end){
			int mid = (start + end) / 2;
			mergeSort(arr, tmp, start, mid);
			mergeSort(arr, tmp, mid + 1, end);
			merge(arr, tmp, start, mid, end);
		}
	}

	private static void merge(){
		for(int i = start; i <= end; i++){
			tmp[i] = arr[i];
		}
		int part1 = start;
		int part2 = mid + 1;
		int index = start;
		while (part1 <= mid && part2 <= end){
			if(tmp[part1] <= tmp[part2]){
				arr[index] = tmp[part1];
				part1++;
			}else{
				arr[index] = tmp[part2];
				part2++;
			}
			index++;
		}
		for(int i = 0; i <= mid - part1; i++){
			arr[index + i] = tmp[part1 + i];
		}
	}

	private static void printArray(int[] arr){
		for(int data : arr){
			System.out.print(data + ", ");
		}
		System.out.println();
	}
	
	public static void main(String[] args){
		int[] arr = {3, 9, 4, 7, 5, 0, 1, 6, 8, 2}; // 정렬 전의 배열
		printArray(arr);
		mergeSort(arr);
		printArray(arr);
	}
}
```

### 3. Big O
- 분할 단계
	- 비교 연산과 이동 연산이 수행되지 않는다.
- 합병 단계
	- 비교 횟수 : n x long2 n = **nlog2 n** (아래 그림 참조)
![합병정렬 복잡도 설명](http://nokbeondev.github.io/img/sort-time-complexity-etc.png)
 
	- 이동 횟수 : 2n x log2n = **2n log2 n**
	- 임시 배열에 복사했다가 다시 가져와야 되므로 크기가 n인 경우 레코드의 이동은 2n번 발생한다.
	- 순환 호출의 깊이 (합병 단계의 수) : k = log2 n

- 따라서 합병 정렬의 복잡도는 아래와 같다.
### T(n) = n log2 n + 2n log2 n = 3n log2 n = O(n log2 n)