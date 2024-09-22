package com.POS.POS.repository;

import com.POS.POS.entity.CreditDebit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CreditDebitRepository extends JpaRepository<CreditDebit, Integer> {
}
