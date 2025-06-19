theorem mathd_numbertheory_247 (n : ℕ) (h₀ : 3 * n % 11 = 2) : n % 11 = 8 := by
  have h₁ : n % 11 = 8 := by
    have h₂ : 3 * (n % 11) % 11 = 2 := by
      have h₃ : 3 * n % 11 = 2 := h₀
      have h₄ : 3 * (n % 11) % 11 = 3 * n % 11 := by
        have h₅ : 3 * (n % 11) % 11 = (3 * n) % 11 := by
          have h₆ : 3 * (n % 11) = (3 * n) % 33 := by
            omega
          have h₇ : (3 * n) % 33 % 11 = (3 * n) % 11 := by
            norm_num
          norm_num
        norm_num
      linarith
    
    have h₈ : n % 11 = 0 ∨ n % 11 = 1 ∨ n % 11 = 2 ∨ n % 11 = 3 ∨ n % 11 = 4 ∨ n % 11 = 5 ∨ n % 11 = 6 ∨ n % 11 = 7 ∨ n % 11 = 8 ∨ n % 11 = 9 ∨ n % 11 = 10 := by
      omega
    omega
  linarith
