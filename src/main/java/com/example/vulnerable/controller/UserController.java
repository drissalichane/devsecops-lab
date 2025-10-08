package com.example.vulnerable.controller;

import com.example.vulnerable.model.User;
import com.example.vulnerable.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * REST Controller for user management operations.
 * WARNING: This controller contains intentional security vulnerabilities for educational purposes.
 */
@RestController
@RequestMapping("/api/users")
public class UserController {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    /**
     * Get all users - This endpoint is safe.
     */
    @GetMapping
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    
    /**
     * Create a new user - This endpoint is safe.
     */
    @PostMapping
    public User createUser(@RequestBody User user) {
        return userRepository.save(user);
    }
    
    /**
     * VULNERABLE ENDPOINT: SQL Injection vulnerability
     * This method concatenates user input directly into a SQL query.
     * An attacker could input: ' OR '1'='1
     * This would return all users instead of searching for a specific username.
     */
    @GetMapping("/search")
    public List<Map<String, Object>> searchUsers(@RequestParam String username) {
        // VULNERABILITY: String concatenation in SQL query allows SQL injection
        String sql = "SELECT * FROM users WHERE username = '" + username + "'";
        return jdbcTemplate.queryForList(sql);
    }
    
    /**
     * Get user by ID - This endpoint is safe because it uses Spring Data JPA.
     */
    @GetMapping("/{id}")
    public User getUserById(@PathVariable Long id) {
        return userRepository.findById(id).orElse(null);
    }
}