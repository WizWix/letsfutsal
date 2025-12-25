package io.github.wizwix.letsfutsal.service;

import io.github.wizwix.letsfutsal.dto.UserDTO;
import java.util.List;

public interface IUserService {
    void register(UserDTO user);
    UserDTO login(String email, String password);
    UserDTO getUserById(Long userId);
    boolean isEmailExists(String email);
    void updateUser(UserDTO user);
    List<UserDTO> getAllUsers(String sortBy);
}
