theorem mathd_numbertheory_99 (n : ℕ) (h₀ : 2 * n % 47 = 15) : n % 47 = 31 := by
  have h₁ : n % 47 = 31 := by
    have h₂ : (2 * (n % 47)) % 47 = 15 := by
      have h₃ : (2 * n) % 47 = 15 := h₀
      have h₄ : (2 * n) % 47 = (2 * (n % 47)) % 47 := by
        norm_num
      admit
    
    have h₅ : n % 47 < 47 := Nat.mod_lt n (by norm_num)
    omega
  
  admit
