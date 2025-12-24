<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.dto.TeamDto" %>
<%
    TeamDto team = (TeamDto)request.getAttribute("team");

    if (team == null) {
%>
    <h2>팀 정보를 찾을 수 없습니다.</h2>
    <a href="<%=request.getContextPath()%>/team/list">목록으로</a>
<%
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>${team.team_id}</h2>

	팀 이름 :
	<%=team.getTeam_id()%><br> 성별 :
	<%=team.getGender()%><br> 등급 :
	<%=team.getMin_grade()%>
	~
	<%=team.getMax_grade()%><br> 지역 :
	<%=team.getRegion()%><br> 소개 :
	<%=team.getIntroduction()%><br>

	<br>
	<a href="${pageContext.request.contextPath}/team/list">목록으로</a>

</body>
</html>