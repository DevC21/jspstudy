<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 요청 인코딩
    request.setCharacterEncoding("UTF-8");
  
    // 요청 파라미터
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String[] birthday = request.getParameterValues("birthday");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String[] phone = request.getParameterValues("phone");
    String phone_num = phone[1].substring(1, phone[1].length());
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <ul>
     <li>아이디: <%=id%></li>
     <li>비밀번호: <%=password%></li>
     <li>이름: <%=name%></li>
     <li>생년월일: <%=birthday[0]%>년 <%=birthday[1]%>월 <%=birthday[2]%>일</li>
     <li>성별: <%=gender%></li>
     <li>이메일: <%=email%></li>
     <li>휴대전화: <%=phone[0]%> <%=phone_num%></li>
  </ul>
</body>
</html>