package com.POS.POS.repository;

import com.POS.POS.entity.Addition;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdditionsRepository extends JpaRepository<Addition, Integer> {
}
