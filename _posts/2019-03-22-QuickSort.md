---
layout: post
title: "Quick Sort (퀵 정렬) - 오름차순"
comments: true
categories: Java_DataStructures
---

### 1. 개념
- 불안정 정렬에 속한다. 다른 원소와의 비교만으로 정렬을 수행하는 비교 정렬이다.
- 분할 정복 알고리즘의 하나다. 평균적으로 매우 빠른 수행 속도가 특징이다. 합병 정렬과 다르게 퀵 정렬은 리스트를 비균등하게 분할한다.
- 분할 정복 방법
	- 문제를 작은 2개의 문제로 분리하고 각각을 해결한 다음, 결과를 모아서 원래의 문제를 해결하는 전략
	- 이 방법은 대개 순환 호출을 이용하여 구현

### 2. 사용법
- 하나의 리스트를 pivot을 기준으로 두 개의 비균등한 크기로 분할하고 분할된 부분 리스트를 정렬한 다음, 두 개의 정렬된 부분 리스트를 합하여 전체가 정렬된 리스트가 되게 하는 방법이다.
- 단계별 설명
	- 분할(Divide) : 입력 배열을 pivot을 기준으로 비균등하게 2개의 부분 배열로 분할한다. (pivot을 기준으로 작으면 왼쪽, 크면 오른쪽)
	- 정복(Conquer) : 부분 배열을 정렬한다. 부분 배열의 크기가 충분히 작지 않으면 순환 호출을 이용하여 다시 분할 정복 방법을 적용한다.
	- 결합(Combie) : 정렬된 부분 배열들을 하나의 배열에 합병한다.
	- 순환 호출이 한 번 진핼될 때마다 최소한 하나의 원소(pivot)는 최종적으로 위치가 정해지므로, 이 알고리즘은 반드시 끝난다는 것을 보장할 수 있다.
	- 그림을 통한 설명
![퀵정렬 그림](http://nokbeondev.github.io\img\quick-sort.png)


### 3. 구현
```java
import java.util.*;

public class Test{
	private static void quickSort(int[] arr){ // 껍데기
		quickSort(arr, 0, arr.length-1);
	}

	private static void quickSort(int[] arr, int start, int end){ // 재귀 호출을 이용
		int part2 = partition(arr, start, end); // 오른쪽 파트의 첫 번째 값
		if(start < part2 - 1){
			quickSort(arr, start, part2 - 1);
		}
		if(part2 < end){
			quickSort(arr, part2, end);
		}
	}
	private static int partition(int[] arr, int start, int end){
		int pivot = arr[(start + end) / 2]; // pivot을 중간 위치로 지정(다른 위치로 지정해도 무관함)
		while(start <= end){
			while(arr[start] < pivot) start++; // 배열방의 값이 pivot값 보다 작으면 무시하고 start증가
			while(arr[end] > pivot) end--; // end 이동
			if(start <= end){
				swap(arr, start, end); // 교환
				start++;
				end--;
			}
		}
		return start; // 오른쪽 파트의 첫 번째에 start가 위치하게 되고, 이를 반환
	}
	private static void swap(int[] arr, int start, int end){
		int tmp = arr[start];
		arr[start] = arr[end];
		arr[end] = tmp;
	}
	private static void printArray(int[] arr){ // 프린트 메소드
		for(int data : arr){
			System.out.print(data + ", ");
		}
		System.out.println();
	}

	private static void main(String[] args){
		int[] arr = {3, 9, 4, 7, 5, 0, 1, 6, 8, 2};
		printArray(arr);
		quickSort(arr);
		printArray(arr);
	}
}
```