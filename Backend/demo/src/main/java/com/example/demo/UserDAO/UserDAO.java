package com.example.demo.UserDAO;

import com.example.demo.Model.Users;
import com.example.demo.Repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDAO {
    @Autowired
    UsersRepository usersRepository;

    //    for save data
    public Users save(Users user){
        return usersRepository.save(user);
    }
}
