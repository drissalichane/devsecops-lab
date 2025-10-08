package com.example.vulnerable.repository;

import com.example.vulnerable.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repository interface for User entity.
 * Spring Data JPA automatically implements this interface.
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Spring Data JPA will automatically implement these methods
    User findByUsername(String username);
}