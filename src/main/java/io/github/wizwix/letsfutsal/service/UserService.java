package io.github.wizwix.letsfutsal.service;

import org.springframework.stereotype.Service;

import io.github.wizwix.letsfutsal.mapper.UserMapper;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService {

    private final UserMapper userMapper;

    @Override
    public void register(UserDTO user) {
        // 비밀번호 암호화 추가 필요
        userMapper.insertUser(user);
    }

    @Override
    public UserDTO login(String email, String password) {
        UserDTO user = userMapper.selectUserByEmail(email);
        if(user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public UserDTO getUserById(Long userId) {
        return userMapper.selectUserById(userId);
    }

    @Override
    public boolean isEmailExists(String email) {
        UserDTO user = userMapper.selectUserByEmail(email);
        return user != null;
    }

    @Override
    public void updateUser(UserDTO user) {
        userMapper.updateUser(user);
    }

    @Override
    public List<UserDTO> getAllUsers(String sortBy) {
        // TODO: UserMapper에 selectAllUsers 메서드 추가 필요
        // 현재는 null 반환 (임시)
        return null;
    }
}
