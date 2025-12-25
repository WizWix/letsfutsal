package service;

import dto.UserDTO;
import java.util.List;

public interface UserService {
    void register(UserDTO user);
    UserDTO login(String email, String password);
    UserDTO getUserById(Long userId);
    boolean isEmailExists(String email);  // 이메일 중복 확인
    void updateUser(UserDTO user);  // 회원 정보 수정
    List<UserDTO> getAllUsers(String sortBy);  // 전체 회원 조회
}