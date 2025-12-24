<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, team.dto.TeamDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>전체 팀 목록</h2>

	<ul>
		<%
    List<TeamDto> teams = (List<TeamDto>) request.getAttribute("teams");

    if (teams == null || teams.isEmpty()) {
		%>
		<li>등록된 팀이 없습니다.</li>
		<%
    } else {
        for (TeamDto t : teams) {
		%>
		<li><a
			href="<%=request.getContextPath()%>/team/profile/<%=t.getTeam_id()%>">
				<%=t.getTeam_id()%>
		</a></li>
		<%
        }
    }
		%>
	</ul>

	<br>
	<a href="<%=request.getContextPath()%>/team">메인으로</a>

</body>
</html>