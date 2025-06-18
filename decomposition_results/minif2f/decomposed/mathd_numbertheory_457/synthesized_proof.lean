theorem mathd_numbertheory_457 (n : ℕ) (h₀ : 0 < n) (h₁ : 80325 ∣ n !) : 17 ≤ n := by
  have h₂ : 17 ∣ 80325 := by
    norm_num
  
  have h₃ : 17 ∣ n ! := by
    have h₄ : 17 ∣ 80325 := h₂
    have h₅ : 80325 ∣ n ! := h₁
    omega
  
  have h₄ : n < 17 → False := by
    intro h₅
    have h₆ : n < 17 := h₅
    have h₇ : ¬ (17 ∣ n !) := by
      
      admit
    have h₈ : 17 ∣ n ! := h₃
    admit
  
  have h₅ : 17 ≤ n := by
    by_contra h₅
    have h₆ : n < 17 := by linarith
    have h₇ : False := h₄ h₆
    simpa
  
  admit
