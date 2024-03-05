<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

  // 요청 인코딩
  request.setCharacterEncoding("UTF-8");

  // 요청 파라미터
  LocalDateTime now = LocalDateTime.now();
  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
  String createdAt = dtf.format(now);
  String author = request.getParameter("author");
  String title = request.getParameter("title");
  String contents = request.getParameter("contents");
  
  // 업로드 경로
  String uploadPath = application.getRealPath("upload");
  
  File uploadDir = new File(uploadPath);
  if(!uploadDir.exists()){
    uploadDir.mkdirs();
  }
  
  // 업로드 파일명
  String uploadName = createdAt + "-" + author + "-" + title + ".txt";
  
  // 업로드 파일명을 세션에 등록하기
  session.setAttribute("uploadName", uploadName);
  
  // 업로드 파일 객체
  File uploadFile = new File(uploadDir, uploadName);
  
  // 문자 출력 스트림 생성
  BufferedWriter writer = new BufferedWriter(new FileWriter(uploadFile));
  
  // 문자 출력 스트림으로 데이터 내보내기
  writer.write(contents + "\n");
  writer.flush();
  writer.close();
%>

<script>
  alert('<%=uploadName%> 파일이 생성되었습니다.');
</script>