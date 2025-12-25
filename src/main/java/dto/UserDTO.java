package dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private Long userId;
    private String email;
    private String password;
    private String nickname;
    private String createdAt;
    private String gender;              // MALE, FEMALE
    private String preferredPosition;   // 선호 포지션
    private String introduction;        // 자기소개
    private Long point;                 // 포인트
    private Integer grade;              // 등급
    
    
}