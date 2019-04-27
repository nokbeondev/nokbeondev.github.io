class Node {
	int data;
	Node next = null;

	Node(int d){
		this.data = d;
	}

	void append(int d){ // 새로운 노드를 맨 뒤에 붙인다.
		Node end = new Node(d);
		Node n = this;

		while(n.next != null){
			n = n.next;
		}
		n.next = end;
	}

	void delete(int d){
		Node n = this;
		while (n.next != null){
			if(n.next.data == d){
				n.next = n.next.next;
			}else{
				n = n.next;
			}
		}
	}

	void retrieve(){ // 처음부터 끝까지 노드를 출력하는 메소드
		Node n = this;
		while (n.next != null){
			System.out.print(n.data + " -> ");
			n = n.next;
		}
		System.out.println(n.data);
	}
}

public class SinglyLinkedList{
	public static void main(String[] args){ // 사용 예제
		Node head = new Node(10); // 생성과 동시에 첫 번째 노드에 1을 넣기
		head.append(20);
		head.append(30);
		head.append(40);
		head.append(50);
		head.retrieve(); // 출력하여 값이 잘 들어갔나 확인
		/*
			결과값은 아래와 같이 나오게 된다.
			10 -> 20 -> 30 -> 40 -> 50
		*/

		head.delete(20);
		head.retrieve(); // 이렇게 출력하면 
		/*
			결과값
			10 -> 30 -> 40 -> 50
		*/

	}
}