package com.example.demo.Repository;

import com.example.demo.Model.Users;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UsersRepository extends CrudRepository<Users, Integer> {

    @Query(value = "SELECT * FROM Users u WHERE u.Email = :email and u.Password = :password",
            nativeQuery = true)
    Users findUserByStatusAndNameNamedParamsNative(
            @Param("email") String email, @Param("password") String password);

    @Query(value = "SELECT * FROM Users u WHERE u.Email = :email",
            nativeQuery = true)
    List<Users> findByName(@Param("email") String email);
}
