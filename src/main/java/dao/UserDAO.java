package dao;

import dto.UserDTO;
import java.util.List;

public interface UserDAO {

    void insertUser(UserDTO user);

    UserDTO selectUserByEmail(String email);

    UserDTO selectUserById(Long userId);

    void updateUser(UserDTO user);

    void deleteUser(Long userId);

    List<UserDTO> selectAllUsers(String sortBy);  // 전체 회원 조회 (정렬)
}
