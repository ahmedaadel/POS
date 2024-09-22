package com.POS.POS.JPARepo;

import com.POS.POS.entity.CreditType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CreditTypeRepository extends JpaRepository<CreditType, Integer> {
}
