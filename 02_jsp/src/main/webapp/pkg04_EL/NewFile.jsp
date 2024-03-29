<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="pkg04_EL.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
  EL
  1. Expression Language (표현 언어)
  2. Bind 영역에 저장된 값을 나타낼 수 있다.
  3. JSP script element 중 하나인 표현식(<%=값%>을 대체할 수 있다.
  4. 형식
    ${값} 
--%>

<%--
  Bind 영역 (데이터 저장 영역>
  1. pageContext : this               : 현재 JSP 인 NewFile.jsp 에서만 접근 가능하다.
  1. request     : HttpServletRequest : 응답 전까지 접근 가능하다.
  3. session     : HttpSession        : 브라우저 닫기 전까지 접근 가능하다.
  4. application : ServletContext     : 애플리케이션 종료 전까지 접근 가능하다.
  
--%>

<%--
  JSP Bind 영역의 우선 순위
  1. 동일한 이름의 속성(Attribute)이 여러 영역에 동시에 존재하는 경우 우선적으로 사용되는 속성이 있다.
  2. 높은 순위                          낮은 순위
     pageContext > request > session > application
--%>

<%--
  JSP Bind 영역의 EL
--%>
    
<% int a = 10; request.setAttribute("abc", a); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  
  <%-- JSP Bind 영역에 데이터 저장하기 --%>
  <%
    pageContext.setAttribute("a", 1);
    request.setAttribute("a",2);
    session.setAttribute("a", 3);
    application.setAttribute("a", 4);
  %>

  <%-- JSP Bind 영역의 우선 순위 확인 --%>
  <div>${a}</div>
  <hr>
  
  <%-- JSP Bind 영역의 EL 내장 객체 확인 --%>
  <div>${pageScope.a}</div>
  <div>${requestScope.a}</div>
  <div>${sessionScope.a}</div>
  <div>${applicationScope.a}</div>
  <hr>
  
  <%-- JSP Bind 영역에 저장된 Java 객체 정보 확인 --%>
  <%
    Book book = Book.builder()
                  .title("소나기")
                  .author("황순원")
                  .price(10000)
                  .build();
    pageContext.setAttribute("book", book);
  %>
  <div>${book.title}</div>  <%-- book.getTitile() 방식으로 호출된다. --%>
  <div>${book.author}</div> <%-- book.getAuthor() 방식으로 호출된다. --%>
  <div>${book.price}</div>  <%-- book.getPrice() 방식으로 호출된다. --%>
  <hr>
  
  <%-- JSP Bind 영역에 저장된 Map 정보 확인 --%>
  <%
    Map<String, Object> map = Map.of("title", "어린왕자", "author", "생텍쥐베리", "price", "20000");
    pageContext.setAttribute("map", map);
  %>
  <div>${map.title}</div>
  <div>${map.author}</div>
  <div>${map.price}</div>
  <hr>
  <%-- List 에 Book 객체를 3개 저장하고 EL로 확인하기 --%>
  <%
    List<Book> list = new ArrayList<Book>();
  
    list.add(new Book("태백산맥", "조정래", 10000));
    list.add(new Book("토지", "박경리", 20000));
    list.add(new Book("어린왕자", "생텍쥐페리", 15000));
    pageContext.setAttribute("books", list);
  %>
  <%-- i 변수 처리가 안돼서 books의 0번째 인덱스 값만 나옴 --%>
  <% for(int i = 0; i < list.size(); i++) { %>
    <div>${books.get(i).title}</div>
    <div>${books.get(i).author}</div>
    <div>${books.get(i).price}</div>
  <% } %>
  <hr>
  
  <%-- EL 연산자 --%>
  <%
    pageContext.setAttribute("a", 5);
    pageContext.setAttribute("b", 2);
  %>
  <div>${a + b}</div>
  <div>${a - b}</div>
  <div>${a * b}</div>
  <div>${a / b}, ${a div b}</div>
  <div>${a % b}, ${a mod b}</div>
  <hr>
  
  <div>${a > b}, ${a gt b}</div>
  <div>${a >= b}, ${a ge b}</div>
  <div>${a < b}, ${a lt b}</div>
  <div>${a <= b}, ${a le b}</div>
  <div>${a == b}, ${a eq b}</div>
  <div>${a != b}, ${a ne b}</div>
  <hr>
  
  <div>${a == 5 && b == 5}, ${a eq 5 and b eq 5}</div>
  <div>${a == 5 || b == 5}, ${a eq 5 or b eq 5}</div>
  <div>${!(a == 5)}, ${not(a eq 5)}</div>
  <hr>
  
  <div>${a > 0 ? "양수" : "음수"}</div>
  <hr>
  
  <%--
    request 영역 사용시 주의사항
    
    1. 속성(Attribute)
       request.setAttribute("number", 10);
       request.getRequestDispather("/URLMapping").forward(request, response);
    
       ${number}, 숫자 타입
    
    2. 파라미터(Parameter)
       response.sendRedirect("/contextPath/URLMapping?number=10");
       
       ${param.number}, 문자열 타입
  --%>
  
</body>
</html>