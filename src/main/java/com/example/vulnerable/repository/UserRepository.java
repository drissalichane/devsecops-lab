package com.example.vulnerable.repository;

import com.example.vulnerable.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Repository interface for User entity.
 * Spring Data JPA automatically implements this interface.
 
    */

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    
    // NEW: Safe query method for searching users
    // Spring Data JPA automatically creates a safe parameterized query
    List<User> findByUsernameContaining(String username);
}
