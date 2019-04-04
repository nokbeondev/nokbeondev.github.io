---
layout: post
title: "Depth First Search (깊이 우선 탐색, DFS)"
---

### 1. 개념

임의의 노드에서 시작해서 다음 분기로 넘어가기 전에 해당 분기를 완벽하게 탐색하는 방법

- ###### 모든 노드를 방문하기 위해 쓰임
- ###### 단순 검색 속도 자체는 너비 우선 탐색(BFS)에 비해 느림
- ###### 재귀 순환 알고리즘 형태
- ###### 어떤 노드를 방문했는지 여부를 반드시 검사
- ###### 탐색 과정 예시

![탐색과정예시](http://nokbeondev.github.io/img/dfs-example.jpg)


### 2. 구현 - 순환 호출 이용
- ###### 구현에는 두 가지 방법이 있다(여기서는 한 가지만 소개)
 - ###### 순환 호출 이용
 - ###### 명시적인 스택 이용
   - ###### 명시적인 스택을 이용하여 방문한 정점들을 스택에 저장했다가 다시 꺼내서 작업한다.

```java
import java.io.*;
import java.util.*;

/* 인접 리스트를 이용한 방향성 있는 그래프 클래스 */
class Graph {
  private int V;   // 노드의 개수
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

  /** DFS에 의해 사용되는 함수 */
  void DFSUtil(int v, boolean visited[]) {
      // 현재 노드를 방문한 것으로 표시하고 값을 출력
      visited[v] = true;
      System.out.print(v + " ");

      // 방문한 노드와 인접한 모든 노드를 가져온다.
      Iterator<Integer> i = adj[v].listIterator();
      while (i.hasNext()) {
          int n = i.next();
          // 방문하지 않은 노드면 해당 노드를 시작 노드로 다시 DFSUtil 호출
          if (!visited[n])
              DFSUtil(n, visited); // 순환 호출
      }
  }

  /** 주어진 노드를 시작 노드로 DFS 탐색 */
  void DFS(int v) {
      // 노드의 방문 여부 판단 (초깃값: false)
      boolean visited[] = new boolean[V];

      // v를 시작 노드로 DFSUtil 순환 호출
      DFSUtil(v, visited);
  }

  /** DFS 탐색 */
  void DFS() {
      // 노드의 방문 여부 판단 (초깃값: false)
      boolean visited[] = new boolean[V];

      // 비연결형 그래프의 경우, 모든 정점을 하나씩 방문
      for (int i=0; i<V; ++i) {
          if (visited[i] == false)
              DFSUtil(i, visited);
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

    g.DFS(2); /* 주어진 노드를 시작 노드로 DFS 탐색 */
    g.DFS(); /* 비연결형 그래프의 경우 */
}
```

### 4. 복잡도

- ###### DFS는 그래프(정점의 수 : N, 간선의 수 : E)의 모든 간선을 조회한다.
 - ###### 인접 리스트로 표현된 그래프 : O(N+E)
 - ###### 인접 행렬로 표현된 그래프 : O(N^2)

- ###### 그래프 내에 적은 숫자의 간선만을 가지는 희소 그래프(Sparse Gragh)의 경우 인접 행렬보다 인접 리스트를 이용하는 것이 유리하다.

### 5. 참고
[https://gmlwjd9405.github.io/2018/08/14/algorithm-dfs.html](https://gmlwjd9405.github.io/2018/08/14/algorithm-dfs.html)