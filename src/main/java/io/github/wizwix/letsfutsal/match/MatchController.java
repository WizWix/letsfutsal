package io.github.wizwix.letsfutsal.match;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/match")
public class MatchController {
  private final MatchService matchService;

  public MatchController(MatchService matchService) {
    this.matchService = matchService;
  }

  // 경기 상세 보기
  @GetMapping("/{id}")
  public String detail(@PathVariable("id") Long id, Model model) {
    MatchDTO match = matchService.getMatchById(id);
    if (match == null) {
      return "redirect:/match";
    }

    model.addAttribute("match", match);
    return "match/detail";
  }

  // 경기 목록 조회
  @GetMapping
  public String list(@RequestParam(name = "type", required = false, defaultValue = "all") String type,
                     @RequestParam(name = "region", required = false) String region,
                     @RequestParam(name = "startHour", required = false) String startHour,
                     @RequestParam(name = "endHour", required = false) String endHour,
                     @RequestParam(name = "gender", required = false) String gender,
                     @RequestParam(name = "minGrade", required = false) Integer minGrade,
                     @RequestParam(name = "maxGrade", required = false) Integer maxGrade,
                     @RequestParam(name = "status", required = false) Integer status,
                     Model model) {

    List<MatchDTO> matches = matchService.getMatchList(type, region, startHour, endHour, gender, minGrade, maxGrade, status);

    model.addAttribute("matches", matches);
    model.addAttribute("type", type != null ? type : "all");
    model.addAttribute("region", region);
    model.addAttribute("startHour", startHour);
    model.addAttribute("endHour", endHour);
    model.addAttribute("gender", gender);
    model.addAttribute("minGrade", minGrade);
    model.addAttribute("maxGrade", maxGrade);
    model.addAttribute("status", status);

    return "match/list";
  }
}
