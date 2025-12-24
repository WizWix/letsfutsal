package team.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import team.dto.TeamDto;
import team.service.TeamService;

// 팀 목록, 팀 생성, 팀 개별 페이지
@WebServlet("/team/*")
public class TeamController extends HttpServlet {

	private final TeamService service = new TeamService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String path = req.getPathInfo();

		// /team 또는 /team/
		if (path == null || path.equals("/")) {
			req.getRequestDispatcher("/WEB-INF/views/team/main.jsp").forward(req, resp);
		}
		// /team/list
		else if (path.equals("/list")) {
			req.setAttribute("teams", service.list()); // ⭐ 핵심
			req.getRequestDispatcher("/WEB-INF/views/team/list.jsp").forward(req, resp);
		}
		// /team/create
		else if (path.equals("/create")) {
			req.getRequestDispatcher("/WEB-INF/views/team/create.jsp").forward(req, resp);
		}
		// /team/profile/{team_id}
		else if (path.startsWith("/profile/")) {
			String teamId = path.substring("/profile/".length());
			req.setAttribute("team", service.get(teamId));
			req.getRequestDispatcher("/WEB-INF/views/team/profile.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		req.setCharacterEncoding("UTF-8");

		TeamDto dto = new TeamDto();
		dto.setTeam_id(req.getParameter("team_id"));
		dto.setGender(req.getParameter("gender"));
		dto.setMin_grade(req.getParameter("min_grade"));
		dto.setMax_grade(req.getParameter("max_grade"));
		dto.setRegion(req.getParameter("region"));
		dto.setIntroduction(req.getParameter("introduction"));

		service.create(dto);
		resp.sendRedirect(req.getContextPath() + "/team"); // 생성 후 목록으로 이동
	}
}
