theorem mathd_numbertheory_175 : 2 ^ 2010 % 10 = 4 := by
  have h₀ : (2 ^ 2010 : ℕ) % 10 = 4 := by
    have h₁ : ∀ n : ℕ, n ≥ 1 → 6 ^ n % 10 = 6 := by
      admit
    have h₂ : (2 ^ 4 : ℕ) % 10 = 6 := by norm_num
    have h₃ : (2 ^ 2010 : ℕ) % 10 = 4 := by
      have h₄ : (2 ^ 2010 : ℕ) = (2 ^ 4) ^ 502 * 2 ^ 2 := by
        norm_num
      rw [h₄]
      have h₅ : ((2 ^ 4 : ℕ) ^ 502 * 2 ^ 2 : ℕ) % 10 = 4 := by
        have h₅₁ : ((2 ^ 4 : ℕ) ^ 502 * 2 ^ 2 : ℕ) % 10 = ((2 ^ 4 : ℕ) ^ 502 % 10 * (2 ^ 2 % 10)) % 10 := by
          norm_num
        rw [h₅₁]
        have h₅₂ : (2 ^ 4 : ℕ) ^ 502 % 10 = 6 := by
          have h₅₂₁ : (2 ^ 4 : ℕ) % 10 = 6 := by norm_num
          have h₅₂₂ : (2 ^ 4 : ℕ) ^ 502 % 10 = 6 := by
            norm_num
          norm_num
        have h₅₃ : (2 ^ 2 : ℕ) % 10 = 4 := by norm_num
        norm_num
      norm_num
    norm_num
  norm_num
