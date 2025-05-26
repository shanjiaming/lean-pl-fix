theorem h₁ (x : ℝ) (hx : x > 0) : Real.log x ≤ 0 ↔ x ≤ 1 := by
  constructor
  · intro h
    by_contra h₂
    have h₃ : x > 1 := by sorry
    have h₄ : log x > 0 := log_pos h₃
    linarith
  · intro h
    by_cases h₂ : x < 1
    ·
      have h₃ : log x < 0 := log_neg hx h₂
      linarith
    ·
      have h₃ : x = 1 := by sorry
      rw [h₃]
      norm_num <;> simp_all [log_one] <;> linarith