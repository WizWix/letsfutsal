<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 생성 페이지</title>
</head>
<body>

  <h2>팀 생성</h2>
  <form action="${pageContext.request.contextPath}/team" method="post">
    팀 이름 : <input name="teamId"><br>
    성별 : <input type="radio" name="gender" value="혼성">혼성
        <input type="radio" name="gender" value="남성">남성
        <input type="radio" name="gender" value="여성">여성<br>
    최소 등급 : <select name="minGrade">
      <option value="0">무관</option>
      <option value="1">1 초보</option>
      <option value="2">2 중수</option>
      <option value="3">3 고수</option>
    </select> 최대 등급 : <select name="maxGrade">
      <option value="0">무관</option>
      <option value="1">1 초보</option>
      <option value="2">2 중수</option>
      <option value="3">3 고수</option>
    </select><br> 지역 : <select name="region">
      <option>서울</option>
      <option>경기</option>
      <option>강원</option>
      <option>충청</option>
      <option>전라</option>
      <option>경상</option>
      <option>제주</option>
    </select><br> 소개 :<br>
    <textarea name="introduction"></textarea>
    <br>
    <button type="submit">생성하기</button>
  </form>
</body>
</html>
