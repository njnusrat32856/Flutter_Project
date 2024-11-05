package com.nusrat.BmsBank.service;

import com.nusrat.BmsBank.entity.AuthResponse;
import com.nusrat.BmsBank.entity.Role;
import com.nusrat.BmsBank.entity.Token;
import com.nusrat.BmsBank.entity.User;
import com.nusrat.BmsBank.jwt.JwtService;
import com.nusrat.BmsBank.repository.TokenRespository;
import com.nusrat.BmsBank.repository.UserRepository;
import jakarta.mail.MessagingException;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final PasswordEncoder passwordEncoder;

    @Autowired
    private final UserRepository userRepository;

    private final JwtService jwtService;

//    @Value("src/main/resources/static/images")
//    private String uploadDir;
    @Value("${image.upload.dir}")
    private String uploadDir;

    private final TokenRespository tokenRespository;

    private final AuthenticationManager authenticationManager;

    private final UserService userService;

//    private final EmailService emailService;

    private void saveUserToken(String jwt, User user) {

        Token token = new Token();
        token.setToken(jwt);
        token.setLoggedOut(false);
        token.setUser(user);

        tokenRespository.save(token);
    }
    private void revokeAllTokenByUser(User user) {

        List<Token> validTokens = tokenRespository.findAllTokensByUserId(user.getId());
        if (validTokens.isEmpty()) {
            return;
        }
        validTokens.forEach(t -> {
            t.setLoggedOut(true);
        });
        tokenRespository.saveAll(validTokens);
    }
    public AuthResponse register(User user,MultipartFile imageFile) throws IOException {
        if (userRepository.findByEmail(user.getUsername()).isPresent()) {
            return new AuthResponse(null, "User already exists", null);

        }
        if(imageFile != null && !imageFile.isEmpty()) {

            String imageFileName = saveImage(imageFile);

            user.setImage(imageFileName);
        }
//
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setAccountNumber(userService.generateUniqueAccountNumber());
        user.setRole(Role.valueOf("USER"));
        user.setLock(true);
        user.setStatus(true);


        userRepository.save(user);

        String jwt = jwtService.generateToken(user);
        saveUserToken(jwt, user);
//        sendActivationEmail(user);

        return new AuthResponse(jwt, "User registration was successful", null);
    }

    public AuthResponse registerAdmin(User user) {
        if (userRepository.findByEmail(user.getUsername()).isPresent()) {
            return new AuthResponse(null, "Admin already exists", null);

        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(Role.valueOf("ADMIN"));
        user.setLock(false);
        user.setStatus(true);
        userRepository.save(user);
        String jwt = jwtService.generateToken(user);
        saveUserToken(jwt, user);


        return new AuthResponse(jwt, "Admin registration was successful", null);
    }
    public AuthResponse authenticate(User request) {

         authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );
        User user = userRepository.findByEmail(request.getUsername())
                .orElseThrow();

        String jwt = jwtService.generateToken(user);

        revokeAllTokenByUser(user);

        saveUserToken(jwt, user);

//        user.setPassword(null);
//        user.setTokens(null);
        return new AuthResponse(jwt,"User login was successful", user);
    }

//    private void sendActivationEmail(User user) {
//        String activationLink = "http://localhost:8084/activate/" + user.getId();
//
//        String mailText = "<h3>Dear " + user.getFirstName()+ user.getLastName()
//                + ",</h3>"
//                + "<p>Please click on the following link to confirm your account:</p>"
//                + "<a href=\"" + activationLink + "\">Activate Account</a>"
//                + "<br><br>Regards,<br>Hotel Booking";
//
//        String subject = "Confirm User Account";
//
//        try {
//
//            emailService.sendSimpleEmail(user.getEmail(), subject, mailText);
//
//        } catch (MessagingException e) {
//            throw new RuntimeException(e);
//        }
//    }
    public String activateUser(long id) {

        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not Found with this ID"));

        if (user != null) {

            user.setStatus(true);
            //  user.setActivationToken(null); // Clear token after activation
            userRepository.save(user);
            return "User activated successfully!";
        } else {
            return "Invalid activation token!";
        }
    }
    private String saveImage(MultipartFile file) throws IOException {
        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Generate a unique filename
        String filename =  UUID.randomUUID() +"_"+file.getOriginalFilename().toString();
        Path filePath = uploadPath.resolve(filename);

        // Save the file
        Files.copy(file.getInputStream(), filePath);

        return filename; // Return the filename for storing in the database
    }
}
