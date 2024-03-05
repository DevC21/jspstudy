<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int x = (int)(Math.random() * 9) + 1;
   int y = (int)(Math.random() * 9) + 1;
%>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>

<style>

  #ans {
    width: 50px;
  }
  
</style>

<body>
  <div>
    <button type="button"' id="refresh">새로고침</button>
  </div>
  <div>
    <%=x%> X <%=y%> = 
    <input type="text" id="ans"> 
    <button type="button" id="calc">계산</button>
  </div>
  
  
  

  <script>
    let refresh = $('#refresh');
    let calc = $('#calc');
    let xy = <%=x%> * <%=y%>;
    let ans = 0;
    
    const getAnswer = ()=> {
    	ans =  $('#ans').val();
    	console.log(ans);
    	console.log(xy);
    	if(ans == xy)
    		alert('정답입니다.');
    	else
    		alert('오답입니다.');
    	location.reload(true);
    }
    
    refresh.on('click', ()=>{
    	location.reload(true);
    });
    
    calc.on('click', getAnswer);
  </script>
</body>
</html>