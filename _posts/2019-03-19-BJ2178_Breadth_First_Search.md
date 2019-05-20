---
layout: post
title: "[Baekjoon] 미로찾기 - 2178번 (BFS)"
comments: true
categories: Java_Algorithms
---

### 1. 풀이

![풀이그림1]()


![풀이그림2]()

![풀이그림3]()


![풀이그림4]()


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