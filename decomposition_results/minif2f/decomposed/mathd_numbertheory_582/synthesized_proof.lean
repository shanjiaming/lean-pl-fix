theorem mathd_numbertheory_582 (n : ℕ) (h₀ : 0 < n) (h₁ : 3 ∣ n) :
    (n + 4 + (n + 6) + (n + 8)) % 9 = 0 := by
  have h₂ : (n + 4 + (n + 6) + (n + 8)) = 3 * n + 18 := by
    have h₂₁ : n + 4 + (n + 6) + (n + 8) = 3 * n + 18 := by
      have h₂₂ : n + 4 + (n + 6) + (n + 8) = (n + 4 + (n + 6)) + (n + 8) := by
        norm_num
      rw [h₂₂]
      have h₂₃ : n + 4 + (n + 6) = 2 * n + 10 := by
        linarith
      rw [h₂₃]
      have h₂₄ : (2 * n + 10) + (n + 8) = 3 * n + 18 := by
        linarith
      linarith
    linarith
  
  have h₃ : (n + 4 + (n + 6) + (n + 8)) % 9 = 0 := by
    rw [h₂]
    have h₄ : 3 ∣ n := h₁
    have h₅ : n % 9 = 0 ∨ n % 9 = 3 ∨ n % 9 = 6 := by
      
      have h₅₁ : n % 9 = 0 ∨ n % 9 = 3 ∨ n % 9 = 6 := by
        omega
      omega
    omega
  
  linarith
