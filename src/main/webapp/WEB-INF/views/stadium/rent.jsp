<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
<title>구장 대여 페이지</title>
<script>
  function confirmRent() {
    const time = document.querySelector('input[name="rentTime"]:checked');

    if (!time) {
      alert("대여 시간을 선택해주세요.");
      return false;
    }
    const isConfirmed = confirm("닉네임 : ${loginUser.nickname}\n구장 : ${stadium.name}\n대여 시간 : " + time.value + "\n\n대여하시겠습니까?");
    if (isConfirmed) {
      alert("예약이 완료되었습니다!");
      return true;
    }
    return false;
  }
</script>
</head>
<body>
  <h2>구장 대여 예약</h2>
  <p><b>구장 : </b> ${stadium.name}</p>
  <p><b>운영시간 : </b> ${stadium.startHour} ~ ${stadium.endHour}</p><br>
  <h3>대여 시간 선택</h3>
  <form action="${pageContext.request.contextPath}/stadium/rent/confirm" method="post"
    <c:if test="${not empty loginUser}">onsubmit="return confirmRent()"</c:if>>
    <input type="hidden" name="stadiumId" value="${stadium.stadiumId}">
    <c:set var="hour" value="${stadium.startHour.hour}" />
    <c:set var="end" value="${stadium.endHour.hour}" />
    <c:forEach var="h" begin="${hour}" end="${end - 2}" step="2">
      <label><input type="radio" name="rentTime" value="${h}:00 ~ ${h+2}:00">${h}:00 ~ ${h+2}:00</label>
      <br>
    </c:forEach>
    <br>
    <c:choose>
      <c:when test="${empty loginUser}">
        <button type="button" disabled>로그인 후 대여 가능</button>
      </c:when>
      <c:otherwise>
        <button type="submit">대여 예약하기</button>
      </c:otherwise>
    </c:choose>
  </form>
  <br>
  <a href="${pageContext.request.contextPath}/stadium/list">← 목록으로</a>
</body>
</html>
