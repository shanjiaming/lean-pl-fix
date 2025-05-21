theorem prime_congruent_1_mod_6_has_quadratic_form (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) :
  ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
  have h_main : p > 0 := by
    have h₁ : p ≥ 2 := by
      -- Use the fact that p is a prime number to deduce that p ≥ 2.
      have h₂ := hp.two_le
      norm_cast at h₂ ⊢
      <;> omega
    -- Since p ≥ 2 and p is a prime number, p must be positive.
    have h₂ : p > 0 := by linarith
    exact h₂
  
  have h_nat_prime : Nat.Prime (Int.natAbs p) := by
    have h₁ : (p : ℤ) > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p) := by
      -- Use the property that if p is a prime integer, then its absolute value is a prime natural number.
      have h₃ : Int.Prime p := by
        -- Prove that p is a prime integer using the given condition.
        have h₃ : Prime p := hp
        exact?
      -- Use the property that if p is a prime integer, then its absolute value is a prime natural number.
      exact Int.prime_iff_natAbs_prime.mp h₃
    exact h₂
  
  have h_p_eq_natAbs : p = (Int.natAbs p : ℤ) := by
    have h₁ : p > 0 := h_main
    have h₂ : p = (Int.natAbs p : ℤ) := by
      rw [Int.natAbs_of_nonneg]
      <;> linarith
    exact h₂
  
  have h_exists_rep : ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
    have h₁ : p > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p) := h_nat_prime
    have h₃ : p = (Int.natAbs p : ℤ) := h_p_eq_natAbs
    -- Use the fact that p is a prime number to find integers a and b such that p = a² - a * b + b²
    have h₄ : ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
      -- Use the fact that p is a prime number to find integers a and b such that p = a² - a * b + b²
      have h₅ : (p : ℤ) > 0 := by linarith
      have h₆ : (p : ℤ) % 6 = 1 := by simpa using hp_mod_6
      have h₇ : (p : ℕ) % 6 = 1 := by
        norm_cast at h₆ ⊢
        <;> omega
      have h₈ : ∃ (a b : ℤ), (p : ℤ) = a^2 - a * b + b^2 := by
        -- Use the fact that p is a prime number to find integers a and b such that p = a² - a * b + b²
        have h₉ : ∃ (x y : ℤ), (p : ℤ) = x^2 + 3 * y^2 := by
          -- Use the fact that p is a prime number to find integers x and y such that p = x² + 3 * y²
          have h₁₀ : (p : ℕ) % 6 = 1 := by simpa using h₇
          -- Use the fact that p is a prime number to find integers x and y such that p = x² + 3 * y²
          have h₁₁ : ∃ (x y : ℤ), (p : ℤ) = x^2 + 3 * y^2 := by
            -- Use the fact that p is a prime number to find integers x and y such that p = x² + 3 * y²
            use (p : ℤ), 0
            <;> ring_nf at *
            <;> norm_num at *
            <;>
            (try omega) <;>
            (try nlinarith) <;>
            (try ring_nf at * <;> norm_num at * <;> omega)
            <;>
            (try
              {
                simp_all [Int.emod_eq_of_lt]
                <;> omega
              })
          exact h₁₁
        -- Use the fact that p is a prime number to find integers a and b such that p = a² - a * b + b²
        obtain ⟨x, y, h₉⟩ := h₉
        use (x + y), (2 * y)
        have h₁₀ : (p : ℤ) = x ^ 2 + 3 * y ^ 2 := by
          simpa using h₉
        ring_nf at *
        <;> nlinarith
      -- Use the fact that p is a prime number to find integers a and b such that p = a² - a * b + b²
      simpa using h₈
    -- Use the fact that p is a prime number to find integers a and b such that p = a² - a * b + b²
    simpa using h₄
  -- Use the fact that p is a prime number to find integers a and b such that p = a² - a * b + b²
  simpa using h_exists_rep