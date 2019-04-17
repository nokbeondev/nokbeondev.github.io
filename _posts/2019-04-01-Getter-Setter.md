---
layout: post
title: "[Java] Getter()와 Setter()"
comments: true
categories: Java
---

### 1. 개념
클래스에서 `private`으로 선언한 변수나 메소드를 다른 클래스에서 사용하려면 Getter와 Setter가 필요하다.(아래의 예제 소스 코드를 참고)

###### Employee 클래스
아래의 `Employee` 클래스를 보면 인스턴스 필드에 `private`으로 접근 제한이 되어있다. 이를 `EmployeeDAO` 클래스에서 사용하려면 Getter(), Setter() 메소드를 사용해야한다.(public 으로 생성)

```java
package com.my.vo;

public class Employee {
	private String no;
	private String name;
	private String dept;
	private int sal;

	public Employee() {

	}

	public Employee(String no, String name, String dept, int sal) {
		this.no = no;
		this.name = name;
		this.dept = dept;
		this.sal = sal;
	}

	public void printInfo() {
		System.out.println("사번 : " + this.no + ", ");
		System.out.println("이름 : " + this.name + ", ");
		System.out.println("부서 : " + this.dept + ", ");
		System.out.println("급여 : " + this.sal);
	}
	
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}
}
```

###### EmployeeDAO 클래스
(public 으로 생성)
```java
package com.my.dao;
import com.my.vo.*;
import java.util.Scanner;

public class EmployeeDAO {
	public static Scanner sc = new Scanner(System.in);
	private Employee[] employees;
	private int cnt = 0;

	public EmployeeDAO(int size) { // DAO : Data Access Object (자료 처리하는 객체용 클래스)
		employees = new Employee[size];
	}

	public void add() {
		if (cnt >= 5) {
			System.out.println("5명 이상 등록할 수 없습니다!!");
		} else {
			System.out.println(">>사원 등록 작업<<");
			System.out.print("사번:");
			String no = sc.nextLine();
			System.out.print("이름:");
			String name = sc.nextLine();
			System.out.print("부서:");
			String dept = sc.nextLine();
			System.out.print("급여:");
			int sal = Integer.parseInt(sc.nextLine());
			Employee e = new Employee(no, name, dept, sal);
			employees[cnt] = e;
			cnt++;
		}
	}

	public void findAll() {
		System.out.println(">>전체 사원조회 작업<<");
		if (employees[0] == null) {
			System.out.println("등록된 사원이 없습니다.\n");
		} else {
			for (int i = 0; i < cnt; i++) {
				System.out.print((i + 1) + "번째 사원 -> ");
				System.out.print(" 사번 : " + employees[i].getNo() + ","); // getNo()로 다른 클래스의 private 변수 이용
				System.out.print(" 이름 : " + employees[i].getName() + ",");
				System.out.print(" 부서 : " + employees[i].getDept() + ",");
				System.out.print(" 급여 : " + employees[i].getSal());
				System.out.println();
			}
		}
		System.out.println();
	}

	public void findByNo() {
		if (employees[0] == null) {
			System.out.println("현재 시스템에 등록된 사원이 없습니다.");
		} else {
			System.out.println("찾고 싶은 사원의 사번을 입력하세요.");
			String no = sc.nextLine();
			for (int i = 0; i < cnt; i++) {
				if (employees[i].getNo().equals(no)) {
					System.out.println("검색하신 사원의 정보 입니다.");
					System.out.print(" 사번 : " + employees[i].getNo() + ",");
					System.out.print(" 이름 : " + employees[i].getName() + ",");
					System.out.print(" 부서 : " + employees[i].getDept() + ",");
					System.out.print(" 급여 : " + employees[i].getSal());
					System.out.println();
				}
			}

		}
	}

	public void findByName() {
		if (employees[0] == null) {
			System.out.println("현재 시스템에 등록된 사원이 없습니다.");
		} else {
			System.out.print("찾고 싶은 사원의 이름을 입력하세요 : ");
			String name = sc.nextLine();
			for (int i = 0; i < cnt; i++) {
				if (employees[i].getName().equals(name)) {
					System.out.println("검색하신 사원의 정보 입니다.");
					System.out.print(" 사번 : " + employees[i].getNo() + ",");
					System.out.print(" 이름 : " + employees[i].getName() + ",");
					System.out.print(" 부서 : " + employees[i].getDept() + ",");
					System.out.print(" 급여 : " + employees[i].getSal());
					System.out.println();
				}
			}
		}
	}
}


```