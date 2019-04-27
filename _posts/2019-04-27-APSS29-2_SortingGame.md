---
layout: post
title: "[APSS] Sorting Game - 29.2번 (BFS)"
comments: true
categories: Java_Algorithms
---

### 1. 문제

정수의 배열이 주어질 때 연속된 부분 구간의 순서를 뒤집는 것을 뒤집기 연산이라 부릅시다. 예를 들어 배열 {3, 4, 1, 2}에서 부분 구간 {4, 1, 2}를 뒤집으면 {3, 2, 1, 4}가 됩니다. 중복이 없는 정수 배열을 뒤집기 연산을 이용해서 정렬하려고 합니다. 필요한 최소한의 연산 수를 계산하는 프로그램을 작성하세요. 예를 들어 배열 {3, 4, 1, 2}는 {3, 4}와 {1, 2}를 각각 뒤집고 전체를 뒤집으면 세 번의 연산으로도 정렬할 수 있지만, {4, 1, 2}를 먼저 뒤집고, {3, 2, 1}을 뒤집으면 두 번의 연산만으로 정렬할 수 있습니다.

- 시간 및 메모리 제한
	- 프로그램은 2초 안에 실행되어야 하며, 64MB 이하의 메모리를 사용해야 합니다.

- 입력
입력의 첫 줄에는 테스트 케이스의 수 C(C <= 1000)가 주어지고, 각 테스트 케이스의 첫 줄에는 배열의 길이 n(1 <= ㅜ <= 8)이 주어집니다. 다음 줄에 n개의 정수로 배열의 원소들이 순서대로 주어집니다. 한 배열에 같은 수가 두 번 출현하지 않는다고 가정해도 좋습니다. 모든 수는 1이상 1백만 이하의 정수입니다.

- 출력
각 테스트 케이스마다 입력을 정렬하기 위해 필요한 최소 뒤집기 연산의 수를 출력합니다.

- 예제 입력
3
8
1 2 3 4 8 7 6 5
4
3 9999 1 2
3
1000 2000 3000

- 예제 출력
1
2
0

### 2. 풀이
```java
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.IOException; 
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList; 
import java.util.Arrays; 
import java.util.HashMap; 
import java.util.Iterator;
import java.util.LinkedList; 
import java.util.Map; 
import java.util.Queue; 
import java.util.Set; 
import java.util.StringTokenizer; 

public class APSS_sortgame { 
    public static int N;
    public static Map<Integer, Integer> toSort[];
    public static int[] firstSeq;
    public static int[] sorted;
    
    public static void main(String[] args) throws NumberFormatException, IOException { 
        
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out)); 
        
        int T = Integer.parseInt(br.readLine().trim()); 
        toSort = new HashMap[8];
        
        for(int i=0; i<8; i++){
            toSort[i] = new HashMap<Integer, Integer>();
        }
        
        for(int i=0; i<8; i++){ 
            sorted = new int[i+1]; 
            for(int j=0; j<i+1; j++){ 
                sorted[j] = j; 
            } 
            toSort[i].put(Arrays.hashCode(sorted), 0); 
            makeGraph(i+1);
        }
        
        for(int tc=0; tc<T; tc++){ 
            N = Integer.parseInt(br.readLine()); 
            firstSeq = new int[N]; 
            StringTokenizer st = new StringTokenizer(br.readLine()); 
            for(int i=0; i<N; i++){ 
                firstSeq[i] = Integer.parseInt(st.nextToken());   
            } 
            bw.write("" + solve(firstSeq) + "\n"); 
            bw.flush(); 
        } 
            bw.close();    
    }
    
    public static void makeGraph(int n){ 
        Queue<int[]> Q = new LinkedList<int[]>(); 
        Q.add(sorted); 
        
        while(!Q.isEmpty()){
            int[] nextSeq = Q.poll(); 
            int[] buffSeq; 
            int depth = toSort[n-1].get(Arrays.hashCode(nextSeq)); 
            for(int i=0; i<n; i++){ 
                for(int j=i+1; j<n; j++){ 
                    int h = j; 
                    buffSeq = new int[n]; 
                    for(int k=0; k<n; k++){ 
                        if(k >= i && k <= j){ 
                            buffSeq[k] = nextSeq[h]; 
                            h--; 
                        }else{ 
                            buffSeq[k] = nextSeq[k]; 
                        } 
                    } 
                    if(!(toSort[n-1].get(Arrays.hashCode(buffSeq)) != null )){
                        toSort[n-1].put(Arrays.hashCode(buffSeq), depth+1); 
                        Q.add(buffSeq);   
                    } 
                } 
            }
        }
    }
    
    public static int solve(int[] srcArr){ 
        int[] fixed = srcArr.clone();    
        for(int i=0; i<N; i++){
            int smaller = 0;
            for(int j=0; j<N; j++){ 
                if(srcArr[j] < srcArr[i]){ 
                    smaller++; 
                } 
            } 
            fixed[i] = smaller; 
        } 
        Map rtMap = toSort[N-1]; 
        int rtDepth = (int) rtMap.get(Arrays.hashCode(fixed)); 
        return rtDepth;
    }
}
```

### 3. 출처
Algorithmic Problem Solving Strategies; 프로그래밍 대회에서 배우는 알고리즘 문제해결전략 2권 - 구종만 저


