---
layout: post
title: "[Baekjoon] 미로찾기 - 2178번 (BFS)"
comments: true
categories: Java_Algorithms
---

### 1. 풀이

![풀이그림1](https://nokbeondev.github.io/img/bj2178-pic1.JPG)

위의 그림과 같이 탐색 순서는 '우->좌->상->하'이며 이 순서가 어떻든 결과를 도출하는데에 문제 없다. 검은색은 벽이고, 초록색이 최단 거리이다. 붉은색은 **최단 거리가 아닌 길 중에 하나**이다.

여기서 주의 깊게 살펴볼 것은 **M의 위치**에서의 행보이다. 소스 코드를 분석해보면 정답이 아닌 길인 L방향, 정답인 길인 N방향 모두 큐에 담긴다. 이 부분에서 추상적으로 생각했을 때, 카운트 방식에 대한 의문이 들 수 있다. 아래 그림은 M부터 시작해서 N방향으로 가서 도착하는 정답인 길에 대한 카운팅(초록색)과 M에서 L로 돌아가는 정답이 아닌 길에 대한 카운팅(붉은색)을 다룬 그림이다.

소스 코드를 보면 `main()` 메소드에 결과를 마지막 배열 칸(Y)에 담아서 출력하는 것을 볼 수 있다. 따라서 최단경로만이 Y에 먼저 도달하여 최단 거리 값을 저장하고 Y를 큐에서 빼낸다. 최단 경로가 아닌 길은 Y를 만나지 못 한 채 큐에서 모두 제거된다. 그렇기에 이 코드에서 `while`문 안에 처음 나오는 `q.poll()`의 역할이 매우 중요한 것을 알 수 있다.(`q.poll()`은 큐에서 꺼낸 위치를 기준으로 탐색하게 하고, 카운팅 할 수 있게 하며, 이를 제거하므로써 최단 거리 값만 Y에 저장될 수 있게 돕는다.)

![풀이그림2](https://nokbeondev.github.io/img/bj2178-pic2.JPG)

![풀이그림3](https://nokbeondev.github.io/img/bj2178-pic3.JPG)

여기서 Y에 정답인 9가 담겨서 빠져나오고 `main()`에서 이를 출력한다.

![풀이그림4](https://nokbeondev.github.io/img/bj2178-pic4.JPG)

X에 11이 담기지만 Y는 이미 빠져나갔고 이미 방문했기 때문에 출력되지 못하고 끝난다.

이 소스 코드로는 **A-B-C-D-E-J-O-T-Y**의 경로가 진행되어 정답을 구했을 것이다. 이는 위에서 언급한 탐색 순서인 '우->좌->상->하'가 원인이다. 탐색 순서를 바꾸면 다른 방법으로 최단 경로에 도달할 수도 있다.(언급했듯이 정답을 구하는데에는 어떤 순서든 괜찮다.)

### 2. 소스코드

```java
package bj;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

class Dot{ // 현재의 위치 정보를 가지고 있는 객체
	int x;
	int y;
	
	Dot(){	
	}
	
	Dot(int x, int y){
		this.x = x;
		this.y = y;
	}
}

public class bj2178{
	public static int[][] map;
	public static String N;
	public static String M;
	public static boolean[][] visited;
	public static int[] dx ={0, 0, -1, 1};
	public static int[] dy ={1, -1, 0, 0};
	
	public static void minPath(int[][] map, int n, int m){// 최단 경로 구하는 메소드
		Queue<Dot> q = new LinkedList<Dot>();
		visited = new boolean[n][m]; // 방문 여부
		
		visited[0][0] = true; // 첫 번째 위치에 방문 표시
		map[0][0] = 1; // 첫 번째 위치는 길이여야만 한다.
		q.add(new Dot(0, 0)); // 첫 번째 위치 큐에 넣기
		
		int nextX = 0;
		int nextY = 0;
		
		while(!q.isEmpty()) {
			Dot d = q.poll();
			
			for(int i=0; i<4; i++) {
				nextX = d.x + dx[i];
				nextY = d.y + dy[i];
				
				if(nextX<0 || nextY<0 || nextX>=n || nextY>=m) { // 미로의 경계 밖은 고려하지 않는다.
					continue;
				}
				if(visited[nextX][nextY] || map[nextX][nextY] == 0) { // 이미 방문했거나, 벽이면 고려하지 않는다.
					continue;
				}
				
				q.add(new Dot(nextX, nextY)); // 이동 가능한 위치를 큐에 담는다.
				map[nextX][nextY] = map[d.x][d.y] + 1; // 숫자 1이 이동 가능한 길을 의미하므로 1씩 더해주며 map에 직접 카운팅
				visited[nextX][nextY] = true; // 방문 했으니 true
			}
		}
	}

	public static void main(String[] args) throws IOException{

		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer(bf.readLine()); //StringTokenizer인자값에 입력 문자열 넣음
		
		int n = Integer.parseInt(st.nextToken()); //첫번째 호출
		int m = Integer.parseInt(st.nextToken()); //두번째 호출
		
		map = new int[n][m];

		for(int i=0; i<n; i++){ // 미로를 입력한다.
			String[] tmp = new String[m];
			String str = bf.readLine();
		
			tmp = str.split("");
			
			for(int j=0; j<m; j++){
				map[i][j] = Integer.parseInt(tmp[j]);
			}
		}
		
		minPath(map, n, m);
		System.out.println(map[n-1][m-1]); // 결과 출력
	}
}

```