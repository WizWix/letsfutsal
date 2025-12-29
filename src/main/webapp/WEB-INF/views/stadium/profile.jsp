<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
<title>구장 정보</title>
</head>
<body>
  <h2>${stadium.name}</h2>
  <p><b>지역 : </b> ${stadium.region}</p>
  <p><b>주소 : </b> ${stadium.location}</p>
  <p><b>운영시간 : </b> ${stadium.startHour} ~ ${stadium.endHour}</p>
  <p>${stadium.introduction}</p>
  <c:choose>
    <c:when test="${empty loginUser}">
      <button disabled>로그인 후 예약 가능</button>
    </c:when>
    <c:otherwise>
      <a href="${pageContext.request.contextPath}/stadium/rent/${stadium.stadiumId}">
        <button>대여 예약하기</button>
      </a>
    </c:otherwise>
  </c:choose>
</body>
</html>
