package io.github.wizwix.letsfutsal.rank;

import io.github.wizwix.letsfutsal.dto.UserDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/rank")
public class RankController {
  private final IRankService rankService;

  public RankController(IRankService rankService) {
    this.rankService = rankService;
  }

  @GetMapping
  public String rankPage(@RequestParam(name = "type", defaultValue = "individual") String type,
                         @RequestParam(name = "grade", defaultValue = "-1") int grade,
                         @RequestParam(name = "position", defaultValue = "") String position,
                         Model model) {
    if ("team".equals(type)) {
      // 팀 랭킹
      List<TeamRankDTO> teamRankings = rankService.getTeamRankings(grade);
      model.addAttribute("rankings", teamRankings);
      model.addAttribute("type", "team");
    } else {
      // 개인 랭킹 (기본값)
      List<UserDTO> userRankings = rankService.getUserRankings(grade, position);
      model.addAttribute("rankings", userRankings);
      model.addAttribute("type", "individual");
    }

    model.addAttribute("selectedGrade", grade);
    model.addAttribute("selectedPosition", position);

    return "rank/rank";
  }
}
