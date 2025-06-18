theorem mathd_numbertheory_559 (x y : ℕ) (h₀ : x % 3 = 2) (h₁ : y % 5 = 4) (h₂ : x % 10 = y % 10) :
    14 ≤ x := by
  have h₃ : x % 10 = 4 ∨ x % 10 = 9 := by
    have h₄ : (x % 10) % 5 = 4 := by
      have h₅ : (y % 10) % 5 = y % 5 := by
        have h₅₁ : y % 10 % 5 = y % 5 := by
          norm_num
        norm_num
      have h₅₂ : (x % 10) % 5 = (y % 10) % 5 := by
        omega
      have h₅₃ : (y % 10) % 5 = 4 := by
        linarith
      linarith
    have h₆ : x % 10 = 4 ∨ x % 10 = 9 := by
      have h₇ : x % 10 < 10 := Nat.mod_lt _ (by norm_num)
      omega
    omega
  
  have h₄ : 14 ≤ x := by
    have h₅ : x % 3 = 2 := h₀
    have h₆ : x % 10 = 4 ∨ x % 10 = 9 := h₃
    by_contra h₇
    
    have h₈ : x < 14 := by
      linarith
    
    omega
  linarith
