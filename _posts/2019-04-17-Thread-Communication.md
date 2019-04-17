---
layout: post
title: "[Java] Thread를 이용한 통신"
---

### 1. 서버와 클라이언트의 통신 프로세스
![서버와클라이언트의통신프로세스](https://nokbeondev.github.io/img/ThreadCommunication.JPG)

### 2. 예제를 통한 설명

- 서버

```java
package broadcast;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Vector;

class ThreadServer extends Thread{	
	Vector<ThreadServer> list;
	DataInputStream dis;
	DataOutputStream dos;
	Socket s;
	String clientIPAddress;
    
	ThreadServer(Socket s, Vector<ThreadServer> list) throws IOException{
		this.list = list; 
		this.s = s;				
		dis = new DataInputStream(s.getInputStream());
		dos = new DataOutputStream(s.getOutputStream());
		InetAddress clientIP = s.getInetAddress();
		clientIPAddress = clientIP.getHostAddress();
		broadcast("접속했습니다.");
		//System.out.println("클라이언트와 접속성공!");
	}
    
	public void run(){		
		String receiveMsg="quit";
		try {
			while(!(receiveMsg = receive()).equals("quit")){
				//send(receiveMsg);	
				broadcast(receiveMsg);
			}
		} catch(SocketException e) {					
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//System.out.println("클라이언트와의 연결이 끊겼습니다");
			broadcast("나갔습니다.");
			try {
				s.close();
			}catch(IOException e) {			
            
			}
		}
	}
    
	public String receive() throws IOException {
		return dis.readUTF();
	}
    
	public void broadcast(String msg) {		
		for(int i=0; i<list.size(); i++) {
			ThreadServer t = list.get(i);			
			try {
				t.send(clientIPAddress + ">" + msg);
			} catch (IOException e) {
				e.printStackTrace();
				list.remove(t);
			}			
		}
	}
    
	public void send(String msg) throws IOException {
		dos.writeUTF(msg);
	}
}

public class TCPThreadServer {
	public final static int PORT=5432;
	ServerSocket ss;
	Socket s;
	Vector<ThreadServer> list;
	public TCPThreadServer() {
		this(PORT);
	}
	
	public TCPThreadServer(int port) {
		try {
			ss = new ServerSocket(port);//포트열기
			list = new Vector<>();
			while(true){//1)
				try {
					s = ss.accept();//클라이언트 기다리기
					//새로운 스레드 시작
					ThreadServer t = 
							new ThreadServer(s, list);
					list.add(t);
					t.start();
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new TCPThreadServer();
		//new TCPServer(6543);
	}
}
```

- 클라이언트 메인 Thread 부분

```java
package broadcast;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

public class TCPClient {
	public final static String TEACHER = "183.101.196.162"; // 선생님
	public final static String LEE = "192.168.15.17"; // 이**
	public final static String HYUN = "192.168.16.12"; // 현**
	public final static String NAM = "192.168.16.59"; // 남**
	public final static String JUNG = "192.168.16.47"; // 정**
	public final static String SO = "192.168.16.23"; // 소**
	public final static String TEST = "127.0.0.1"; // Test용, 127.0.0.1라는 ip는 인터넷 없이도 혼자 Test할 수 있는 ip

	Socket s;
	DataOutputStream dos;
	DataInputStream dis;
    
	public TCPClient() throws UnknownHostException, IOException {
		this(TEST);
	}
    
	public TCPClient(String ip) throws UnknownHostException, IOException {
		s = new Socket(ip, TCPThreadServer.PORT);
        
		try {
			dos = new DataOutputStream(s.getOutputStream());
			dis = new DataInputStream(s.getInputStream());
		
			Scanner sc = new Scanner(System.in);
			String line;
			do {
				line = sc.nextLine();
				send(line);
				String receiveMsg = receive();
				System.out.println("서버가 보낸 msg:"
						+ receiveMsg);
			}while(!line.equals("quit"));
		} catch(EOFException e) {			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
	}
    
	public String receive() throws IOException {
		return dis.readUTF();
	}
    
	public void send(String msg) throws IOException {
		dos.writeUTF(msg);
	}
	
	public static void main(String[] args) {		
		try {
			new TCPClient();
		} catch (UnknownHostException e) {
			System.out.println("서버IP를 확인하세요");
		} catch(ConnectException e) {
			System.out.println("서버와 연결이 거절됐습니다. port번호 확인, 서버가 켜졌는지 확인!");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
```

- 클라이언트 새로운 Thread 부분

```java
package broadcast;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

class ThreadClient extends Thread{
	DataInputStream dis;
	Socket s;
	ThreadClient(Socket s) throws IOException{
		this.s = s;
		dis = new DataInputStream(s.getInputStream());
	}

	public void run() {
		try {
			while(true) {				
				String receiveMsg = receive();
				System.out.println(receiveMsg);
			}
		}catch(IOException e) {			
		}finally {
			try {
				s.close();
			}catch(Exception e) {				
			}
		}
	}
    
	public String receive() throws IOException {
		return dis.readUTF();
	}
}

public class TCPThreadClient {
	public static final String IP="183.101.196.162";
	Socket s;
	DataOutputStream dos;
	
	public TCPThreadClient() throws UnknownHostException, IOException {
		this(IP);
	}
	public TCPThreadClient(String ip) throws UnknownHostException, IOException {
		s = new Socket(ip, TCPThreadServer.PORT);
		try {
			dos = new DataOutputStream(s.getOutputStream());
			ThreadClient t = 
					new ThreadClient(s);
			t.start();
			Scanner sc = new Scanner(System.in);
			String line;
			do {
				line = sc.nextLine();
				send(line);
			}while(!line.equals("quit"));
		} catch(EOFException e) {			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
	}	
		
	public void send(String msg) throws IOException {
		dos.writeUTF(msg);
	}
	
	public static void main(String[] args) {		
		try {
			new TCPThreadClient();
		} catch (UnknownHostException e) {
			System.out.println("서버IP를 확인하세요");
		} catch(ConnectException e) {
			System.out.println("서버와 연결이 거절됐습니다. port번호 확인, 서버가 켜졌는지 확인!");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
```