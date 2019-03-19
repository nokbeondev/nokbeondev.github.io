---
layout: post
title: "Breadth First Search 2 (백준 2178 미로찾기)"
---

### 1. 풀이
- ###### 시작점의 다음 좌표부터 가장 인점한 상하좌우 점들을 탐색하여 이동여부를 판단한다.
- ###### 이동 가능한 바로 다음 점(들)은 큐에 들어간다.
- ###### 큐에 들어있는 점(들)의 진행방향이 막혀있다면 큐에서 제거된다. (이 때, 카운팅은 continue에 의해 생략)
- ###### 큐에 들어있는 점(들)의 진행방향이 열려있다면 큐에 새로운 점(들)이 추가된다. (카운팅)

### 2. 소스코드

```java
import java.util.*;
import java.io.FileInputStream;

public class Main{
	static int[][] arr;
	static boolean[][] visited;
	static int[] dx = {-1, 0, 1, 0};
	static int[] dy = {0, -1, 0, 1};
	static int N, M;

	public static void main(String args[]) throws Exception{
		Scanner sc = new Scanner(System.in);
		//Scanner sc = new Scanner(new FileInputStream("input.txt"));

		N = sc.nextInt();
		M = sc.nextInt();
		sc.nextLine();
		arr = new int[N][M];
		visited = new boolean[N][M];

		for(int i = 0; i < N; i++){
			String str = sc.nextLine();
			for(int j = 0; j < M; j++){
				arr[i][j] = str.charAt(j) - '0'; // 아스키 코드로 계산해서 정수값 넣기
				visited[i][j] = false; // 일단 초기화 (아직 지나치지 않은 것으로, 0)
			}
		}
		visited[0][0] = true; // 출발점은 무조건 지나니까 1
		BFS(0, 0); // (0, 0)부터 시작
		System.out.println(arr[N-1][M-1]);
	}

	static public void BFS(int x, int y){ // 인풋으로 좌표 넣음

		Queue<Dot> q = new LinkedList<Dot>(); // 점을 넣을 큐 선언
		q.add(new Dot(x, y)); // 큐에 점을 넣음

		while(!q.isEmpty()){
			Dot d = q.poll(); // 지나갔든 지나가지 않았든 큐에서 점 제거
			for(int i = 0; i < 4; i++){ // 상하좌우 돌아가며 가능한 방향 찾기
				int nextX = d.x + dx[i]; // 큐에서 방금 나온 점의 좌표를 기준으로 방향 찾음
				int nextY = d.y + dy[i];

				if(nextX < 0 || nextY < 0 || nextX >= N || nextY >= M) continue; // 다음 좌표가 범위를 벗어나지 않는 상하좌우 방향 찾기
				if(visited[nextX][nextY] || arr[nextX][nextY] == 0) continue; // 이미 방문 했거나 다음 좌표가 벽이라면 다시 방향 찾기

				q.add(new Dot(nextX, nextY)); // 방향이 맞다면 큐에 점을 추가
				arr[nextX][nextY] = arr[d.x][d.y] + 1; // 한 칸씩 갈 수록 카운트
				visited[nextX][nextY] = true; // 지나간 좌표니까 표시
			}
		}
	}
}

class Dot{ // 좌표 클래스
	int x;
	int y;

	Dot(int x, int y){
		this.x = x;
		this.y = y;
	}
}
```