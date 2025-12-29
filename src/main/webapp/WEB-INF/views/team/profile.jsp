<%@ page import="io.github.wizwix.letsfutsal.dto.TeamDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>팀 개별 페이지</title>
</head>
<script>
  const isLogin = ${loginUser != null};
  function joinTeam() {
    if (!isLogin) {
      alert("로그인 후 가입 가능합니다.");
      return;
    }
    const isConfirmed = confirm("닉네임 : ${loginUser.nickname}\n팀 이름 : ${team.teamName}\n\n해당 팀에 가입하시겠습니까?");
    if (isConfirmed) {
      alert("가입이 완료되었습니다!");
      location.href = "${pageContext.request.contextPath}/team/list";
    }
  }
</script>
<%
  var team = (TeamDTO) request.getAttribute("team");

  String genderStr = team.getGender().toString();
  String gender = switch (genderStr) {
    case "MALE" -> "남성 전용";
    case "FEMALE" -> "여성 전용";
    case "BOTH" -> "무관";
    default -> "";
  };
  pageContext.setAttribute("gender", gender);

  String minGrade = switch ((int) team.getMinGrade()) {
    case 0 -> "미배정";
    case 1 -> "초보";
    case 2 -> "중수";
    case 3 -> "고수";
    default -> String.valueOf(team.getMinGrade());
  };
  pageContext.setAttribute("minGrade", minGrade);
  String maxGrade = switch ((int) team.getMinGrade()) {
    case 0 -> "미배정";
    case 1 -> "초보";
    case 2 -> "중수";
    case 3 -> "고수";
    default -> String.valueOf(team.getMinGrade());
  };
  pageContext.setAttribute("maxGrade", maxGrade);
%>
<body>
  <h2>${team.teamName}</h2>
  성별 : ${gender}<br>
  최소 등급 : ${minGrade}<br>
  최대 등급 : ${maxGrade}<br>
  지역 : ${team.region}<br>
  소개 :
  <p>${team.introduction}</p>
  팀 주장 : ${team.leaderNickname}<br><br>
  <!-- 버튼 하나만 사용 -->
	<button type="button" onclick="joinTeam()">팀 가입하기</button>
  <br><br>
  <a href="${pageContext.request.contextPath}/team/list">← 팀 목록으로</a>
</body>
</html>
