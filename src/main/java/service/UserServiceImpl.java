package service;

import org.springframework.stereotype.Service;

import dao.UserDAO;
import dto.UserDTO;
import lombok.RequiredArgsConstructor;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    
    private final UserDAO userDAO;
    
    @Override
    public void register(UserDTO user) {
        // 비밀번호 암호화 추가 필요
        userDAO.insertUser(user);
    }
    
    @Override
    public UserDTO login(String email, String password) {
        UserDTO user = userDAO.selectUserByEmail(email);
        if(user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
    
    @Override
    public UserDTO getUserById(Long userId) {
        return userDAO.selectUserById(userId);
    }

    @Override
    public boolean isEmailExists(String email) {
        UserDTO user = userDAO.selectUserByEmail(email);
        return user != null;
    }

    @Override
    public void updateUser(UserDTO user) {
        userDAO.updateUser(user);
    }

    @Override
    public List<UserDTO> getAllUsers(String sortBy) {
        return userDAO.selectAllUsers(sortBy);
    }
}