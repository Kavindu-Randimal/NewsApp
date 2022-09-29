package com.example.demo.Controller;


import com.example.demo.Model.LoginUser;
import com.example.demo.Model.Users;
import com.example.demo.Repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("users")
public class UserController {

    @Autowired
    UsersRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<String> checkServer() {
        return null;
    }


    @GetMapping("/users/{name}")
    public ResponseEntity<Users> getUserById(@PathVariable(value = "name") Integer userName) {
        Users user = (Users) repo.findById(userName).get();
        if (user == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(user);
    }

    @PostMapping("/login")
    public ResponseEntity<LoginUser> persistPerson(@RequestBody Users user) {
        System.out.println("login called");
        System.out.println(user.getEmail()+ "  "+ user.getPassword());
        if (user.getEmail() == null || user.getPassword() == null) {
            return ResponseEntity.ok().body(new LoginUser(null, false, "User Email and Password Cant Be Null"));
        }
        Users returnedUser = repo.findUserByStatusAndNameNamedParamsNative(user.getEmail(), user.getPassword());
        if (returnedUser != null) {
            return ResponseEntity.status(HttpStatus.OK).body(new LoginUser(returnedUser.getEmail(), true, "Success"));
        } else {
            return ResponseEntity.ok().body(new LoginUser(null, false, "Login Fails"));
        }

    }

    @PostMapping("/signup")
    public ResponseEntity<LoginUser> signup(@RequestBody Users user) {
        System.out.println(user.getEmail() + "," + user.getPassword());
        List<Users> currentUser = repo.findByName(user.getEmail());
        if (!currentUser.isEmpty()) {
            return ResponseEntity.ok(new LoginUser(null, false, "email already Taken."));
        }

        if (user.getEmail() == null || user.getPassword() == null) {
            return ResponseEntity.ok().body(new LoginUser(null, false, "User Name Or Password Cant Be a Null Value."));
        }

        try {
            Users returnedUser = repo.save(user);
            if (returnedUser != null) {
                return ResponseEntity.ok(new LoginUser(returnedUser.getEmail(), true, "Success"));
            } else {
                return ResponseEntity.ok(new LoginUser(null, false, "Fail to create user"));
            }

        } catch (Exception ex) {
            System.out.println(ex);
            return ResponseEntity.ok(new LoginUser(null, false, "Fail to create user"));
        }

    }
}
