---
layout: post
title: "Breadth First Search (너비 우선 탐색, BFS)"
---

### 1. 개념

- #### 그래프 탐색
하나의 정점으로부터 모든 정점을 차례대로 한 번씩 방문

- #### BFS
임의의 노드에서 시작해서 인접한 노드를 먼저 탐색하는 방법

 - ###### 두 노드 간 최단경로, 임의의 경로 찾는 경우에 사용
 - ###### 재귀적으로 동작하지 않음
 - ###### 노드 방문 여부를 반드시 검사
 - ###### 선입선출(FIFO) 원칙으로 탐색해야하므로 Queue를 사용
 - ###### 탐색 과정 예시
![탐색과정예시](C:\nokbeondev.github.io\img\bfs-example.jpg)

### 2. 구현
```java
import java.io.*;
import java.util.*;

/* 인접 리스트를 이용한 방향성 있는 그래프 클래스 */
class Graph {
  private int V; // 노드의 개수
  private LinkedList<Integer> adj[]; // 인접 리스트

  /** 생성자 */
  Graph(int v) {
    V = v;
    adj = new LinkedList[v];
    for (int i=0; i<v; ++i) // 인접 리스트 초기화
      adj[i] = new LinkedList();
  }

  /** 노드를 연결 v->w */
  void addEdge(int v, int w) { adj[v].add(w); }

  /** s를 시작 노드으로 한 BFS로 탐색하면서 탐색한 노드들을 출력 */
  void BFS(int s) {
    // 노드의 방문 여부 판단 (초깃값: false)
    boolean visited[] = new boolean[V];
    // BFS 구현을 위한 큐(Queue) 생성
    LinkedList<Integer> queue = new LinkedList<Integer>();

    // 현재 노드를 방문한 것으로 표시하고 큐에 삽입(enqueue)
    visited[s] = true;
    queue.add(s);

    // 큐(Queue)가 빌 때까지 반복
    while (queue.size() != 0) {
      // 방문한 노드를 큐에서 추출(dequeue)하고 값을 출력
      s = queue.poll();
      System.out.print(s + " ");

      // 방문한 노드와 인접한 모든 노드를 가져온다.
      Iterator<Integer> i = adj[s].listIterator();
      while (i.hasNext()) {
        int n = i.next();
        // 방문하지 않은 노드면 방문한 것으로 표시하고 큐에 삽입(enqueue)
        if (!visited[n]) {
          visited[n] = true;
          queue.add(n);
        }
      }
    }
  }
}

```

### 3. 사용법
```java
/** 사용 방법 */
public static void main(String args[]) {
  Graph g = new Graph(4);

  g.addEdge(0, 1);
  g.addEdge(0, 2);
  g.addEdge(1, 2);
  g.addEdge(2, 0);
  g.addEdge(2, 3);
  g.addEdge(3, 3);

  g.BFS(2); /* 주어진 노드를 시작 노드로 BFS 탐색 */
}
```

### 4. 복잡도
- ###### 인접 리스트로 표현된 그래프 : O(N+E)
- ###### 인접 행렬로 표현된 그래프 : O(N^2)
- ###### 깊이 우선 탐색(DFS)과 마찬가지로 그래프 내에 적은 숫자의 간선만 가지는 희소 그래프(Sparse Gragh)의 경우 인접 행렬보다 인접 리스트를 이용하는 것이 유리하다.
- - -

### 5. 참고
[https://gmlwjd9405.github.io/2018/08/15/algorithm-bfs.html]()