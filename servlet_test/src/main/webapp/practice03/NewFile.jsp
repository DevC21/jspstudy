<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
  
  <%! 
      public String getNowDate() {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String result = dtf.format(now);
        return result;
      }
      
      public String getNowTime() {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
        String result = dtf.format(now);
        return result;
      }
  
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
  <div>
    <select id="now">
      <option value="1">현재날짜</option>
      <option value="2">현재시간</option>
    </select>
    <button type="button" id="request">요청하기</button>
  </div>
  <script>
    let request = $('#request');
    
    const getNow = ()=> {
    	let now = $('#now option:selected');

      if(now.val() == 1)
    	  alert('요청 결과는 <%=getNowDate()%>입니다.');
    	else if(now.val() == 2)
        alert('요청 결과는 <%=getNowTime()%>입니다.');
    }
    
    request.on('click', getNow);
  </script>
</body>
</html>