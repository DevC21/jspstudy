<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>

<style>
  label {
    font-weight: bold;
  }
  
  #birthday {
    width: 50px;
  }
  
  #phone {
    width: 100px;
  }
</style>

<body>
  
  <% String contextPath = request.getContextPath(); %>
  
  <!-- <form> 태그 요청 -->
  <form id="frm" method="POST" action="<%=contextPath%>/practice01/print.jsp">
    <div class="inp_wrap">
      <label for="id">아이디</label><br>
      <input type="text" name="id" id="id">
      @naver.com
    </div>
    <br>
    <div class="inp_wrap">
      <label for="password">비밀번호</label><br>
      <input type="password" name="password" id="password">
    </div>
    <br>
    <div class="inp_wrap">
      <label for="passwordchk">비밀번호 재확인</label><br>
      <input type="password" name="passwordchk" id="passwordchk">
    </div>
    <br>
    <div class="inp_wrap">
      <label for="name">이름</label><br>
      <input type="text" name="name" id="name">
    </div>
    <br>
    <div class="inp_wrap">
      <label for="birthday">생년월일</label><br>
      <input type="text" name="birthday" id="birthday" placeholder="년(4자)">
        <select name="birthday" id="birthday">
          <option selected disabled hidden>월</option>
          <% for(int m = 1; m <= 12; m++) { %>
            <option value="<%=m%>"><%=m%>월</option>
          <% } %>
        </select>
        <input type="text" name="birthday" id="birthday" placeholder="일">
    </div>
    <br>
    <div class="inp_wrap">
      <label for="gender">성별</label><br>
      <select name="gender">
        <option selected disabled hidden>성별</option>
        <option>남자</option>
        <option>여자</option>
      </select>
    </div>
    <br>
    <div class="inp_wrap">
      <label for="email">본인 확인 이메일(선택)</label><br>
      <input type="text" name="email" id="email" placeholder="선택입력">
    </div>
    <br>
    <div class="inp_wrap">
      <label for="phone">휴대전화</label><br>
      <select name="phone">
        <option value="+82">대한민국 +82</option>
      </select><br>
      <input type="text" name="phone" id="phone" placeholder="전화번호 입력">
      <button type="button" name=Authentication id="Authentication">인증번호 받기</button><br>
      <input type="text" name="Authentication" id="Authentication" disabled="disabled" placeholder="인증번호 입력하세요">
    </div>
    <br>
    <div class="btn-wrap">
      <button type="submit">가입하기</button>
    </div>
  </form>
  
  <script>
  
    document.getElementById('frm').addEventListener('submit', (evt)=>{

      // 필수 검사
      let id = document.getElementById('id');
      if(id.value === ''){
        alert('아이디는 필수입니다.');
        id.focus();
        evt.preventDefault();  // submit 방지
        return;                // 함수 종료
      }
      
      let password = document.getElementById('password');
      let passwordchk = document.getElementById('passwordchk');
      if(password.value === ''){
          alert('비밀번호를 확인하세요');
          password.focus();
          evt.preventDefault();  // submit 방지
          return;                // 함수 종료
      }
      if(password.value !== passwordchk.value){
          alert('비밀번호를 확인하세요');
          password.focus();
          evt.preventDefault();  // submit 방지
          return;                // 함수 종료
        }
      
    })
  
  </script>
</body>
</html>