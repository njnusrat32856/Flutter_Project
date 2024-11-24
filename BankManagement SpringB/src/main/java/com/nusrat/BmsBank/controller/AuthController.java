package com.nusrat.BmsBank.controller;

import com.nusrat.BmsBank.entity.AuthResponse;
import com.nusrat.BmsBank.entity.User;
import com.nusrat.BmsBank.service.AuthService;
import lombok.AllArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@AllArgsConstructor

public class AuthController {

    private final AuthService authService;

//    @GetMapping("/user-profile")
//    public ResponseEntity<User> getCurrentUser(@AuthenticationPrincipal User user) {
//        return ResponseEntity.ok(user);
//    }

    @PostMapping(value = "/register", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<AuthResponse> register(
            @RequestBody User request,
            @RequestParam(value = "image", required = false) MultipartFile imagefile
            ) throws IOException {
        return ResponseEntity.ok(authService.register(request, imagefile));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody User request) {
        return ResponseEntity.ok(authService.authenticate(request));
    }

    @GetMapping("/activate/{id}")
    public ResponseEntity<String> activateUser(@PathVariable("id") long id) {
        String response = authService.activateUser(id);
        return ResponseEntity.ok(response);
    }
    @PostMapping("/register/admin")
    public ResponseEntity<AuthResponse> registerAdmin(
            @RequestBody User request
    ) {
        return ResponseEntity.ok(authService.registerAdmin(request));
    }
}
