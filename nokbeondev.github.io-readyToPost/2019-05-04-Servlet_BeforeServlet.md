---
layout: post
title: "[DB&Java] DB와 DAO 연결"
comments: true
categories: DB_Java_connection
---

### 1. DAO 클래스에서 DB와 연결하기
DB와의 연결은 DAO 클래스에서 끝내야한다. Servlet으로 이 일을 넘기면 안된다. DAO 클래스에서 DB와 연결하기 위해 진행해야할 순서는 아래와 같다.

- JDBC 드라이버 로드
- DB연결
- **SQL 송신(Java -> DB)**
- 결과 수신
- DB 연결 닫기

### 2. SQL 송신 부분에서 알아야할 점
위의 순서 중에서 **SQL 송신**은 `executeQuery()`를 사용해서 인자로 SQL문을 작성하는 방식이 있다.
```java
Statement stmt = con.createStatement();
stmt.executeQuery("SELECT * FROM A WHERE id = '" + id + "' AND ...등)
```
위와 같이 괄호 안에 SQL문을 작성하려면 작은 따옴표, 큰 따옴표 등의 위치 때문에 헷갈린다. 지저분하기도 하다. 따라서 `Statement`의 자식인 `PreparedStatement`를 사용한다. `PreparedStatement`에서는 `?`을 사용하여 위의 방식보다 간단하게 구현할 수 있다.

```java
String sql = "SELECT WHERE id=? AND pwd=?";
PreparedStatement pstmt = con.preparedStatement;
pstmt.setString(1, id);
pstmt.setString(2, pwd);
pstmt.executeQuery();
```

### 3. 소스코드로 이애하는 DB연결

아래는 ProductDAOOracle 클래스이다. Product의 정보가 담긴 DB를 연결하는 자바 클래스이다.

```java
package com.my.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.my.exception.FindException;
import com.my.vo.Product;

public class ProductDAOOracle implements ProductDAO { // DB와의 연결은 DAO에서 끝내야한다.(Servlet으로 DB와의 일을 넘기지말아야함!)
	public ProductDAOOracle() throws ClassNotFoundException{
		// 1) JDBC 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	@Override
	public Product selectByNo(String s) throws FindException {
		return null;
	}

	@Override
	public List<Product> selectByName(String s) throws FindException {
		return null;
	}

	@Override
	public List<Product> selectAll() throws FindException {
 		//2)DB연결
  		String url = "jdbc:oracle:thin:@localhost:1521:xe";
  		String user = "hr";
  		String password = "hr";
  		java.sql.Connection  con = null;
  		try {
  			con =DriverManager.getConnection(url, user, password);
  			System.out.println("DB연결성공!");
  		} catch (SQLException e) {
  			e.printStackTrace();
  			throw new FindException(e.getMessage());
  		}
  		
  		String selectAllSQL = "SELECT * FROM product ORDER BY prod_no ASC"; //문자열 안에 세미콜론 들어가면 안된다!
  		PreparedStatement pstmt = null; // 송신 할 것 담는 변수
  		java.sql.ResultSet rs = null; // 수신 한 것 담는 변수

		try {
			pstmt = con.prepareStatement(selectAllSQL);
			rs = pstmt.executeQuery(); // 여기서 송수신 다 함 : 3)SQL 송신 -> 4) 결과 수신
			List<Product> productList = new ArrayList();

			//rs.next() -> 커서를 다음 행으로 내린다. 한 줄 씩 내려가며 스캔, 다음 행이 있으면 true 리턴
			while(rs.next()){
				//getString("컬럼명(대소문자 구분 없음)");은 해당 컬럼의 값을 가져온다.
                String prod_no = rs.getString("prod_no");
				String prod_name = rs.getString("prod_name");
				int prod_price = rs.getInt("prod_price");
				String prod_mfd = rs.getString("prod_mfd");
				productList.add(new Product(prod_no, prod_name, prod_price, prod_mfd));
			}
			return productList;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
		} finally { // 예외가 발생하던 안 하던 닫아야하므로 finally에 넣는다.
			//5)DB연결닫기
			try {
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

```
