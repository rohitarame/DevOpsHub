package com.DevOpsHub.service;

import com.DevOpsHub.domain.User;
import com.DevOpsHub.repository.UserRepository;
import com.DevOpsHub.security.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;

    public String signup(String username, String email, String password) {
        if (userRepository.existsByEmail(email) || userRepository.existsByUsername(username)) {
            throw new IllegalArgumentException("User already exists");
        }

        User user = User.builder()
            .username(username)
            .email(email)
            .passwordHash(passwordEncoder.encode(password))
            .roles(Set.of("USER"))
            .createdAt(Instant.now())
            .updatedAt(Instant.now())
            .build();

        userRepository.save(user);
        return "User registered successfully";
    }

    public String login(String email, String password) {
        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, password));
        User user = userRepository.findByEmail(email)
            .orElseThrow(() -> new IllegalArgumentException("User not found"));
        return jwtService.generateToken(org.springframework.security.core.userdetails.User.withUsername(user.getEmail())
            .password(user.getPasswordHash())
            .authorities(user.getRoles().stream().map(role -> new org.springframework.security.core.authority.SimpleGrantedAuthority("ROLE_" + role)).toList())
            .build());
    }
}
